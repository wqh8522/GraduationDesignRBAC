<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<html>
<head>
    <title>机构管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        var validateForm;

        function doSubmit() {//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if (validateForm.form()) {
                $("#inputForm").submit();
                return true;
            }

            return false;
        }

        $(document).ready(function () {
            $("#name").focus();
            validateForm = $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body class="hideScroll">
<form:form id="inputForm" modelAttribute="office" action="${ctx}/sys/office/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td class="width-15 active"><label class="pull-right">上级机构:</label></td>
            <td class="width-35"><sys:treeselect id="office" name="parent.id" value="${office.parent.id}"
                                                 labelName="parent.name" labelValue="${office.parent.name}"
                                                 title="机构" url="/sys/office/treeData" extId="${office.id}"
                                                 cssClass="form-control" allowClear="${office.currentUser.admin}"/></td>
            <td class="width-15" class="active"><label class="pull-right"><font color="red">*</font>归属区域:</label></td>
            <td class="width-35"><sys:treeselect id="area" name="area.id" value="${office.area.id}"
                                                 labelName="area.name" labelValue="${office.area.name}"
                                                 title="区域" url="/sys/area/treeData"
                                                 cssClass="form-control required"/></td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right"><font color="red">*</font>机构名称:</label></td>
            <td class="width-35"><form:input path="name" htmlEscape="false" maxlength="50"
                                             class="form-control required"/></td>
            <td class="width-15" class="active"><label class="pull-right">机构编码:</label></td>
            <td class="width-35"><form:input path="code" htmlEscape="false" maxlength="50" class="form-control"/></td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right">机构类型:</label></td>
            <td class="width-35"><form:select path="type" class="form-control">
                <form:options items="${fns:getDictList('sys_office_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select></td>
            <td class="width-15" class="active"><label class="pull-right">联系地址:</label></td>
            <td class="width-35"><form:input path="address" htmlEscape="false" maxlength="50"
                                             cssClass="form-control"/></td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right">电话:</label></td>
            <td class="width-35"><form:input path="phone" htmlEscape="false" maxlength="50"
                                             cssClass="form-control"/></td>
            <td class="width-15" class="active"><label class="pull-right">传真:</label></td>
            <td class="width-35"><form:input path="fax" htmlEscape="false" maxlength="50" cssClass="form-control"/></td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right">邮箱:</label></td>
            <td class="width-35"><form:input path="email" htmlEscape="false" maxlength="50"
                                             cssClass="form-control"/></td>
        </tr>
        <tr>
            <td class="width-15" class="active"><label class="pull-right">备注:</label></td>
            <td class="width-35" colspan="3"><form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200"
                                                class="form-control"/></td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>