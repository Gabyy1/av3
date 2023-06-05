<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/styles.css"/>'>
<title>INSERIR FALTAS</title>
</head>
<body>
	<div>
		<form action="mostrarFalta" method="post">
			<select name="disciplina" id="disciplina">
			<option value="4203-010">Arquitetura e Organização de Computadores - tarde</option>
				<option value="4203-020">Arquitetura e Organização de Computadores - noite</option>
				<option value="4208-010">Laboratório de Hardware - tarde</option>
				<option value="4226-004">Banco de Dados - tarde</option>
				<option value="4213-003">Sistemas Operacionais I - tarde</option>
				<option value="4213-013">Sistemas Operacionais I - noite</option>
				<option value="4233-005">Laboratório de Banco de Dados - tarde</option>
				<option value="5005-220">Métodos Para a Produção do Conhecimento</option>
			</select> 
			
			<input type="date" name="data" id="data"> 
			<input type="submit" name="enviar" id="enviar" value="Mostrar">
		</form>
	</div>
	
	<c:set var="contt" value="1" scope="page">
	</c:set>

	<br>
	<br>
	<div class="container-fluid">
		<form action="insereFalta" method="post">

			<div>
			Data Escolhida: ${data}
			</div>

			<table class="table table-striped" border=2>
				<c:set var="cont" value="1" scope="page"></c:set>

				<c:forEach var="aluno" items="${aluno}">

					<tr>
						<c:if test="${contt == 1}">
							<td>Nome</td>
							<td>RA</td>
							<td>Faltas</td>
						</c:if>
					</tr>

					<input type="hidden" name="${cont}" value="${aluno.getRa()}">

					<tr>
						<td>${aluno.getNome()}</td>
						<td>${aluno.getRa()}</td>
						<td><select name="${aluno.getRa()}" id="materias">
								<c:forEach begin="0" end="${aulas}" varStatus="loop">
									<option value="${loop.index}">${loop.index}</option>
								</c:forEach>
						</select></td>
					</tr>
					<c:set var="contt" value="${contt+1}" scope="page" />
					<c:set var="cont" value="${cont+1}" scope="page" />
				</c:forEach>
			</table>
			<input type="hidden" name="tamanho" value="${cont}"> <input
				type="hidden" name="dt" value="${data}"> <input
				type="hidden" name="aula" value="${materia}">
			<div>
				<input type="submit" name="enviar" id="enviar" value="Registrar">
				</div>
			</form>
		</div>
</body>
</html>