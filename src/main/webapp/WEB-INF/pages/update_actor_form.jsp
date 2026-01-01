
<%--by me --%>
<%-- 
<%@ page isELIgnored="false"%>
<!-- for two way binding -->
<%@taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<h2 style="color:green;text-align: center;">Update Employee</h2>
<frm:form action="edit" method="POST" modelAttribute="emp">
<table border="1" align="center">
<tr>
<th>EmployeeId::</th>
<th><frm:input type="text" path="eid" readonly="true"/></th>
</tr>
<tr>
<th>EmployeeName::</th>
<th><frm:input type="text" path="ename"/></th>
</tr>
<tr>
<th>EmployeeCategory::</th>
<th><frm:input type="text" path="category"/></th>
</tr>
<tr>
<th>EmployeeRole::</th>
<th><frm:input type="text" path="role"/></th>
</tr>
<tr>
<th>EmployeeSalary::</th>
<th><frm:input type="text" path="salary"/></th>
</tr>
<tr>
<th><input type="submit" value="update"></th>
<th><input type="reset" value="cancel"/></th>
</tr>
</table>
</frm:form>
--%>

<%--by gpt --%>

<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><sp:message code="emp.update.title"/></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <!-- Page Heading -->
    <h2 class="text-center text-success mb-4">
        <sp:message code="emp.update.title"/>
    </h2>

    <!-- Spring Form Binding -->
    <frm:form action="edit" method="POST" modelAttribute="emp">

        <div class="row justify-content-center">
            <div class="col-md-6">

                <!-- Card for form -->
                <div class="card shadow-lg border-0 rounded-3 p-4">

                    <!-- Employee ID (Read-Only) -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <sp:message code="emp.update.label.id"/>
                        </label>
                        <frm:input path="eid" cssClass="form-control" readonly="true"/>
                    </div>

                    <!-- Employee Name -->
                    <sp:message code="emp.update.placeholder.name" var="namePh"/>
                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <sp:message code="emp.update.label.name"/>
                        </label>
                        <frm:input path="ename" cssClass="form-control" placeholder="${namePh}"/>
                    </div>

                    <!-- Employee Category -->
                    <sp:message code="emp.update.placeholder.category" var="catPh"/>
                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <sp:message code="emp.update.label.category"/>
                        </label>
                        <frm:input path="category" cssClass="form-control" placeholder="${catPh}"/>
                    </div>

                    <!-- Employee Role -->
                    <sp:message code="emp.update.placeholder.role" var="rolePh"/>
                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <sp:message code="emp.update.label.role"/>
                        </label>
                        <frm:input path="role" cssClass="form-control" placeholder="${rolePh}"/>
                    </div>

                    <!-- Employee Salary -->
                    <sp:message code="emp.update.placeholder.salary" var="salPh"/>
                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <sp:message code="emp.update.label.salary"/>
                        </label>
                        <frm:input path="salary" cssClass="form-control" placeholder="${salPh}"/>
                    </div>

                    <!-- Action Buttons -->
                    <div class="d-flex justify-content-between">
                        <input type="submit" value="<sp:message code='emp.update.button.update'/>" class="btn btn-success px-4"/>
                        <input type="reset" value="<sp:message code='emp.update.button.cancel'/>" class="btn btn-secondary px-4"/>
                    </div>

                </div>
            </div>
        </div>

    </frm:form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


