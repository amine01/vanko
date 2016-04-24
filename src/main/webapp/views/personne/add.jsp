<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
	var countSurnom = 1;
	function addSurnom() {

		var labelSurnom = document.createElement("LABEL");
		var textLabelSurnom = document.createTextNode("Surnom :");
		labelSurnom.appendChild(textLabelSurnom);

		var br = document.createElement('br');

		//ce variable contient l element input qu'on va ajouter au formulaire
		var newSurnom = document.createElement('input');
		newSurnom.type = 'text';
		newSurnom.name = "surnoms[" + countSurnom + "].surnom";
		//+ fieldCount
		newSurnom.id = 'surnom';

		// lien de suppression du variable
		countSurnom++;
		var removeSurnom = document.createElement('a');
		removeSurnom.appendChild(document.createTextNode("remove"));
		removeSurnom.href = "#";

		//removeElement('surnom1');

		document.getElementById('sr').appendChild(labelSurnom);
		document.getElementById('sr').appendChild(newSurnom);
		document.getElementById('sr').appendChild(removeSurnom);
		document.getElementById('sr').appendChild(br);

		removeSurnom.addEventListener('click', function(event) {
			//fieldCount--;
			countSurnom--;
			newSurnom.parentElement.removeChild(labelSurnom);
			newSurnom.parentElement.removeChild(newSurnom);
			removeSurnom.parentElement.removeChild(removeSurnom);
			br.parentElement.removeChild(br);
			event.preventDefault();
		});

	}

	//2ème fonction
	var countEmail = 1;
	function addEmail() {

		var labelEmail = document.createElement("LABEL");
		var textLabelEmail = document.createTextNode("Email :");
		labelEmail.appendChild(textLabelEmail);

		var labelPolariser = document.createElement("LABEL");
		var textLabelPolariser = document.createTextNode("Polariser ? :");
		labelPolariser.appendChild(textLabelPolariser);

		var br = document.createElement('br');
		//ce variable contient l element input qu'on va ajouter au formulaire
		var newEmail = document.createElement('input');
		newEmail.type = 'text';
		newEmail.name = "emails[" + countEmail + "].email";
		newEmail.id = 'email';

		var select = document.createElement('select'); //<----
		select.name = "emails[" + countEmail + "].pola";
		//select.name = 'polariser';
		

		var optionOui = document.createElement('option'); //<----
		optionOui.value = 'true';
		optionOui.text = 'oui';

		var optionNon = document.createElement('option'); //<----
		optionNon.value = 'false';
		optionNon.text = 'non';
		optionNon.selected = true;
		//op.selected = true

		select.appendChild(optionOui);
		select.appendChild(optionNon);

		// lien de suppression du variable
		var removeEmail = document.createElement('a');
		removeEmail.appendChild(document.createTextNode("Remove"));
		removeEmail.href = "#";

		//labelEmail  labelPolariser
		countEmail++;
		document.getElementById('emails').appendChild(labelEmail);
		document.getElementById('emails').appendChild(newEmail);
		document.getElementById('emails').appendChild(labelPolariser);
		document.getElementById('emails').appendChild(select);
		document.getElementById('emails').appendChild(removeEmail);
		document.getElementById('emails').appendChild(br);

		removeEmail.addEventListener('click', function(event) {
			countEmail--;
			newEmail.parentElement.removeChild(newEmail);

			labelEmail.parentElement.removeChild(labelEmail);
			labelPolariser.parentElement.removeChild(labelPolariser);

			select.parentElement.removeChild(select);
			removeEmail.parentElement.removeChild(removeEmail);
			br.parentElement.removeChild(br);
			event.preventDefault();
		});

	}
	var countPhoto = 1;
	function addPhoto() {

		var labelPhoto = document.createElement("LABEL");
		var textLabelPhoto = document.createTextNode("Photo :");
		labelPhoto.appendChild(textLabelPhoto);

		var newPhoto = document.createElement('input');
		newPhoto.type = 'file';
		newPhoto.name = "photos[" + countPhoto + "].urlPhoto";

		var br = document.createElement('br');

		// lien de suppression du variable
		var removePhoto = document.createElement('a');
		removePhoto.appendChild(document.createTextNode("remove"));
		removePhoto.href = "#";

		//labelPhoto
		countPhoto++;
		document.getElementById('photos').appendChild(labelPhoto);
		document.getElementById('photos').appendChild(newPhoto);
		document.getElementById('photos').appendChild(removePhoto);
		document.getElementById('photos').appendChild(br);

		removePhoto.addEventListener('click', function(event) {
			countPhoto--;
			newPhoto.parentElement.removeChild(labelPhoto);
			newPhoto.parentElement.removeChild(newPhoto);
			removePhoto.parentElement.removeChild(removePhoto);
			br.parentElement.removeChild(br);
			event.preventDefault();
		});
	}

	var countFonction = 1;
	function addFonction() {

		var labelFonction = document.createElement("LABEL");
		var textLabelFonction = document.createTextNode("Fonction :");
		labelFonction.appendChild(textLabelFonction);

		var labeldd = document.createElement("LABEL");
		var textLabeldd = document.createTextNode("Du :");
		labeldd.appendChild(textLabeldd);

		var labelDf = document.createElement("LABEL");
		var textLabelDf = document.createTextNode("Au :");
		labelDf.appendChild(textLabelDf);

		var br = document.createElement('br');

		var newFonction = document.createElement('input');
		newFonction.typ = 'text';
		newFonction.name = "fonction[" + countFonction + "].fonction.fonction";

		var newdd = document.createElement('input');
		newdd.typ = 'text';
		newdd.name = "personneFonctions[" + countFonction + "].dateDebut";

		var newdf = document.createElement('input');
		newdf.typ = 'text';
		newdf.name = "personneFonctions[" + countFonction + "].dateFin";

		// lien de suppression du variable
		var removePhoto = document.createElement('a');
		removePhoto.appendChild(document.createTextNode("remove"));
		removePhoto.href = "#";
		//labelFonction  labeldd  labelDf

		countFonction++;
		document.getElementById('fonctions').appendChild(labelFonction);
		document.getElementById('fonctions').appendChild(newFonction);

		document.getElementById('fonctions').appendChild(labeldd);
		document.getElementById('fonctions').appendChild(newdd);

		document.getElementById('fonctions').appendChild(labelDf);
		document.getElementById('fonctions').appendChild(newdf);

		document.getElementById('fonctions').appendChild(removePhoto);
		document.getElementById('fonctions').appendChild(br);

		removePhoto.addEventListener('click', function(event) {

			countFonction--;
			labelFonction.parentElement.removeChild(labelFonction);
			labeldd.parentElement.removeChild(labeldd);
			labelDf.parentElement.removeChild(labelDf);

			newFonction.parentElement.removeChild(newFonction);
			newdd.parentElement.removeChild(newdd);
			newdf.parentElement.removeChild(newdf);
			removePhoto.parentElement.removeChild(removePhoto);
			br.parentElement.removeChild(br);
			event.preventDefault();
		});
	}
