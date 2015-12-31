<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="./css/bootstrap.css"/>
    <link type="text/css" rel="stylesheet" href="./css/dropzone.css"/>
    <link type="text/css" rel="stylesheet" href="./css/style.css"/>
    <title>拖拽上传</title>
</head>
<body>

<div class="row myDropzone">
    <div class="col-lg-4">
        <div id="myDropzone" class="dropzone"></div>
    </div>
    <div class="col-lg-offset-1 col-lg-7 preview">
        <img id="credPrev" width="300" height="169" src="./img/credencials.png">
    </div>
</div>


<script type="text/javascript" src="./js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="./js/dropzone.js"></script>

<script type="text/javascript">
    $(function () {

        $("div#myDropzone").dropzone({
            url: "<%=path%>/upload",
            paramName: "file",
            maxFiles: 2,
            maxFilesize: 0.35,
            addRemoveLinks: true,
            dictRemoveFile: "移除",
            acceptedFiles: "image/*",
            dictDefaultMessage: "上传证件（点击或拖拽）",
            //autoProcessQueue: false,
            init: function() {
                this.on("addedfile", function(file) {
                    var len = this.files.length;
                    if(len > 1){
                        this.removeFile(this.files[0]);
                    }
                });
                this.on("success", function(file, result) {
                    toPreview(file, "credPrev");
                    console.log(JSON.parse(result)["key"]);
                });
            }
        });
    });
    function toPreview(file, imgView){
        var path = URL.createObjectURL(file);
        document.getElementById(imgView).src = path;
    }
</script>
</body>
</html>
