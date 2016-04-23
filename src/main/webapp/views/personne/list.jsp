<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Liste des personnes :</h2>
	<a href="personne?add">Add Personne</a><br>
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
					<td>
						<a href="${personne.URL}&edit"> Edit </a> | 
						<a href="${personne.URL}&view"> View </a> |
						<a href="${personne.URL}&delete"> Delete </a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>

<%-- 	<c:forEach var="person" items="${persons}">
		<li><c:out value="${person.firstname}" /> <c:out
				value="${person.lastname}" /> <a
			href="/helloProjectWeb/person?edit&id=${person.id}">Edit</a> | <a
			href="/helloProjectWeb/person?delete&id=${person.id}">Delete</a></li>
	</c:forEach>
	<a href="/helloProjectWeb/person?add">add person</a> --%>