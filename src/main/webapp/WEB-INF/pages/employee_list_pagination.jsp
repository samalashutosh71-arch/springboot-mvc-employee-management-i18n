<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Employee List With Pagination  </title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

    <!-- Page Heading -->
   <h1 class="text-center text-primary mb-4">
    All Employee List ${pageData.getNumber()+1}/${pageData.getTotalPages()}
</h1>
   

    <c:choose>
        <c:when test="${!empty pageData}">

            <%-- Employee Table --%>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover text-center align-middle shadow-sm">
                    <thead class="table-dark">
                        <tr>
                            <th>EID</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Role</th>
                            <th>Salary</th>
                            <th>Operation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="emp" items="${pageData.getContent()}">
                            <tr>
                                <td>${emp.eid}</td>
                                <td>${emp.ename}</td>
                                <td>${emp.category}</td>
                                <td>${emp.role}</td>
                                <td>${emp.salary}</td>
                                <td>
                                    <%-- Edit Button --%>
                                    <a href="edit?no=${emp.eid}" class="btn btn-sm btn-warning me-2">Edit</a>
                                    
                                    <%-- Delete Button with confirmation --%>
                                    <a href="remove?no=${emp.eid}" 
                                       class="btn btn-sm btn-danger"
                                       onclick="return confirm('Are you sure you want to delete this employee?')">
                                       Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <%---legacy my style code in quick note --%>
            25 September 2025
20:43


<center>
<c:if test="${!pageData.isFirst()}">
<a href="allEmpPagination?page=0">first</a>
</c:if>
<%--alter use pageData.hasNext() --%>
<c:if test="${!pageData.isLast()}">
<a href="allEmpPagination?page=${pageData.getNumber()+1}">next</a>
</c:if>
<c:forEach var="i" begin="0" end="${pageData.getTotalPages()-1}">
<%--page is the fixed parameter --%>
[<a href="allEmpPagination?page=${i}">${i+1}</a>]&nbsp;&nbsp;&nbsp;
</c:forEach>

<%--alter use pageData.hasPrevious() --%>
<c:if test="${!pageData.isFirst()}">
<a href="allEmpPagination?page=${pageData.getNumber()-1}">previous</a>
</c:if>

<c:if test="${!pageData.isLast()}">
<a href="allEmpPagination?page=${pageData.getTotalPages()-1}">Last</a>
</c:if>
</center>
            
  
        </c:when>

        <%-- No Data Message --%>
        <c:otherwise>
            <h2 class="text-center text-danger">No Data Found</h2>
        </c:otherwise>
    </c:choose>

    <%-- Success / Registration Message --%>
    <c:if test="${not empty regMsg}">
        <div class="alert alert-success text-center mt-3">
            ${regMsg}
        </div>s
    </c:if>

    <%-- Action Buttons --%>
    <div class="text-center mt-4">
        <a href="register" class="btn btn-success me-3">
            <img src="images/addemp.webp" height="25" width="25" class="me-1">
            Add Employee
        </a>
        <a href="./" class="btn btn-primary">
            <img src="images/home.jpg" height="25" width="25" class="me-1">
            Home
        </a>
    </div>
</div>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

