<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<html>
<head>
    <title>系统配置管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#inputForm").validate({
                rules: {
                    mailName: {
                        required: true,
                        email: true
                    }
                }
            });


        });

        function modifyMail() {
            if ($("#inputForm").valid() == false) {
                return;
            }
            $.ajax({
                async: false,
                url: "${ctx}/sys/systemConfig/save",
                data: {
                    "smtp": $("#smtp").val(),
                    "port": $("#port").val(),
                    "mailName": $("#mailName").val(),
                    "mailPassword": $("#mailPassword").val()
                },
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        top.layer.alert("更新成功！");
                    } else {
                        top.layer.alert("更新失败！");
                    }
                }
            });
        }

        function modifySms() {
            $.ajax({
                async: false,
                url: "${ctx}/sys/systemConfig/save",
                data: {"smsName": $("#smsName").val(), "smsPassword": $("#smsPassword").val()},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        top.layer.alert("更新成功！");
                    } else {
                        top.layer.alert("更新失败！");
                    }
                }
            });
        }

        function modifySys(){
            $("#inputForm2").submit();
        }
    </script>
</head>
<body>

<div class="wrapper wrapper-content">
    <%--<div class="row animated fadeInRight">
        <div class="col-sm-5">
            <form:form id="inputForm" modelAttribute="systemConfig" action="${ctx}/sys/systemConfig/save" method="post"
                       class="form-horizontal">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <i class="fa fa-envelope"></i> 系统邮箱设置
                        <div class="pull-right">
                            <a href="#" onclick="modifyMail()" style="color:white">
                                <i style="font-size: 20px" class="fa  fa-save"></i>
                            </a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <tbody>
                            <tr>
                                <td class="width-15"><label class="pull-right">邮箱服务器地址：</label></td>
                                <td class="width-35">
                                    <form:input path="smtp" htmlEscape="false" maxlength="64" class="form-control "/>
                                </td>
                            </tr>
                            <tr>
                                <td class="width-15"><label class="pull-right">邮箱服务器端口：</label></td>
                                <td class="width-35">
                                    <form:input path="port" htmlEscape="false" maxlength="64" class="form-control "/>
                                </td>
                            </tr>
                            <tr>
                                <td class="width-15"><label class="pull-right">系统邮箱地址：</label></td>
                                <td class="width-35">
                                    <form:input path="mailName" htmlEscape="false" maxlength="64"
                                                class="form-control "/>
                                </td>
                            </tr>
                            <tr>
                                <td class="width-15"><label class="pull-right">系统邮箱密码：</label></td>
                                <td class="width-35">
                                    <form:password path="mailPassword" htmlEscape="false" maxlength="64"
                                                   class="form-control required"/>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </form:form>

        </div>
        <div class="col-sm-5">
            <form:form id="inputForm1" modelAttribute="systemConfig" action="${ctx}/sys/systemConfig/save" method="post"
                       class="form-horizontal">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <i class="fa fa-comment"></i> 短信设置(<a href="http://www.cnsms.cn/" target="_blank"><font
                            color="white">企信通</font></a>)
                        <div class="pull-right">
                            <a href="#" onclick="modifySms()" style="color:white">
                                <i style="font-size: 20px" class="fa  fa-save"></i>
                            </a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <tr>
                                <td class="width-15"><label class="pull-right">短信用户名：</label></td>
                                <td class="width-35">
                                    <form:input path="smsName" htmlEscape="false" maxlength="64" class="form-control "/>
                                </td>
                            </tr>
                            <tr>
                                <td class="width-15"><label class="pull-right">短信密码：</label></td>
                                <td class="width-35">
                                    <form:password path="smsPassword" htmlEscape="false" maxlength="64"
                                                   class="form-control "/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

            </form:form>
        </div>
    </div>--%>
    <div class="row animated fadeInRight">
        <div class="col-sm-5">
            <form:form id="inputForm2" modelAttribute="systemConfig" action="${ctx}/sys/systemConfig/syssave" method="post" class="form-horizontal" enctype="multipart/form-data">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <i class="fa fa-gear"></i> 系统设置
                        <div class="pull-right">
                            <a href="#" onclick="modifySys()" style="color:white">
                                <i style="font-size: 20px" class="fa  fa-save"></i>
                            </a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tr>
                                <td class="width-15"><label class="pull-right">系统名称：</label></td>
                                <td class="width-35">
                                    <form:input path="sysname" htmlEscape="false" maxlength="64" class="form-control required"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="width-15"><label class="pull-right">系统登陆背景图：</label></td>
                                <td class="width-35">
                                    <input id="sysback" name="sysback" type="file" accept="image/*" style="width: 50%;float: left;"/>
                                    <img src="${ctxRoot}${systemConfig.loginback}" onclick="jp.showPic('${ctxRoot}${systemConfig.loginback}')" style="width: 40px;"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="width-15"><label class="pull-right">系统logo：</label></td>
                                <td class="width-35">
                                    <input id="syslogoimg" name="syslogoimg" type="file" accept="image/*" style="width: 50%;float: left;"/>
                                    <img src="${ctxRoot}${systemConfig.syslogo}" onclick="jp.showPic('${ctxRoot}${systemConfig.syslogo}')" style="width: 40px;"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="width-15"><label class="pull-right">系统favicon：</label></td>
                                <td class="width-35">
                                    <input id="sysfavicon" name="sysfavicon" type="file" accept="image/*" style="width: 50%;float: left;"/>
                                    <img src="${ctxRoot}/favicon.ico" onclick="jp.showPic('${ctxRoot}/favicon.ico')" style="width: 40px;"/>
                                </td>
                            </tr>
                        </table>
                        <div class="alert alert-warning" role="alert">
                            系统登陆背景图片尺寸必须为1366*768/1920*1080/2560*1440像素的图片<br>
                            系统logo图片尺寸必须为115*115像素的图片<br>
                            系统favicon图片尺寸必须为64*64像素图片<br>
                        </div>
                    </div>
                </div>

            </form:form>
        </div>
</div>
</body>
</html>