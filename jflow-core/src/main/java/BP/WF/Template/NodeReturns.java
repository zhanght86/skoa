package BP.WF.Template;

import java.util.ArrayList;
import java.util.List;

import BP.En.EntitiesMM;
import BP.En.Entity;
import BP.En.QueryObject;
import BP.WF.Node;
import BP.WF.Nodes;

/** 
 可退回的节点
*/
public class NodeReturns extends EntitiesMM
{
	/** 
	 他的退回到
	*/
	public final Nodes getHisNodes()
	{
		Nodes ens = new Nodes();
		for (NodeReturn ns : this.ToJavaList())
		{
			ens.AddEntity(new Node(ns.getReturnTo()));
		}
		return ens;
	}
	/** 
	 可退回的节点
	*/
	public NodeReturns()
	{
	}
	/** 
	 可退回的节点
	 
	 @param NodeID 节点ID
	*/
	public NodeReturns(int NodeID)
	{
		QueryObject qo = new QueryObject(this);
		qo.AddWhere(NodeReturnAttr.FK_Node, NodeID);
		qo.DoQuery();
	}
	/** 
	 可退回的节点
	 
	 @param NodeNo NodeNo 
	*/
	public NodeReturns(String NodeNo)
	{
		QueryObject qo = new QueryObject(this);
		qo.AddWhere(NodeReturnAttr.ReturnTo, NodeNo);
		qo.DoQuery();
	}
	/** 
	 得到它的 Entity 
	*/
	@Override
	public Entity getGetNewEntity()
	{
		return new NodeReturn();
	}
	/** 
	 可退回的节点s
	 
	 @param sts 可退回的节点
	 @return 
	*/
	public final Nodes GetHisNodes(Nodes sts)
	{
		Nodes nds = new Nodes();
		Nodes tmp = new Nodes();
		for (Node st : sts.ToJavaList())
		{
			tmp = this.GetHisNodes(st.getNo());
			for (Node nd : tmp.ToJavaList())
			{
				if (nds.contains(nd))
				{
					continue;
				}
				nds.AddEntity(nd);
			}
		}
		return nds;
	}
	/** 
	 可退回的节点
	 
	 @param NodeNo 退回到编号
	 @return 节点s
	*/
	public final Nodes GetHisNodes(String NodeNo)
	{
		QueryObject qo = new QueryObject(this);
		qo.AddWhere(NodeReturnAttr.ReturnTo, NodeNo);
		qo.DoQuery();

		Nodes ens = new Nodes();
		for (NodeReturn en : this.ToJavaList())
		{
			ens.AddEntity(new Node(en.getFK_Node()));
		}
		return ens;
	}
	/** 
	 转向此节点的集合的Nodes
	 
	 @param nodeID 此节点的ID
	 @return 转向此节点的集合的Nodes (FromNodes) 
	*/
	public final Nodes GetHisNodes(int nodeID)
	{
		QueryObject qo = new QueryObject(this);
		qo.AddWhere(NodeReturnAttr.FK_Node, nodeID);
		qo.DoQuery();

		Nodes ens = new Nodes();
		for (NodeReturn en : this.ToJavaList())
		{
			ens.AddEntity(new Node(en.getReturnTo()));
		}
		return ens;
	}

		///#region 为了适应自动翻译成java的需要,把实体转换成List.
	/** 
	 转化成 java list,C#不能调用.
	 
	 @return List
	*/
	public final List<NodeReturn> ToJavaList()
	{
		return (List<NodeReturn>)(Object)this;
	}
	/** 
	 转化成list
	 
	 @return List
	*/
	public final ArrayList<NodeReturn> Tolist()
	{
		ArrayList<NodeReturn> list = new ArrayList<NodeReturn>();
		for (int i = 0; i < this.size(); i++)
		{
			list.add((NodeReturn)this.get(i));
		}
		return list;
	}
		///#endregion 为了适应自动翻译成java的需要,把实体转换成List.
}