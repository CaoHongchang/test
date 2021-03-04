package com.i84.earnpoint.jobfair.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.collections.map.HashedMap;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.i84.earnpoint.common.ResultConstant;


/**
 * 字典控件,用户需提供字典编码，或查询sql，获取数据集
 *
 * @author wjs
 */
public class DictTag extends TagSupport {

    private static final long serialVersionUID = 1343L;
    private static final String LOGIC_TRUE = "true";
    private static Map<String,List<Map<String,String>>> dictMap=new HashedMap();
    /**
     * 字典select 的ID属性
     */
    private String id;
    /**
     * 字典编码
     */
    private String dictCode;
    /**
     * 初始默认选择值
     */
    private String value;
    /**
     * 选择空值提示信息
     */
    private String headerLabel = "";
    /**
     * 宽度
     */
    private String width = "165px";

    /**
     * 只读模式，只会生成文本和<input type="hidden">的html
     */
    private String readonly;
    /**
     * 不可用模式，值为true 会在select 中加入disabled = disabled 属性
     */
    private String disabled;
    private String classStyle;
    private String style;

    @Override
    public int doStartTag() throws JspException {
        StringBuffer strb = new StringBuffer();
        if (!LOGIC_TRUE.equals(readonly)&&StringUtil.isEmpty(id)) {
            return SKIP_BODY;
        }
        //只读的情况，现在字典name
        if (LOGIC_TRUE.equals(readonly)) {
            if (StringUtil.isEmpty(value)) {
                return SKIP_BODY;
            }
            strb.append(getDictLabel(dictCode, value));
        }
        //可读情况生成select
        else {
            strb.append("<select id='" + id + "' name='" + id + "' style='width:" + width + ";'");
            if (LOGIC_TRUE.equals(disabled)) {
                strb.append(" disabled = 'disabled'");
            }
            if(!StringUtil.isEmpty(classStyle)){
                strb.append(" class='"+classStyle+"'");
            }
            if(!StringUtil.isEmpty(style)){
                strb.append(" style='"+style+"'");
            }
            strb.append(" >\n");
            if (!StringUtil.isEmpty(headerLabel)) {
                strb.append("\t<option value='' >").append(headerLabel).append("</option>\n");
            }
            if(dictMap.isEmpty()){
                loadDictory();
            }
            List<Map<String,String>> items=dictMap.get(dictCode.trim());
            for (Map<String,String> item:items){
                String option=bulidOption(item.get("value"),item.get("name"),value);
                strb.append(option);
            }
            strb.append("</select>");
        }
        try {
            pageContext.getOut().print(strb.toString());
        } catch (java.io.IOException e) {
            e.printStackTrace();
            throw new JspTagException(e.getMessage());
        }
        return SKIP_BODY;
    }

    private String bulidOption(Object value, Object label, String selectValue) {
        if (value == null) {
            return "";
        }

        String val = value.toString().trim();
        String option = "\t<option value='" + val + "'";
        if (val.equals(selectValue)) {
            option += " selected = 'selected'";
        }
        //		if(disabled){
        //			option += " disabled = 'disabled'";
        //		}
        option += ">" + label + "</option>\n";
        return option;
    }

    private String getDictLabel(String dictCode,String value){
        List<Map<String,String>> items=dictMap.get(dictCode);
        if(null==items){
            return "";
        }
        for (Map<String,String> item:items){
            if(value.equals(item.get("value"))){
                return item.get("name");
            }
        }
        return "";
    }
    static{
        loadDictory();
    }
    public static void loadDictory(){
        String s = ResultConstant.getWEB_ROOTPath();
        File xmlFile = new File(s + "WEB-INF/classes/config/dictionary-qzzp.xml"); // new File("src/book.xml");
        DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
        try{
            DocumentBuilder builder = builderFactory.newDocumentBuilder();
            Document doc = builder.parse(xmlFile);
            doc.getDocumentElement().normalize();
            NodeList nodeList = doc.getElementsByTagName("group");
            for(int i = 0 ; i<nodeList.getLength();i++){
                String nodeName = nodeList.item(i).getAttributes().getNamedItem("name").getNodeValue();
                Node node = nodeList.item(i);
                Element ele = (Element)node;
                Integer optionLen=null;
                List<Map<String,String>> items=new ArrayList<Map<String,String>>();
                if(ele.getElementsByTagName("option")!=null){
                    optionLen=ele.getElementsByTagName("option").getLength();
                    for(int j=0;j<optionLen;j++){
                        String name= ele.getElementsByTagName("option").item(j).getAttributes().getNamedItem("name").getNodeValue();
                        String value= ele.getElementsByTagName("option").item(j).getAttributes().getNamedItem("value").getNodeValue();
                        Map<String,String> m=new HashMap<String, String>();
                        m.put("name", name);
                        m.put("value", value);
                        items.add(m);
                    }
                }
                dictMap.put(nodeName,items);
            }
        }catch (Exception e){
        }

    }

    /**
     * 获取字典下的所有配置
     * @param dictCode
     * @return
     */
    public static List<Map<String,String>> getDictItems(String dictCode){
        if(dictMap.isEmpty()){
            loadDictory();
        }
        return dictMap.get(dictCode.trim());
    }
    @Override
    public String getId() {
        return id;
    }

    public String getClassStyle() {
        return classStyle;
    }

    public void setClassStyle(String classStyle) {
        this.classStyle = classStyle;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getDictCode() {
        return dictCode;
    }

    public void setDictCode(String dictCode) {
        this.dictCode = dictCode;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getHeaderLabel() {
        return headerLabel;
    }

    public void setHeaderLabel(String headerLabel) {
        this.headerLabel = headerLabel;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getReadonly() {
        return readonly;
    }

    public void setReadonly(String readonly) {
        this.readonly = readonly;
    }

    public String getDisabled() {
        return disabled;
    }

    public void setDisabled(String disabled) {
        this.disabled = disabled;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }
}
