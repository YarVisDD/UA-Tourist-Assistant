<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
    <title>UA Tourist Assistant | Add Place</title>
    <link href="../static/css/bootstrap.min.css" rel="stylesheet">
    <link href="../static/css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<jsp:include page="/include/navbar.jsp" />

<div class="container text-center">
    <h3>New Place</h3>
    <hr>
    <form class="form-horizontal" method="post" enctype="multipart/form-data" action="/place/save-place">
        <input type="hidden" name="id" value="${place.idPlace}"/>
        <div class="form-group">
            <label class="control-label col-md-3">Place name</label>
            <div class="col-md-7">
                <input class="form-control" type="text" name="placeName" placeholder="Enter place name" value="${place.placeName}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Place description</label>
            <div class="col-md-7">
                <textarea class="form-control" name="placeDescription" rows="3" placeholder="Enter place description" value="${place.placeDescription}"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Place type</label>
            <div class="col-md-7">
                <select id="placeType" class="form-control" name="placeType" value="${place.placeType}">
                    <option value="HOTELS">hotels</option>
                    <option value="CAFE_RESTAURANTS">cafe or restaurants</option>
                    <option value="MONUMENTS_OBJECTS">monuments and objects</option>
                    <option value="ENTERTAINMENT">entertainment</option>
                    <option value="MUSEUMS">museums</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Choose image</label>
            <div class="col-md-7">
                <input class="form-control" type="file" name="image" value="${place.image}" multiple/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Username</label>
            <div class="col-md-7">
                <%
                    Object userLogin = session.getAttribute("userLogin");
                    out.print("<input class=\"form-control\" type=\"text\" name=\"login\" placeholder=\"Enter username\" value=" + userLogin + " readonly/>");
                %>
<%--                <input class="form-control" type="text" name="login" placeholder="Enter username" value="<% session.getAttribute("userLogin"); %>" readonly/>--%>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">City</label>
            <div class="col-md-7">
                <input class="form-control" type="text" name="cityName" placeholder="Enter city" value="${city.cityName}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Street</label>
            <div class="col-md-7">
                <input class="form-control" type="text" name="streetName" placeholder="Enter street" value="${address.streetName}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Number house</label>
            <div class="col-md-7">
                <input class="form-control" type="text" name="numberHouse" placeholder="Enter number house" value="${address.numberHouse}"/>
            </div>
        </div>
        <div class="form-group ">
            <input type="submit" class="btn btn-primary" value="Add Place"/>
        </div>
    </form>
</div>

<jsp:include page="/include/footer.jsp" />

</body>
</html>
