package BP.WF.Template;

import BP.En.EnType;
import BP.En.EntityMyPK;
import BP.En.Map;
import BP.WF.TodolistModel;

/** 
 自定义运行路径
*/
public class TransferCustom extends EntityMyPK
{
		///#region 属性
	/** 
	 节点ID
	*/
	public final int getFK_Node()
	{
		return this.GetValIntByKey(TransferCustomAttr.FK_Node);
	}
	public final void setFK_Node(int value)
	{
		this.SetValByKey(TransferCustomAttr.FK_Node, value);
	}
	public final long getWorkID()
	{
		return this.GetValInt64ByKey(TransferCustomAttr.WorkID);
	}
	public final void setWorkID(long value)
	{
		this.SetValByKey(TransferCustomAttr.WorkID, value);
	}
    
	/** 
	 计划完成日期
	*/
	public final String getPlanDT()
	{
		return this.GetValStringByKey(TransferCustomAttr.PlanDT);
	}
	public final void setPlanDT(String value)
	{
		this.SetValByKey(TransferCustomAttr.PlanDT, value);
	}

	/** 
	 处理人
	*/
	public final String getWorker()
	{
		return this.GetValStringByKey(TransferCustomAttr.Worker);
	}
	public final void setWorker(String value)
	{
		this.SetValByKey(TransferCustomAttr.Worker, value);
	}
	/** 
	 处理人显示（多个人用逗号分开）
	*/
	public final String getWorkerName()
	{
		return this.GetValStringByKey(TransferCustomAttr.WorkerName);
	}
	public final void setWorkerName(String value)
	{
		this.SetValByKey(TransferCustomAttr.WorkerName, value);
	}
	/** 
	 要启用的子流程编号
	*/
	public final String getSubFlowNo()
	{
		return this.GetValStringByKey(TransferCustomAttr.SubFlowNo);
	}
	public final void setSubFlowNo(String value)
	{
		this.SetValByKey(TransferCustomAttr.SubFlowNo, value);
	}
	/** 
	 顺序
	*/
	public final int getIdx()
	{
		return this.GetValIntByKey(TransferCustomAttr.Idx);
	}
	public final void setIdx(int value)
	{
		this.SetValByKey(TransferCustomAttr.Idx, value);
	}
	
	
	/** 
	 多人处理工作模式
	*/
	public final TodolistModel getTodolistModel()
	{
		return TodolistModel.forValue(this.GetValIntByKey(TransferCustomAttr.TodolistModel));
	}
	public final void setTodolistModel(TodolistModel value)
	{
		this.SetValByKey(TransferCustomAttr.TodolistModel, value.getValue());
	}
	/** 
	 发起时间（可以为空）
	*/
	public final String getStartDT()
	{
		return this.GetValStringByKey(TransferCustomAttr.StartDT);
	}
	public final void setStartDT(String value)
	{
		this.SetValByKey(TransferCustomAttr.StartDT, value);
	}
	
	
		///#endregion

		///#region 构造函数
	/** 
	 TransferCustom
	*/
	public TransferCustom()
	{
	}
	/** 
	 重写基类方法
	*/
	@Override
	public Map getEnMap()
	{
		if (this.get_enMap() != null)
		{
			return this.get_enMap();
		}
		Map map = new Map("WF_TransferCustom", "自定义运行路径");
		map.Java_SetEnType(EnType.Admin);

		map.AddMyPK(); //唯一的主键.

			//主键.
		map.AddTBInt(TransferCustomAttr.WorkID, 0, "WorkID", true, false);
		map.AddTBInt(TransferCustomAttr.FK_Node, 0, "节点ID", true, false);
		map.AddTBString(TransferCustomAttr.Worker, null, "处理人(多个人用逗号分开)", true, false, 0, 200, 10);
		map.AddTBString(TransferCustomAttr.WorkerName, null, "处理人(多个人用逗号分开)", true, false, 0, 200, 10);
		
		map.AddTBString(TransferCustomAttr.SubFlowNo, null, "要经过的子流程编号", true, false, 0, 3, 10);
		map.AddTBDateTime(TransferCustomAttr.PlanDT, null, "计划完成日期", true, false);
		map.AddTBInt(TransferCustomAttr.Idx, 0, "顺序号", true, false);

		map.AddTBInt(TransferCustomAttr.TodolistModel, 0, "多人工作处理模式", true, false);


			//map.AddTBString(TransferCustomAttr.StartDT, null, "发起时间", true, false, 0, 20, 10);

		this.set_enMap(map);
		return this.get_enMap();
	}
		///#endregion

	/** 
	 获取下一个要到达的定义路径.
	 要分析如下几种情况:
	 1, 当前节点不存在队列里面，就返回第一个.
	 2, 如果当前队列为空,就认为需要结束掉, 返回null.
	 3, 如果当前节点是最后一个,就返回null,表示要结束流程.
	 
	 @param workid 当前工作ID
	 @param currNodeID 当前节点ID
	 @return 获取下一个要到达的定义路径,如果没有就返回空.
	*/
	public static TransferCustom GetNextTransferCustom(long workid, int currNodeID)
	{
		TransferCustoms ens = new TransferCustoms();
		ens.Retrieve(TransferCustomAttr.WorkID, workid, TransferCustomAttr.Idx);
		if (ens.size() == 0)
		{
			return null;
		}
		 
		
		//寻找当前节点的下一个. 
        boolean isMeet = false;
        for (TransferCustom item : ens.ToJavaList())
        {
            if (item.getFK_Node() == currNodeID)
            {
                isMeet = true;
                continue;
            }

            if (isMeet == true)
                return item;
        }
   
        if (  getcurrNodeID().toString().endsWith("01") == true)
        	return (TransferCustom)ens.get(0);
        return null;
	}
	private static Object getcurrNodeID() {
		// TODO Auto-generated method stub
		return null;
	}
}