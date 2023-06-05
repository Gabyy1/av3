<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>INSERIR NOTA</title>
</head>
<body>

<center>
		<form action="nota" method="post">
			<select name="disciplina" id="disciplina">
				<option value="4203-010">Arquitetura e Organiza��o de Computadores - tarde</option>
				<option value="4203-020">Arquitetura e Organiza��o de Computadores - noite</option>
				<option value="4208-010">Laborat�rio de Hardware - tarde</option>
				<option value="4226-004">Banco de Dados - tarde</option>
				<option value="4213-003">Sistemas Operacionais I - tarde</option>
				<option value="4213-013">Sistemas Operacionais I - noite</option>
				<option value="4233-005">Laborat�rio de Banco de Dados - tarde</option>
				<option value="5005-220">M�todos Para a Produ��o do Conhecimento</option>
			</select> <input type="submit" name="enviar" id="enviar" value="Mostrar">
		</form>
	</center>

	<br>
	<br>

	<div class="container-fluid">
		<form action="registraNota" method="post">
			<table class="table table-striped" border=2>

				<c:set var="contt" value="1" scope="page">
				</c:set>

				<tr align="center">

					<c:forEach var="materia" items="${materia}">
						<c:if test="${contt == 1}">
							<td>nome</td>
						</c:if>

						<td>${materia.getTipo()}</td>

						<c:set var="contt" value="${contt+1}" scope="page" />
					</c:forEach>

					<c:if test="${contt > 1}">
						<td>exame</td>
					</c:if>

				</tr>


				<c:set var="contA" value="1" scope="page">
				</c:set>
				<c:set var="contM" value="2000" scope="page">
				</c:set>
				<c:set var="contN" value="4000" scope="page">
				</c:set>
				<c:set var="contJ" value="1" scope="page">
				</c:set>



				<c:forEach var="aluno" items="${aluno}">
					<input type="hidden" id="ra" name="${contA}"
						value="${aluno.getRa()}">

					<tr align="center">
						<td>${aluno.getNome()}</td>

						<c:set var="contJ" value="1" scope="page">
						</c:set>

						<c:forEach var="materia" items="${materia}">
							<input type="hidden" id="codigoAv" name="${contM}"
								value="${materia.getCodigo()}">
							<td><input type="number" id="materia" name="${contN}"></td>

							<c:set var="contM" value="${contM+1}" scope="page" />
							<c:set var="contN" value="${contN+1}" scope="page" />
							<c:set var="contJ" value="${contJ+1}" scope="page" />
						</c:forEach>

						<input type="hidden" id="codigoAv" name="${contM}" value="125">
						<td><input type="number" id="materia" name="${contN}"></td>

					</tr>
					<c:set var="contM" value="${contM+1}" scope="page" />
					<c:set var="contN" value="${contN+1}" scope="page" />


					<c:set var="contA" value="${contA+1}" scope="page" />
				</c:forEach>

				<input type="hidden" id="ra" name="tamanho" value="${contA}">
				<input type="hidden" id="ra" name="jTamanho" value="${contJ}">

			</table>
			<br>
			<center>
				<input type="submit" name="enviar" id="inviar" value="registrar">
			</center>
		</form>
	</div>

</body>
</html>