</script>

</head>
<body>


	<a href="personnes">liste des personnes</a>

	<%-- 	<form action="/vanko/personne" method="post"
		enctype="multipart/form-data"> --%>


	<form:form action="/vanko/personne" method="POST"
		commandName="personne" enctype="multipart/form-data">

		<!-- informations generales sur la personne -->
		<fieldset>
			<legend>Personne:</legend>
			<input type="hidden" name="add" />

			<ul>
				<!-- <li>Nom : <input type="text" name="nom" /></li> -->
				<spring:bind path="nom">
					<li>Nom :<form:input type="text" path="nom" /></li>
				</spring:bind>

				<spring:bind path="prenom">
					<li>Prenom : <form:input type="text" path="prenom" /></li>
				</spring:bind>
				<spring:bind path="dateNaissance">
					<li>date de naissance : <form:input type="text"
							path="dateNaissance" /></li>
				</spring:bind>
				<!--  -->
			</ul>
		</fieldset>

		<!--  information generales sur le surnom -->

		<fieldset id="sr">
			<legend>Surnon:</legend>
			<ul>
				<li><button type="button" onclick="addSurnom(); return false;">
						<b> + </b>
					</button></li>

				<spring:bind path="surnoms[0].surnom">
					<li>Surnom :<form:input type="text" path="surnoms[0].surnom"
							id="surnom" /></li>
				</spring:bind>


			</ul>
		</fieldset>

		<!-- sur ses emails -->
		<fieldset id="emails">
			<legend>Email:</legend>
			<ul>
				<li><button type="button" onclick="addEmail(); return false;">
						<b> + </b>
					</button></li>
				<spring:bind path="emails[0].email">
					<li>Email :<form:input type="text" path="emails[0].email"
							name="email" id="email" value="" /></li>
				</spring:bind>
				<spring:bind path="emails[0].pola">
					<li>Polariser ? :<form:select name="polariser"
							path="emails[0].pola">
							<form:option value="true">oui</form:option>
							<form:option value="false">non</form:option>
						</form:select>
					</li>
				</spring:bind>
				<!-- 			OUI:<input type="radio" name="polariser[0]" value="oui"> -->
				<!-- 			NON:<input type="radio" name="polariser[0]" value="non" checked="checked"> -->


			</ul>
		</fieldset>


		<!-- sur ses photos -->
		<fieldset id="photos">
			<legend>Photos:</legend>
			<ul>
				<li><button type="button" onclick="addPhoto(); return false;">
						<b> + </b>
					</button></li>
				<spring:bind path="photos[0].urlPhoto">
					<li>Photo :<form:input type="file" path="photos[0].urlPhoto"
							name="photo" value="upload photo" /></li>
				</spring:bind>

				<!-- 				<li><input type="file" name="photo[1]" value="upload photo"></li> -->
			</ul>

		</fieldset>
		<!-- sur ses Fonction -->
		<fieldset id="fonctions">
			<legend>Fonctions:</legend>
			<ul>
				<li><button type="button"
						onclick="addFonction(); return false;">
						<b> + </b>
					</button></li>
				<spring:bind path="personneFonctions[0].fonction.fonction">
					<li>Fonction :<form:input type="text" path="personneFonctions[0].fonction.fonction"
							name="fonction" value="" />
					</li>
				</spring:bind>
				<spring:bind path="personneFonctions[0].dateDebut">
					<li>Date debut :<form:input
							path="personneFonctions[0].dateDebut" type="text" name="dd"
							value="" />
					</li>
				</spring:bind>
				<spring:bind path="personneFonctions[0].dateFin">
					<li>Date Fin :<form:input path="personneFonctions[0].dateFin"
							type="text" name="df" value="" />
					</li>
				</spring:bind>
			</ul>
		</fieldset>
		<input type="submit" value="OK">
	</form:form>
</body>
</html>