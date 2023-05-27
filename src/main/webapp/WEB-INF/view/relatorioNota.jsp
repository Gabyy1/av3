<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RELATÓRIO NOTA</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
	</div>
	<br />
	
	<div id="centro" align="center">
			<h1 class=texto>Relatorio Notas</h1>
				<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">Codigo</th>
					<th scope="col">Disciplina</th>
					<th scope="col">Turno</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">4203-010</th>
					<td>Arquitetura e Organização de Computadores </td>
					<td>Tarde</td>
				</tr>
				<tr>
					<th scope="row">4203-020</th>
					<td>Arquitetura e Organização de Computadores </td>
					<td>Noite</td>
				</tr>
					<tr>
					<th scope="row">4208-010</th>
					<td>Laboratório de Hardware</td>
					<td>Tarde</td>
				</tr>
					<tr>
					<th scope="row">4226-004</th>
					<td>Banco de Dados </td>
					<td>Tarde</td>
				</tr>
					<tr>
					<th scope="row">4213-003</th>
					<td>Sistemas Operacionais I </td>
					<td>Tarde</td>
				</tr>
					<tr>
					<th scope="row">4213-013</th>
					<td>Sistemas Operacionais I </td>
					<td>Noite</td>
				</tr>
					<tr>
					<th scope="row">4233-005</th>
					<td>Arquitetura e Organização de Computadores </td>
					<td>Tarde</td>
				</tr>
					<tr>
					<th scope="row">5005-220</th>
					<td>Métodos Para a Produção do Conhecimento </td>
					<td>Tarde</td>
				</tr>
			</tbody>
		</table>
	
	</div>
</body>
</html>