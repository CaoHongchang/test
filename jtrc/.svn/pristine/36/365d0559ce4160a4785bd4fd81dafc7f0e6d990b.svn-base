package com.i84.earnpoint.common;

import java.util.ArrayList;
import java.util.List;

public class MenuNode {
	String id;		// 节点ID
	String text;	// 节点显示文字
	String state;	// 点节状态(open:文件夹打开状态	closed:文件夹关闭状态)
	String pid;		// 父结点ID
	String privId;  // 权限编号
	String iconCls; // 节点图标
	List<MenuNode> children;// 子结点数组
	String attributes;
	
	public String getPrivId() {
		return privId;
	}
	public void setPrivId(String privId) {
		this.privId = privId;
	}
	
	public String getIconCls() {
		return iconCls;
	}
	
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}


	//--------------节点的两种状态------------------//
	public static final String STATE_OPEN = "open";
	public static final String STATE_CLOSED = "closed";
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
		if(pid == null){
			state = STATE_OPEN;
		}
	}
	public List<MenuNode> getChildren() {
		return children;
	}
	public String getAttributes() {
		return attributes;
	}
	public void setAttributes(String attributes) {
		this.attributes = attributes;
	}
	public void setChildren(List<MenuNode> children) {
		this.children = children;
	}
	public void addChildrenNode(MenuNode menuNode){
		
		if(children == null){
			children = new ArrayList<MenuNode>();
			state = STATE_CLOSED;
		}
		
		children.add(menuNode);
	}
}
