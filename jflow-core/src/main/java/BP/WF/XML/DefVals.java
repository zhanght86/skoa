package BP.WF.XML;

import java.util.List;

import BP.En.Attr;
import BP.En.Entities;
import BP.Sys.SystemConfig;
import BP.XML.XmlEn;
import BP.XML.XmlEns;

/** 
 默认值s
*/
public class DefVals extends XmlEns
{
		///#region 构造

	/** 
	 考核率的数据元素
	*/
	public DefVals()
	{
	}
		///#endregion

		///#region 重写基类属性或方法。
	/** 
	 得到它的 Entity 
	*/
	@Override
	public XmlEn getGetNewEntity()
	{
		return new DefVal();
	}
	@Override
	public String getFile()
	{
		return SystemConfig.getPathOfData() + "Xml/DefVal.xml";
	}
	/** 
	 物理表名
	*/
	@Override
	public String getTableName()
	{
		return "Item";
	}
	@Override
	public Entities getRefEns()
	{
		return null; //new BP.ZF1.AdminDefVals();
	}
		///#endregion
	public List<DefVal> ToJavaList()
	{
		return (List<DefVal>)(Object)this;
	}
}