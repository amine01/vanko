<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Liste des personnes :</h2>
	<a href="personne?add">Add Personne</a>
	<br>

	<fieldset>
		<legend>Recherche</legend>
		<form action="" method="POST">
			<input type="text" name="worksearch">
			<input type="submit" value="search">
		</form>
	</fieldset>

	<c:if test="${personnes.size()>0}">
		<table>
			<tr>
				<th>Nom</th>
				<th>Prenom</th>
				<th>date de naissance</th>
				<th></th>
			</tr>

			<c:forEach var="personne" items="${personnes}">
				<tr>
					<td><c:out value="${personne.nom}" /></td>
					<td><c:out value="${personne.prenom}" /></td>
					<td><c:out value="${personne.dateNaissance}" /></td>
					<td><a href="${personne.URL}&edit"> Edit </a> | <a
						href="${personne.URL}&view"> View </a> | <a
						href="${personne.URL}&delete"> Delete </a></td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagination">

			<!-- Précédent -->
			<c:if test="${currentPage !=1}">
				<a href="personnes?page=${currentPage -1 }"> Précédent</a>
			</c:if>

			<!-- Liens pagination -->
			<c:forEach begin="1" end="${noOfPages}" var="i">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<a style="color:"> <strong>${i}</strong>
						</a>
					</c:when>
					<c:otherwise>
						<a href="personnes?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- suivant pagination -->
			<c:if test="${currentPage lt noOfPages}">
				<a href="personnes?page=${currentPage + 1}"> Suivant</a>
			</c:if>

		</div>
	</c:if>
</body>
</html>

