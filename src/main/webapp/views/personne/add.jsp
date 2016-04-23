<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
	function addSurnom() {

		var labelSurnom = document.createElement("LABEL");
		var textLabelSurnom = document.createTextNode("Surnom :");
		labelSurnom.appendChild(textLabelSurnom);

		var br = document.createElement('br');

		//ce variable contient l element input qu'on va ajouter au formulaire
		var newSurnom = document.createElement('input');
		newSurnom.type = 'text';
		newSurnom.name = 'surnom';
		//+ fieldCount
		newSurnom.id = 'surnom';
		//+ fieldCount;

		// lien de suppression du variable
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
			newSurnom.parentElement.removeChild(labelSurnom);
			newSurnom.parentElement.removeChild(newSurnom);
			removeSurnom.parentElement.removeChild(removeSurnom);
			br.parentElement.removeChild(br);
			event.preventDefault();
		});

	}

	//2�me fonction
	var fieldCount = 1;
	function addEmail() {
		//fieldCount++;
		//labelEmail  labelPolariser

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
		newEmail.name = 'email';
		newEmail.id = 'email';

		var select = document.createElement('select'); //<----
		select.name = 'polariser';

		var optionOui = document.createElement('option'); //<----
		optionOui.value = 'oui';
		optionOui.text = 'oui';

		var optionNon = document.createElement('option'); //<----
		optionNon.value = 'non';
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
		document.getElementById('emails').appendChild(labelEmail);
		document.getElementById('emails').appendChild(newEmail);
		document.getElementById('emails').appendChild(labelPolariser);
		document.getElementById('emails').appendChild(select);
		document.getElementById('emails').appendChild(removeEmail);
		document.getElementById('emails').appendChild(br);

		removeEmail.addEventListener('click', function(event) {
			newEmail.parentElement.removeChild(newEmail);

			labelEmail.parentElement.removeChild(labelEmail);
			labelPolariser.parentElement.removeChild(labelPolariser);

			select.parentElement.removeChild(select);
			removeEmail.parentElement.removeChild(removeEmail);
			br.parentElement.removeChild(br);
			event.preventDefault();
		});

	}

	function addPhoto() {

		var labelPhoto = document.createElement("LABEL");
		var textLabelPhoto = document.createTextNode("Photo :");
		labelPhoto.appendChild(textLabelPhoto);

		var newPhoto = document.createElement('input');
		newPhoto.type = 'file';
		newPhoto.name = 'photo';

		var br = document.createElement('br');

		// lien de suppression du variable
		var removePhoto = document.createElement('a');
		removePhoto.appendChild(document.createTextNode("remove"));
		removePhoto.href = "#";

		//labelPhoto
		document.getElementById('photos').appendChild(labelPhoto);
		document.getElementById('photos').appendChild(newPhoto);
		document.getElementById('photos').appendChild(removePhoto);
		document.getElementById('photos').appendChild(br);

		removePhoto.addEventListener('click', function(event) {
			//fieldCount--;
			newPhoto.parentElement.removeChild(labelPhoto);
			newPhoto.parentElement.removeChild(newPhoto);
			removePhoto.parentElement.removeChild(removePhoto);
			br.parentElement.removeChild(br);
			event.preventDefault();
		});
	}

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
		newFonction.name = 'fonction';

		var newdd = document.createElement('input');
		newdd.typ = 'text';
		newdd.name = 'dd';

		var newdf = document.createElement('input');
		newdf.typ = 'text';
		newdf.name = 'df';

		// lien de suppression du variable
		var removePhoto = document.createElement('a');
		removePhoto.appendChild(document.createTextNode("remove"));
		removePhoto.href = "#";
		//labelFonction  labeldd  labelDf

		document.getElementById('fonctions').appendChild(labelFonction);
		document.getElementById('fonctions').appendChild(newFonction);

		document.getElementById('fonctions').appendChild(labeldd);
		document.getElementById('fonctions').appendChild(newdd);

		document.getElementById('fonctions').appendChild(labelDf);
		document.getElementById('fonctions').appendChild(newdf);

		document.getElementById('fonctions').appendChild(removePhoto);
		document.getElementById('fonctions').appendChild(br);

		removePhoto.addEventListener('click', function(event) {
			//fieldCount--;

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

	<form action="/vanko/personne" method="post"
		enctype="multipart/form-data">
		<!-- informations generales sur la personne -->
		<fieldset>
			<legend>Personne:</legend>
			<input type="hidden" name="add" />

			<ul>
				<li>Nom : <input type="text" name="nom" /></li>
				<li>Prenom : <input type="text" name="prenom" /></li>
				<li>date de naissance : <input type="text" name="dn" /></li>

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

				<li>Surnom :<input type="text" name="surnom" id="surnom" /></li>
			</ul>
		</fieldset>

		<!-- sur ses emails -->
		<fieldset id="emails">
			<legend>Email:</legend>
			<ul>
				<li><button type="button" onclick="addEmail(); return false;">
						<b> + </b>
					</button></li>

				<li>Email :<input type="text" name="email" id="email" value=" "></li>
				<li>Polariser ? :<select name="polariser">
						<option value="oui">oui</option>
						<option value="non">non</option>
				</select> <!-- 			OUI:<input type="radio" name="polariser[0]" value="oui"> -->
					<!-- 			NON:<input type="radio" name="polariser[0]" value="non" checked="checked"> -->
				</li>

			</ul>
		</fieldset>


		<!-- sur ses photos -->
		<fieldset id="photos">
			<legend>Photos:</legend>
			<ul>
				<li><button type="button" onclick="addPhoto(); return false;">
						<b> + </b>
					</button></li>

				<li>Photo :<input type="file" name="photo" value="upload photo"></li>
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
				<li>Fonction :<input type="text" name="fonction" value=" "></li>
				<li>Date debut :<input type="text" name="dd" value=" "></li>
				<li>Date Fin :<input type="text" name="df" value=" "></li>
			</ul>
		</fieldset>
		<input type="submit" value="ok">
	</form>
</body>
</html>