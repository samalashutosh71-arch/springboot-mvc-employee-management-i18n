<%--by me --%>

<%--
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!-- raw style by me -->

 
<h1 style="color:orange; text-align: center;">All Employee List</h1>
<c:choose>
    <c:when test="${!empty allEmp}">  
        <table border="1" align=center>
            <tr>
                <th>EID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Role</th>
                <th>Salary</th>
                <th>Operation</th>
            </tr>

            <c:forEach var="emp" items="${allEmp}">  
                <tr>
                    <td>${emp.eid}</td>
                    <td>${emp.ename}</td>
                    <td>${emp.category}</td>
                    <td>${emp.role}</td>
                    <td>${emp.salary}</td>
                    <td><a href="edit?no=${emp.eid}">edit</a> &nbsp; &nbsp; &nbsp;
                        <a href="remove?no=${emp.eid}" onclick="return confirm('are you sure want to delete?')">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <h1 style="color:red; text-align:center;">No Data Found</h1>
    </c:otherwise>
</c:choose>
<br>
<h2 style="color:green;text-align: center;">${regMsg}</h2>
<br>
<h2></h2><a href="register" style="color=blue;text-align: center;"><img src="images/addemp.webp" height=30 width=55">add employee</a>
<br>
<a href="./" style="color=blue;text-align: center;"><img src="images/home.jpg" height=30 width=55">Home</a>
--%>



<%--by gpt --%>

<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><sp:message code="emp.list.title"/></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
<!--formatted  -->
<fmt:formatDate var="fdate" value="${sysDate}" type="date" dateStyle="LONG"/><!-- LONG,SHORT,MEDIUM -->
<fmt:formatDate var="ftime" value="${sysDate}" type="time" dateStyle="SHORT"/><!-- LONG,SHORT,MEDIUM -->
<fmt:formatDate var="fdatetime" value="${sysDate}" type="both" dateStyle="MEDIUM"/><!-- LONG,SHORT,MEDIUM -->
<fmt:formatNumber var="favg" value="${avg}" type="percent"/>



<div class="container mt-5">
date:: ${fdate} time:: ${ftime} date&time ::${fdatetime}
<b>formatted avg :: ${favg}</b>
    <!-- Page Heading -->
    <h1 class="text-center text-primary mb-4">
        <sp:message code="emp.list.title"/> 
    </h1>
    

    <c:choose>
        <c:when test="${!empty allEmp}">

            <%-- Employee Table --%>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover text-center align-middle shadow-sm">
                    <thead class="table-dark">
                        <tr>
                            <th><sp:message code="emp.table.header.eid"/></th>
                            <th><sp:message code="emp.table.header.name"/></th>
                            <th><sp:message code="emp.table.header.category"/></th>
                            <th><sp:message code="emp.table.header.role"/></th>
                            <th><sp:message code="emp.table.header.salary"/></th>
                            <th><sp:message code="emp.table.header.operation"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="emp" items="${allEmp}">
                            <tr>
                                <td>${emp.eid}</td>
                                <td>${emp.ename}</td>
                                <td>${emp.category}</td>
                                <td>${emp.role}</td>
                               <%--  <fmt:formatNumber var="ffee" value="${emp.salary}" type="number"/> --%>
                                 <fmt:formatNumber var="ffee" value="${emp.salary}" type="currency"/>
                               
                                <td>${ffee}</td>
                                <td>
                                    <%-- Edit Button --%>
                                    <a href="edit?no=${emp.eid}" class="btn btn-sm btn-warning me-2">
                                        <sp:message code="emp.button.edit"/>
                                    </a>
                                    
                                    <%-- Delete Button with confirmation --%>
                                    <a href="remove?no=${emp.eid}" 
                                       class="btn btn-sm btn-danger"
                                       onclick="return confirm('<sp:message code="emp.button.delete.confirm"/>')">
                                       <sp:message code="emp.button.delete"/>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:when>

        <%-- No Data Message --%>
        <c:otherwise>
            <h2 class="text-center text-danger">
                <sp:message code="emp.nodata"/>
            </h2>
        </c:otherwise>
    </c:choose>

    <%-- Success / Registration Message --%>
    <c:if test="${not empty regMsg}">
        <div class="alert alert-success text-center mt-3">
            <sp:message code="emp.regmsg.success"/>
        </div>
    </c:if>

    <%-- Action Buttons --%>
    <div class="text-center mt-4">
        <a href="register" class="btn btn-success me-3">
            <img src="images/addemp.webp" height="25" width="25" class="me-1">
            <sp:message code="emp.button.add"/>
        </a>
        <a href="./" class="btn btn-primary">
            <img src="images/home.jpg" height="25" width="25" class="me-1">
            <sp:message code="emp.button.home"/>
        </a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

