<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" %>
<%@ attribute name="url" type="java.lang.String" required="true" %>
<%@ attribute name="label" type="java.lang.String" required="false" %>
<button class="btn btn-white btn-sm" onclick="deleteAll()" data-toggle="tooltip" data-placement="top"><i
        class="fa fa-trash-o"> ${label==null?'删除':label}</i>
</button>
<%-- 使用方法： 1.将本tag写在查询的form之前；2.传入table的id和controller的url --%>
<script type="text/javascript">
    $(document).ready(function () {
        $('#${id} thead tr th input.i-checks').on('ifChecked', function (event) { //ifCreated 事件应该在插件初始化之前绑定
            $('#${id} tbody tr td input.i-checks').iCheck('check');
        });

        $('#${id} thead tr th input.i-checks').on('ifUnchecked', function (event) { //ifCreated 事件应该在插件初始化之前绑定
            $('#${id} tbody tr td input.i-checks').iCheck('uncheck');
        });

    });

    function deleteAll() {

        // var url = $(this).attr('data-url');
        var str = "";
        var str1 = "";
        var ids = "";
        var types = "";
        $("#${id} tbody tr td input.i-checks:checkbox").each(function () {
            if (true == $(this).is(':checked')) {
                str += $(this).attr("id") + ",";
            }
        });
        $("#${id} tbody tr td input.i-checks:checkbox").each(function () {
            if (true == $(this).is(':checked')) {
                if($(this).attr("dictype") != null && $(this).attr("dictype") != ''){
                    str1 += $(this).attr("dictype") + ",";
                }
            }
        });
        if (str.substr(str.length - 1) == ',') {
            ids = str.substr(0, str.length - 1);
        }
        if (str1.substr(str1.length - 1) == ',') {
            types = str1.substr(0, str1.length - 1);
        }
        if (ids == "" && types == "") {
            top.layer.alert('请至少选择一条数据!', {icon: 0, title: '警告'});
            return;
        }
        if (types != null && types != '') {
            top.layer.confirm('确认要彻底删除数据吗?', {icon: 3, title: '系统提示'}, function (index) {
                window.location = "${url}?types=" + types;
                top.layer.close(index);
            });
        } else {
            top.layer.confirm('确认要彻底删除数据吗?', {icon: 3, title: '系统提示'}, function (index) {
                window.location = "${url}?ids=" + ids;
                top.layer.close(index);
            });
        }
    }
</script>