package cn.jflow.model.wf.admin.FoolFormDesigner;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BP.DA.DBAccess;
import BP.DA.DataTable;
import BP.Sys.SFDBSrc;
import BP.Sys.SysEnum;
import BP.Sys.Frm.FrmType;
import BP.Sys.Frm.MapData;
import BP.Sys.Frm.MapDataAttr;
import cn.jflow.common.model.BaseModel;
import cn.jflow.system.ui.core.Button;
import cn.jflow.system.ui.core.DDL;
import cn.jflow.system.ui.core.FileUpload;
import cn.jflow.system.ui.core.RadioButton;
import cn.jflow.system.ui.core.TextBox;

public class TableRef extends BaseModel {	
	
	public TableRef(HttpServletRequest request, HttpServletResponse response) {
		super(request, response);
	}

}
