<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/system/common.jsp" %>

<html>
<head>


    <script type="text/javascript">
                    <%
                        String id = request.getParameter("id");
                    %>
        $(function () {

            $('#sclxGrid').tree({
                url: '',
                checkbox: false,

                onClick: function (node) {
                    var id = node["id"];
                    $('#scbmGrid').datagrid('load', {
                        pid: id
                    });
                }
            });

        });

        function addColumn() {
            var childOrgs = $("#fm").find(".childOrg");
            var size = childOrgs.length;
            var currentNo = size + 1;
            var html = "<tr class='childOrg'> " +
                    "<td class='left'>子属企业" + currentNo + "</td> " +
                    "<td class='right'> " +
                    "<input id='childOrg" + currentNo + "' class='easyui-textbox textbox-f' size='20' style='height: 22px; display: none;' textboxname='childOrg" + currentNo + "'> " +
                    "<span class='textbox' style='width: 144px; height: 20px;'>  " +
                    " <input type='text' class='textbox-text validatebox-text textbox-prompt' autocomplete='off' placeholder='' style='margin-left: 0px; margin-right: 0px; padding-top: 0px; padding-bottom: 0px; height: 20px; line-height: 20px; width: 136px;'>  " +
                    "<input type='hidden' class='textbox-value' name='childOrg" + currentNo + "' value=''> " +
                    "</span>  " +
                    "</td>   " +
                    "</tr>  ";
            $(childOrgs[size - 1]).after(html);
        }

    </script>


<body style="margin: 1px;">
<div id="cc" class="easyui-layout" style="width:100%;height:100%;border: none">

    <div data-options="region:'west',title:'安全生产咨询',split:true,border:false" style="width:300px;">
        <table id="sclxGrid"></table>


    </div>
    <div data-options="region:'center',title:'安全生产咨询',border:false,fit:true" style="">
        <div class="easyui-layout" style="height: 95%">
            <div region="north" style="height:180px;">
                <div id="p" class="easyui-panel"
                     style="background:#fafafa;"   title="1.提交申请"
                     data-options="">
                    <div style="width: 1000px;text-align: right"  >
                        申请时间:2016-04-25
                    </div>
                    <form id="fm" >
                        <div>

                            <table class="table2">

                                <tr>
                                    <td class="left">企业名称:</td>
                                    <td class="right"><span >XXXXXXXXXX</span></td>
                                </tr>
                                <tr class="childOrg">
                                    <td class="left">子属企业1</td>
                                    <td class="right"><span >XXXXXXXXXX</span></td>
                                </tr>
                                <tr class="childOrg">
                                    <td class="left">子属企业2</td>
                                    <td class="right"><span >XXXXXXXXXX</span></td>
                                </tr>
                                <tr class="childOrg">
                                    <td class="left">受理单号</td>
                                    <td class="right"><span >123</span></td>
                                </tr>
                            </table>
                        </div>

                    </form>
                </div>
            </div>
            <div region="center">
                <div id="p1" class="easyui-panel"
                     style="height:100%;background:#fafafa;"   title="2.申请审核"
                     data-options="">
                    <div style="width: 1000px;text-align: right"  >
                        审核时间:2016-04-25
                    </div>
                    <form id="fm1" >
                        <div>

                            <table class="table2">

                                <tr>
                                    <td class="left">结果:</td>
                                    <td class="right"><span >通过</span></td>
                                </tr>
                            </table>
                        </div>

                    </form>
                </div>
            </div>
            <div region="south" style="height:200px">
                <div id="p2" class="easyui-panel"
                     style="height:100%;background:#fafafa;"   title="3.培训结果"
                     data-options="">

                    <form id="fm2" >
                        <div>
                            <div style="width: 1000px;text-align: right"  >
                                受理时间:2016-04-25
                            </div>
                            <table class="table2">

                                <tr>
                                    <td class="left">结果:</td>
                                    <td class="right"><span >XXXXXXX</span></td>
                                </tr>
                                <tr>
                                    <td class="left">文档:</td>
                                    <td class="right"><a href="#"> 培训报告下载</a></td>
                                </tr>
                            </table>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <div style="margin-left: 80px;padding-left: 5px;">
            <a href="/aqsczxywbl/jdcxIndex.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="">返回</a>
        </div>

    </div>
</div>
</body>
</html>
