<%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="sp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- raw style by me -->
<%-- 
<h2 style="color: red;text-align: center;">Welcome To Employee Management System</h2>
<br>
<a href="allemp" style="color: orange; text-align:left; text-decoration: none;">ShowAllEmplyee</a>
--%>  

<!--using  bootstrap -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<!-- ✅ Navbar with Language Selector -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold text-white" href="#">
      Employee Management
    </a>
    <div class="ms-auto">
      <div class="btn-group">
          <%-- <b>current active language::${pageContext.response.locale}</b> --%>
        <a href="?language=en_US" class="btn btn-outline-light btn-sm">English</a>
        <a href="?language=hi_IN" class="btn btn-outline-light btn-sm">हिन्दी</a>
        <a href="?language=ko_KR" class="btn btn-outline-light btn-sm">한국어</a>
        <a href="?language=or_IN" class="btn btn-outline-light btn-sm">ଓଡ଼ିଆ</a>
      </div>
    </div>
  </div>
</nav>

<!-- ✅ Main Card -->
<div class="container text-center mt-5">
    <div class="card shadow-lg p-4 rounded-4">
        <h2 class="text-primary fw-bold"><sp:message code="home.title"/></h2>
        <hr>
        <a href="allemp" class="btn btn-warning btn-lg mt-3 px-5">
            <sp:message code="home.link1"/>
        </a>
        <a href="allEmpPagination" class="btn btn-warning btn-lg mt-3 px-5">
            <sp:message code="home.link2"/>
        </a>
    </div>
</div>

<!-- ✅ Footer -->
<footer class="bg-dark text-white text-center mt-5 py-3">
  <p class="mb-0">© 2025 Employee Management System | All Rights Reserved</p>
</footer>

</body>
</html>


