package com.i84.earnpoint.common;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

public class BaseService {

	/**固定返回
	 * @param obj
	 * @return
	 */
	public String response(Object obj) {

		ObjectMapper mapper = new ObjectMapper();
		Writer strWriter = new StringWriter();
		try {
			mapper.writeValue(strWriter, obj);
		} catch (Exception e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw, true));
			String str = sw.toString();
			System.out.println("==========");
			System.out.println(str);
		}
		return strWriter.toString();
	}
	
	/**
	 * 把树形数据分组排序
	 * 
	 * @param list
	 */
	public void orderTree(List<MenuNode> list) {
		LinkedHashMap<String, MenuNode> treeMap = new LinkedHashMap<String, MenuNode>();
		for (MenuNode menuNode : list) {
			treeMap.put(menuNode.getId(), menuNode);
		}

		// 清空列表
		list.clear();

		// 迭代
		Iterator<MenuNode> it = treeMap.values().iterator();

		while (it.hasNext()) {
			MenuNode thdNode = it.next();

			// 有父节点
			if (TextUtil.getInt(thdNode.getPid()) != 0) {
				// 找到父节点
				MenuNode parentNode = treeMap.get(thdNode.getPid());

				// 添加到父节点
				if (parentNode != null) {
					parentNode.addChildrenNode(thdNode);
				}
			} else {
				// 添加到列表
				list.add(thdNode);
			}
		}
	}
	

}
