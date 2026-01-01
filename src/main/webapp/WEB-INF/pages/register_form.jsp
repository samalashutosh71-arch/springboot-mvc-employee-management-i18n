<%--
<frm:form action="register" method="POST" modelAttribute="emp">
    <table border="1" align="center">

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
            <th><input type="submit" value="register"></th>
            <th><input type="reset" value="cancel"/></th>
        </tr>

    </table>
</frm:form>
--%>

<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><sp:message code="emp.reg.title"/></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg border-0 rounded-3">
                <div class="card-header bg-primary text-white text-center">
                    <h4><sp:message code="emp.reg.title"/></h4>
                </div>
                <div class="card-body p-4">
                    <frm:form action="register" method="POST" modelAttribute="emp">
                        
                        <!-- Employee Name -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                <sp:message code="emp.reg.label.name"/>
                            </label>
                            <sp:message code="emp.reg.placeholder.name" var="namePlaceHolder"/>
                            <frm:input path="ename" cssClass="form-control"
                                       placeholder="${namePlaceHolder}"/>
                        </div>
                        
                        <!-- Employee Category -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                <sp:message code="emp.reg.label.category"/>
                            </label>
                             <sp:message code="emp.reg.placeholder.category" var="categoryPlaceHolder"/>
                            <frm:input path="category" cssClass="form-control"
                                       placeholder="${categoryPlaceHolder}"/>
                        </div>
                        
                        <!-- Employee Role -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                <sp:message code="emp.reg.label.role"/>
                            </label>
<sp:message code="emp.reg.placeholder.role" var="rolePlaceholder"/>
<frm:input path="role" cssClass="form-control"
           placeholder="${rolePlaceholder}"/>

                        </div>
                        
                        <!-- Employee Salary -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                <sp:message code="emp.reg.label.salary"/>
                            </label>
                            <sp:message code="emp.reg.placeholder.salary" var="salaryPlaceHolder"/>
                            <frm:input path="salary" cssClass="form-control"
                                       placeholder="${salaryPlaceHolder}"/>
                        </div>
                        
                        <!-- Buttons -->
                        <div class="d-flex justify-content-between">
                            <input type="submit" 
                                   value="<sp:message code='emp.reg.button.register'/>" 
                                   class="btn btn-success px-4"/>
                                   
                            <input type="reset" 
                                   value="<sp:message code='emp.reg.button.cancel'/>" 
                                   class="btn btn-secondary px-4"/>
                        </div>
                        
                    </frm:form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


