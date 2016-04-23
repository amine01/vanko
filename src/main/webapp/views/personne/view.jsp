<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<a href="personne?add">Add Personne</a>
	<br>
	<a href="personnes">liste des personnes</a>

	<h1>
		<c:out value="${personne.nom} ${personne.prenom}"></c:out>
	</h1>
	<hr>
	<h2>Surnoms</h2>
	<c:if test="${personne.surnoms.size()>0}">
		<table border="1">
			<tr>
				<th>Surnom</th>
				<th></th>
			</tr>
			<c:forEach var="surnom" items="${personne.surnoms}">
				<tr>
					<td><c:out value="${surnom.surnom}" /></td>
					<td><a href="${surnom.URL}&edit"> Edit </a> | <a
						href="${surnom.URL}&delete"> Delete </a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

	<hr>
	<h2>Emails</h2>
	<c:if test="${personne.emails.size()>0}">
		<table border="1">
			<tr>
				<th>Email</th>
				<th>Polariser ?</th>
				<th></th>
			</tr>
			<c:forEach var="email" items="${personne.emails}">
				<tr>
					<td><c:out value="${email.email}" /></td>
					<td><c:out value="${email.pola}" /></td>
					<td><a href="${email.URL}&edit"> Edit </a> | <a
						href="${email.URL}&delete"> Delete </a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<hr>
	<h2>Fonctions</h2>
	<c:if test="${personne.personneFonctions.size()>0}">
		<table border="1">
			<tr>
				<th>Fonction</th>
				<th>Date Debut</th>
				<th>Date Fin</th>
				<th></th>
			</tr>
			<c:forEach var="personneFonction"
				items="${personne.personneFonctions}">
				<tr>
					<td><c:out value="${personneFonction.fonction.fonction}" /></td>
					<td><c:out value="${personneFonction.dateDebut}" /></td>
					<td><c:out value="${personneFonction.dateFin}" /></td>
					<td><a href="${personneFonction.URL}&edit"> Edit </a> | <a
						href="${personneFonction.URL}&delete"> Delete </a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

	<hr>
	<h2>Photos</h2>
	<c:if test="${personne.photos.size()>0}">
		<table border="1">
			<tr>
				<th>Photo</th>
				<th></th>
			</tr>
			<c:forEach var="photo" items="${personne.photos}">
				<tr>
					<td><img src="${photo.urlPhoto}" alt="Smiley face" width="42"
						height="42"></td>
					<td><a
						href="${photo.URL}&delete"> Delete </a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>


















</body>
</html>
<%-- 	<c:if test="${personnes.size()>0}">
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
					<td>
						<a href="${personne.URL}&edit"> Edit </a> | 
						<a href="${personne.URL}&view"> View </a> |
						<a href="${personne.URL}&delete"> Delete </a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if> --%>