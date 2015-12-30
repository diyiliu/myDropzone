<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="./css/dropzone.css"/>
    <title>拖拽上传</title>
</head>
<body>

<form action="" method="post" enctype="">
    <div id="myDropzone" class="dropzone"></div>
</form>


<script type="text/javascript" src="./js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="./js/dropzone.js"></script>

<script type="text/javascript">
    $(function () {

        $("div#myDropzone").dropzone({
            url: "<%=path%>/upload",
            paramName: "file",
            maxFiles: 1
        });
    })
</script>
</body>
</html>
