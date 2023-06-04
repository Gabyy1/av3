<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RELATÓRIO NOTAS</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
	</div>
	<br />
	
	<div align="center">
		<form action="relatorio" method="post" target="_blank">
			<table>
				<tr>
					<td><input type="text" name="relatorio" placeholder="RelatorioNotas">
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="Gerar">
					</td>
				</tr>
			</table>
		</form>
	
	</div>
</body>
</html>