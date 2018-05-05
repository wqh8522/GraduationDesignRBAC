<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>新闻管理管理</title>
	<meta name="decorator" content="default"/>

	<script src="/static/layui/layui.js"></script>
	<link href="/static/layui/css/layui.css" rel="stylesheet">
	<script type="text/javascript">
		var validateForm;
        var layedit;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){


              var edit_Content = layedit.getContent(edit);
              if(edit_Content == ""){
                  layer.msg("请输入新闻正文！",{icon:2,time:2000});
                  return false;
              }
              loading('正在提交，请稍等...');
              $("#content").val(edit_Content);
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(document).ready(function() {
			validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
            //初始化文本编辑器
            layui.use('layedit', function () {
                layedit = layui.layedit;
                edit = layedit.build('edit_Content', {
                    height: 250 //设置编辑器高度
                    ,
                    tool: [
                        'strong' //加粗
                        , 'italic' //斜体
                        , 'underline' //下划线
                        , 'del' //删除线
                        , '|' //分割线
                        , 'left' //左对齐
                        , 'center' //居中对齐
                        , 'right' //右对齐
                        , '|' //分割线
                        , 'link' //超链接
                        , 'unlink' //清除链接
                        //, 'face' //表情
                        //, 'image' //插入图片
                        //, 'help' //帮助
                    ]
                }); //建立编辑器

                //layedit.set({
                //    uploadImage: {
                //        url: responseUrl.uploadImage //接口url
                //        ,
                //        type: 'post' //默认post
                //    }
                //});
            });
		});
	</script>
</head>
<body class="hideScroll">
		<form:form id="inputForm" modelAttribute="news" action="${ctx}/news/save" method="post" class="form-horizontal" enctype="multipart/form-data">
		<form:hidden path="id"/>
			<input type="hidden" name="type" value="${type}"/>
		<sys:message content="${message}"/>	
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			   <tbody>
			   <c:if test="${not empty mbwjList}">
				   <tr>
					   <td class="width-15 active"><label class="pull-right"><font color="red">*</font>模板文件：</label></td>
					   <td class="width-35" colspan="3">
						   <c:forEach items="${mbwjList}" var="mbwj">
							   <a href="${ctx}/dzjg/mbwj/download?id=${mbwj.id}" title="点击下载" style="color: blue">${mbwj.name}</a><br>
						   </c:forEach>
					   </td>
				   </tr>
			   </c:if>
			   <tr>
				   <td class="width-15 active"><label class="pull-right"><font color="red">*</font>新闻标题：</label></td>
				   <td class="width-35" colspan="3">
					   <form:input path="title" htmlEscape="false"    class="form-control required"/>
				   </td>
			   </tr>
			   <tr>

				   <td class="width-15 active"><label class="pull-right"><font color="red">*</font>新闻正文：</label></td>
				   <td class="width-35" colspan="3">
					  <%-- <form:textarea path="content" htmlEscape="false" rows="4"    class="form-control required"/>--%>
						  <input type="hidden" id="content" value="" name="content">
						  <textarea name="edit_Content" id="edit_Content" >${news.content}</textarea>

				   </td>
			   </tr>
			 <%--  <tr>
				   <td  width="10" class="width-15 active"><label class="pull-right">附件：<br>	<span style="color: red;font-size: 3px" class="pull-right">可同时上传多文件</span></label></td>
				   <td class="width-35">
					   <input type="file" name="news_File" multiple="multiple"/>
				   </td>
			   </tr>--%>
			   </tbody>
		</table>
	</form:form>
</body>
</html>