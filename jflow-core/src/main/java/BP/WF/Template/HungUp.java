package BP.WF.Template;

import BP.En.EnType;
import BP.En.EntityMyPK;
import BP.En.Map;
import BP.Tools.StringHelper;
import BP.WF.HungUpWay;

/** 
 挂起
*/
public class HungUp extends EntityMyPK
{
		///#region 属性
	public final HungUpWay getHungUpWay()
	{
		return HungUpWay.forValue(this.GetValIntByKey(HungUpAttr.HungUpWay));
	}
	public final void setHungUpWay(HungUpWay value)
	{
		this.SetValByKey(HungUpAttr.HungUpWay, value.getValue());
	}
	public final int getFK_Node()
	{
		return this.GetValIntByKey(HungUpAttr.FK_Node);
	}
	public final void setFK_Node(int value)
	{
		this.SetValByKey(HungUpAttr.FK_Node, value);
	}
	public final long getWorkID()
	{
		return this.GetValInt64ByKey(HungUpAttr.WorkID);
	}
	public final void setWorkID(long value)
	{
		this.SetValByKey(HungUpAttr.WorkID, value);
	}
	/** 
	 挂起标题
	*/
	public final String getTitle()
	{
		String s = this.GetValStringByKey(HungUpAttr.Title);
		if (StringHelper.isNullOrEmpty(s))
		{
			s = "来自@Rec的挂起信息.";
		}
		return s;
	}
	public final void setTitle(String value)
	{
		this.SetValByKey(HungUpAttr.Title, value);
	}
	/** 
	 挂起原因
	*/
	public final String getNote()
	{
	   return this.GetValStringByKey(HungUpAttr.Note);
	}
	public final void setNote(String value)
	{
		this.SetValByKey(HungUpAttr.Note, value);
	}
	public final String getRec()
	{
		return this.GetValStringByKey(HungUpAttr.Rec);
	}
	public final void setRec(String value)
	{
		this.SetValByKey(HungUpAttr.Rec, value);
	}
	/** 
	 解除挂起时间
	*/
	public final String getDTOfUnHungUp()
	{
		return this.GetValStringByKey(HungUpAttr.DTOfUnHungUp);
	}
	public final void setDTOfUnHungUp(String value)
	{
		this.SetValByKey(HungUpAttr.DTOfUnHungUp, value);
	}
	/** 
	 预计解除挂起时间
	*/
	public final String getDTOfUnHungUpPlan()
	{
		return this.GetValStringByKey(HungUpAttr.DTOfUnHungUpPlan);
	}
	public final void setDTOfUnHungUpPlan(String value)
	{
		this.SetValByKey(HungUpAttr.DTOfUnHungUpPlan, value);
	}
	/** 
	 解除挂起时间
	*/
	public final String getDTOfHungUp()
	{
		return this.GetValStringByKey(HungUpAttr.DTOfHungUp);
	}
	public final void setDTOfHungUp(String value)
	{
		this.SetValByKey(HungUpAttr.DTOfHungUp, value);
	}
		///#endregion

		///#region 构造函数
	/** 
	 挂起
	*/
	public HungUp()
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

		Map map = new Map("WF_HungUp", "挂起");
		map.Java_SetEnType(EnType.Admin);

		map.AddMyPK();
		map.AddTBInt(HungUpAttr.FK_Node, 0, "节点ID", true, true);
		map.AddTBInt(HungUpAttr.WorkID, 0, "WorkID", true, true);
		map.AddDDLSysEnum(HungUpAttr.HungUpWay, 0, "挂起方式", true, true, HungUpAttr.HungUpWay, "@0=无限挂起@1=按指定的时间解除挂起并通知我自己@2=按指定的时间解除挂起并通知所有人");

		map.AddTBStringDoc(HungUpAttr.Note, null, "挂起原因(标题与内容支持变量)", true, false, true);

		map.AddTBString(HungUpAttr.Rec, null, "挂起人", true, false, 0, 50, 10, true);

		map.AddTBDateTime(HungUpAttr.DTOfHungUp, null, "挂起时间", true, false);
		map.AddTBDateTime(HungUpAttr.DTOfUnHungUp, null, "实际解除挂起时间", true, false);
		map.AddTBDateTime(HungUpAttr.DTOfUnHungUpPlan, null, "预计解除挂起时间", true, false);

		this.set_enMap(map);
		return this.get_enMap();
	}
	/** 
	 执行释放挂起
	*/
	public final void DoRelease()
	{
	}
		///#endregion
}