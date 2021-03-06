package BP.WF.DTS;

import java.io.File;

import BP.DA.DataSet;
import BP.En.Method;
import BP.Sys.SystemConfig;
import BP.Sys.Frm.MapData;
import BP.WF.Flow;
import BP.WF.ImpFlowTempleteModel;
import BP.WF.Template.FlowSort;
import BP.WF.Template.FlowSorts;
import BP.WF.Template.SysFormTree;
import BP.WF.Template.SysFormTrees;
import BP.Web.WebUser;

/**
 * Method 的摘要说明
 */
public class LoadTemplete extends Method
{
	/**
	 * 不带有参数的方法
	 */
	public LoadTemplete()
	{
		this.Title = "装载流程演示模板";
		this.Help = "为了帮助各位爱好者学习与掌握ccflow, 特提供一些流程模板与表单模板以方便学习。";
		this.Help += "@这些模板的位于" + SystemConfig.getPathOfData() + "/FlowDemo/";
	}
	
	/**
	 * 设置执行变量
	 * 
	 * @return
	 */
	@Override
	public void Init()
	{
	}
	
	/**
	 * 当前的操纵员是否可以执行这个方法
	 */
	@Override
	public boolean getIsCanDo()
	{
		if (WebUser.getNo().equals("admin"))
		{
			return true;
		} else
		{
			return false;
		}
	}
	
	@Override
	public Object Do()
	{
		String msg = "";
		
		// #region 处理表单.
		// 调度表单文件。
		SysFormTrees fss = new SysFormTrees();
		try
		{
			fss.ClearTable();
		} catch (Exception e1)
		{
			e1.printStackTrace();
		}
		
		// 创建root.
		SysFormTree root = new SysFormTree();
		root.setNo("0");
		root.setName("表单库");
		root.setParentNo("-1");
		root.Insert();
		
		String frmPath = SystemConfig.getPathOfData() + "FlowDemo/Form/";
		File dirInfo = new File(frmPath);
		File[] dirs = dirInfo.listFiles();
		int i = 0;
		for (File item : dirs)
		{
			if (item.getName().indexOf(".svn") >= 0)
			{
				continue;
			}
			
			File[] fls = item.listFiles();
			if (fls.length == 0)
			{
				continue;
			}
			
			SysFormTree fs = new SysFormTree();
			fs.setNo(item.getName().substring(0, 2));
			fs.setName(item.getName().substring(3));
			fs.setParentNo("0");
			fs.setIdx(i++);
			fs.Insert();
			
			for (File f : fls)
			{
				msg += "@开始调度表单模板文件:" + f;
				// System.IO.FileInfo info = new System.IO.FileInfo(f);
				if (!(f.getName().indexOf(".xml") >= 0))
				{
					continue;
				}
				
				DataSet ds = new DataSet();
				ds.readXml(f.getPath());
				try
				{
					MapData md = MapData.ImpMapData(ds, false);
					md.setFK_FrmSort(fs.getNo());
					md.Update();
				} catch (RuntimeException ex)
				{
					throw new RuntimeException("@装载模版文件:" + f + "出现错误,"
							+ ex.getMessage() + " <br> " + ex.getStackTrace());
				} catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		}
		// #endregion 处理表单.
		
		// #region 处理流程.
		FlowSorts sorts = new FlowSorts();
		try
		{
			sorts.ClearTable();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		dirInfo = new File(SystemConfig.getPathOfData() + "/FlowDemo/Flow/");
		dirs = dirInfo.listFiles();
		
		FlowSort fsRoot = new FlowSort();
		fsRoot.setNo("99");
		fsRoot.setName("流程树");
		fsRoot.setParentNo("0");
		fsRoot.DirectInsert();
		
		for (File dir : dirs)
		{
			if (dir.getName().contains(".svn"))
			{
				continue;
			}
			
			File[] fls = dir.listFiles();
			if (fls.length == 0)
			{
				continue;
			}
			
			FlowSort fs = new FlowSort();
			fs.setNo(dir.getName().substring(0, 2));
			fs.setName(dir.getName().substring(3));
			fs.setParentNo(fsRoot.getNo());
			fs.Insert();
			
			for (File filePath : fls)
			{
				//判断路径名是否为文件 by fanleiwei 20160423
				if(!filePath.getPath().endsWith("xml"))
				{
					continue;
				}
				msg += "@开始调度流程模板文件:" + filePath;
				Flow myflow = Flow.DoLoadFlowTemplate(fs.getNo(),
						filePath.getPath(),
						ImpFlowTempleteModel.AsTempleteFlowNo);
				msg += "@流程:" + myflow.getName() + "装载成功。";
				
				myflow.setName(filePath.getName().replace(".xml", ""));
				// myflow.setName(info.getName().Replace(".xml", ""));
				if (myflow.getName().substring(2, 3).equals("."))
				{
					myflow.setName(myflow.getName().substring(3));
				}
				myflow.DirectUpdate();
			}
			
			// 调度它的下一级目录.
			File dirSubInfo = new File(SystemConfig.getPathOfData()
					+ "/FlowDemo/Flow/" + dir.getName());
			File[] myDirs = dirSubInfo.listFiles();
			for (File mydir : myDirs)
			{
				if (mydir.getName().indexOf(".svn") >= 0)
				{
					continue;
				}
				
				File[] myfls = mydir.listFiles();
				//增加数组非空判断 by fanleiwei 20160423
				if (myfls == null ||myfls.length == 0)
				{
					continue;
				}
				
				// 流程类别.
				Object tempVar = fs.DoCreateSubNode();
				FlowSort subFlowSort = (FlowSort) ((tempVar instanceof FlowSort) ? tempVar
						: null);
				subFlowSort.setName(mydir.getName().substring(3));
				subFlowSort.Update();
				
				for (File filePath : myfls)
				{
					msg += "@开始调度流程模板文件:" + filePath;
					Flow myflow = Flow.DoLoadFlowTemplate(subFlowSort.getNo(),
							filePath.getPath(),
							ImpFlowTempleteModel.AsTempleteFlowNo);
					msg += "@流程:" + myflow.getName() + "装载成功。";
					
					myflow.setName(filePath.getName().replace(".xml", ""));
					if (myflow.getName().substring(2, 3).equals("."))
					{
						myflow.setName(myflow.getName().substring(3));
					}
					myflow.DirectUpdate();
				}
			}
			
		}
		// #endregion处理流程.
		
		BP.DA.Log.DefaultLogWriteLineInfo(msg);
		
		// 删除多余的空格.
		BP.WF.DTS.DeleteBlankGroupField dts = new DeleteBlankGroupField();
		dts.Do();
		
		return msg;
	}
}