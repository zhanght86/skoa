package BP.WF.Data;

import java.util.*;
import BP.En.*;
import BP.WF.Template.*;
import BP.Sys.*;
import BP.WF.*;

/** 
  属性
*/
public class GERptAttr
{
	/** 
	 工作实例ID
	*/
	public static final String OID = "OID";
	/** 
	 流程ID
	*/
	public static final String FID = "FID";
	/** 
	 标题
	*/
	public static final String Title = "Title";
	/** 
	 参与人员
	*/
	public static final String FlowEmps = "FlowEmps";
	/** 
	 发起年月
	*/
	public static final String FK_NY = "FK_NY";
	/** 
	 发起人编号
	*/
	public static final String FlowStarter = "FlowStarter";
	/** 
	 发起日期
	*/
	public static final String FlowStartRDT = "FlowStartRDT";
	/** 
	 发起人部门编号
	*/
	public static final String FK_Dept = "FK_Dept";
	/** 
	 流程状态(详细状态)
	*/
	public static final String WFState = "WFState";
	/** 
	 流程状态(概要状态)
	*/
	public static final String WFSta = "WFSta";
	/** 
	 结束人
	*/
	public static final String FlowEnder = "FlowEnder";
	/** 
	 最后活动日期
	*/
	public static final String FlowEnderRDT = "FlowEnderRDT";
	/** 
	 跨度
	*/
	public static final String FlowDaySpan = "FlowDaySpan";
	/** 
	 结束节点
	*/
	public static final String FlowEndNode = "FlowEndNode";
	/** 
	 父流程WorkID
	*/
	public static final String PWorkID = "PWorkID";
	/** 
	 PFID
	*/
	public static final String PFID = "PFID";
	/** 
	 父流程节点发送
	*/
	public static final String PNodeID = "PNodeID";
	/** 
	 父流程编号
	*/
	public static final String PFlowNo = "PFlowNo";
	/** 
	 调用父流程的工作人员
	*/
	public static final String PEmp = "PEmp";
	/** 
	 客户编号
	*/
	public static final String GuestNo = "GuestNo";
	/** 
	 客户名称
	*/
	public static final String GuestName = "GuestName";
	/** 
	 单据编号
	*/
	public static final String BillNo = "BillNo";
	/** 
	 流程备注
	*/
	public static final String FlowNote = "FlowNote";
	/** 
	 参数
	*/
	public static final String AtPara = "AtPara";
	/** 
	 项目编号
	*/
	public static final String PrjNo = "PrjNo";
	/** 
	 项目名称
	*/
	public static final String PrjName = "PrjName";
	/** 
	 GUID
	*/
	public static final String GUID = "GUID";
	/** 
	 数量
	*/
	public static final String MyNum = "MyNum";
	/**
	 * 延续流程ID
	 */
	public static final String CWorkID = "CWorkID";
	/**
	 * 延续流程编号
	 */
	public static final String CFlowNo = "CFlowNo";

}