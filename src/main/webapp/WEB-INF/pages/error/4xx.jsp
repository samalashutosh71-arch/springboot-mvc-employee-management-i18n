<%@ page isELIgnored="false"%>

<h1 style="color: gray;text-align: center">Error Page(4xx.jsp)</h1>

<h2 style="color: gray;text-align: center">Error Details</h2>
<table border="1" align="center">
<tr>
<th>message</th>
<th>${message}</th>
</tr>
<tr>
<th>status</th>
<th>${status}</th>
</tr>
<tr>
<th>path</th>
<th>${path}</th>
</tr>
<tr>
<th>timestamp</th>
<th>${timestamp}</th>
</tr>
<tr>
<th>trace</th>
<th>${trace}</th>
</tr>
</table>