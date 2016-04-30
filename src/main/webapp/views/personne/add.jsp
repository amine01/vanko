<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="assets/jquery/jquery.js"></script>

<script type="text/javascript">
	// get the form values  
	function collectFormData(fields) {
		var data = {};
		for (var i = 0; i < fields.length; i++) {
			var $item = $(fields[i]);
			data[$item.attr('name')] = $item.val();
		}
		return data;
	}

	$(document).ready(function() {
		var $form = $('#add-personne-form');
		$form.bind('submit', function(e) {
			// Ajax validation
			var $inputs = $form.find('input');
			var data = collectFormData($inputs);
			//console.log(data);
			$.post('personne.json', data, function(response) {
				
			 	$form.find('.help-inline').empty();
				
				if (response.status == 'FAIL') {
					
					console.log('FAIL');
					for (var i = 0; i < response.errorMessageList.length; i++) {
						var item = response.errorMessageList[i];
						var $controlGroup = $('div[id="'+item.fieldName+'"]');
						//console.log($('div[id="'+item.fieldName+'"]'));
						//console.log(item.fieldName);
						//console.log($('input[id="info[text1]"]'));
						
						 //$("#example")[0]
						 
					//$('input[id=info[text1]]')
						//var $controlGroup = $('div[id="'+item.fieldName+'\\['+i+'\\]"]');
						//surnoms[0].surnom
						//$("#info\\[text1\\]")  '#surnom\\[0]'
						$controlGroup.find('.help-inline').html(item.message);
					console.log(item.fieldName+" --> "+item.message); 
					
						
						/* if(i==0){
							var item = response.errorMessageList[i];
							console.log(item.fieldName + ' => ' + item.message);
							var $controlGroup = $("#surnom0");
							var $controlGroupp = $('#errors');
							$controlGroup.find('.help-inline').html(item.message);
							$controlGroupp.find('.help-inline').html(item.message);
						} */
					// var item = response.errorMessageList[i];
						//console.log(item.fieldName);
					}
				} else {
					console.log('SUCCESS');
				}
			}, 'json');

			e.preventDefault();
			return false;
		});
	});
</script>

<script type="text/javascript">
	var countSurnom = 1;
	function addSurnom() {
		
		var div = document.createElement("div");
		div.setAttribute("id", "surnoms["+countSurnom+"].surnom");
		/*  */
		div.innerHTML = "<lable>Surnom :</lable><input type='text' name='surnoms["+countSurnom+"].surnom' id='surnom'/><span class='help-inline'></span>";

		// lien de suppression du variable
		countSurnom++;
		var removeSurnom = document.createElement('a');
		removeSurnom.appendChild(document.createTextNode("remove"));
		removeSurnom.href = "#";

		document.getElementById('sr').appendChild(div);
		document.getElementById('sr').appendChild(removeSurnom);

		removeSurnom.addEventListener('click', function(event) {
			//fieldCount--;
			countSurnom--;

			div.parentElement.removeChild(div);
			removeSurnom.parentElement.removeChild(removeSurnom);
			event.preventDefault();
		});

	}

	//2ème fonction
	var countEmail = 1;
	function addEmail() {
	
		var divemail = document.createElement("div");
		var divpola = document.createElement("div");
		divemail.setAttribute("id", "emails["+countEmail+"].email"); 
		divpola.setAttribute("id", "emails["+countEmail+"].pola"); 
		/*  */
		divemail.innerHTML = "<lable>Email :</lable><input type='text' name='emails["+countEmail+"].email'/><span class='help-inline'></span>";
		divpola.innerHTML = "<lable>Polariser :</lable><select path='emails["+countEmail+"].pola'><option value='true'>oui</option><option value='false'>non</option></select><span class='help-inline'></span>";
		
		
		
		// lien de suppression du variable
		countEmail++;
		var removeEmail = document.createElement('a');
		removeEmail.appendChild(document.createTextNode("remove"));
		removeEmail.href = "#";

		document.getElementById('emails').appendChild(divemail);
		document.getElementById('emails').appendChild(divpola);
		
		document.getElementById('emails').appendChild(removeEmail);

		removeEmail.addEventListener('click', function(event) {
			//fieldCount--;
			countEmail--;

			divemail.parentElement.removeChild(divemail);
			divpola.parentElement.removeChild(divpola);
			removeEmail.parentElement.removeChild(removeEmail);
			event.preventDefault();
		});
		
		
		
		
		
		/* var labelEmail = document.createElement("LABEL");
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
		}); */

	}
	var countPhoto = 1;
	function addPhoto() {
			
		var div = document.createElement("div");
		div.setAttribute("id", "photos["+countPhoto+"].file");

		div.innerHTML = "<lable>Photo :</lable><input type='file' name='photos["+countPhoto+"].file'/><span class='help-inline'></span>";

		countPhoto++;
		var removeSurnom = document.createElement('a');
		removeSurnom.appendChild(document.createTextNode("remove"));
		removeSurnom.href = "#";

		document.getElementById('photos').appendChild(div);
		document.getElementById('photos').appendChild(removeSurnom);

		removeSurnom.addEventListener('click', function(event) {
			countPhoto--;

			div.parentElement.removeChild(div);
			removeSurnom.parentElement.removeChild(removeSurnom);
			event.preventDefault();
		});
	}

	var countFonction = 1;
	function addFonction() {
		
		var divfonction = document.createElement("div");
		var divdd = document.createElement("div");
		var divdf = document.createElement("div");
		
		divfonction.setAttribute("id", "personneFonctions["+countFonction+"].fonction");
		divdd.setAttribute("id", "personneFonctions["+countFonction+"].dateDebut");
		divdf.setAttribute("id", "personneFonctions["+countFonction+"].dateFin");

		divfonction.innerHTML = "<br/><lable>Fonction :</lable><input type='input' name='personneFonctions["+countFonction+"].fonction'/><span class='help-inline'></span>";
		divdd.innerHTML = "<br/><lable>Date Debut :</lable><input type='input' name='personneFonctions["+countFonction+"].dateDebut'/><span class='help-inline'></span>";
		divdf.innerHTML = "<br/><lable>Date Fin :</lable><input type='input' name='personneFonctions["+countFonction+"].dateFin'/><span class='help-inline'></span>";
		
	/* 	var removePhoto = document.createElement('a');
		removePhoto.appendChild(document.createTextNode("remove"));
		removePhoto.href = "#";
		

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
		newdf.name = "personneFonctions[" + countFonction + "].dateFin"; */

		// lien de suppression du variable
		countFonction++;
		var removeFonctionPersonne = document.createElement('a');
		removeFonctionPersonne.appendChild(document.createTextNode("remove"));
		removeFonctionPersonne.href = "#";
		
		
		document.getElementById('fonctions').appendChild(divfonction);
		document.getElementById('fonctions').appendChild(divdd);
		document.getElementById('fonctions').appendChild(divdf);
		document.getElementById('fonctions').appendChild(removeFonctionPersonne);

		removeFonctionPersonne.addEventListener('click', function(event) {
			countFonction--;

			divfonction.parentElement.removeChild(divfonction);
			divdd.parentElement.removeChild(divdd);
			divdf.parentElement.removeChild(divdf);
			removeFonctionPersonne.parentElement.removeChild(removeFonctionPersonne);
			event.preventDefault();
		});
	}
</script>

</head>
<body>


	<a href="personnes">liste des personnes</a>


	<form:form enctype="multipart/form-data" action="/vanko/personne" method="POST"  id="add-personne-form" commandName="personne">

		<!-- informations generales sur la personne -->
		<fieldset>
			<legend>Personne:</legend>
			<input type="hidden" name="add" />

			<!-- <ul> -->
			<div id="groupenom">
				<spring:bind path="nom">
						Nom :<form:input type="text" path="nom" />
					<span class="help-inline"> <form:errors path="nom" /></span>
				</spring:bind>
			</div>

			<spring:bind path="prenom">
				<li>Prenom : <form:input type="text" path="prenom" /></li>
			</spring:bind>
			<div id="dateNaissance">
				<spring:bind path="dateNaissance">
					<li>date de naissance : <form:input type="text"
							path="dateNaissance" /></li>
				</spring:bind>
				<span class="help-inline"></span>
			</div>
			<!--  -->
			<!-- </ul> -->
		</fieldset>

		<!--  information generales sur le surnom -->

		<fieldset id="sr">

			<legend>Surnom:</legend>

			<!-- <ul> -->
			<button type="button" onclick="addSurnom(); return false;">
				<b> + </b>
			</button>
			<!-- div[id="surnoms[0].surnom"]"]  -->
			<div id="surnoms[0].surnom">
				<spring:bind path="surnoms[0].surnom">
					Surnom :
					<form:input type="text" path="surnoms[0].surnom" />

					<span class="help-inline"><form:errors
							path="surnoms[0].surnom" /></span>

				</spring:bind>
			</div>


		</fieldset>

		<!-- sur ses emails -->
		<fieldset id="emails">
			<legend>Email:</legend>
			<ul>
				<li><button type="button" onclick="addEmail(); return false;">
						<b> + </b>
					</button></li>
				<div id="emails[0].email">
					<spring:bind path="emails[0].email">
						<li>Email :<form:input type="text" path="emails[0].email"
								name="email" id="email" value=" " /></li>
						<span class="help-inline"> <form:errors
								path="emails[0].email" />
						</span>

					</spring:bind>
				</div>
				<div id="emails[0].pola">
					<spring:bind path="emails[0].pola">
						<li>Polariser ? :<form:select name="polariser"
								path="emails[0].pola">
								<form:option value="true">oui</form:option>
								<form:option value="false">non</form:option>
							</form:select>
							<span class="help-inline">
	<form:errors path="emails[0].pola" />
</span>
						</li>
					</spring:bind>
				</div>

			</ul>
		</fieldset>


<%-- 		<!-- sur ses photos -->
		<fieldset id="photos">
			<legend>Photos:</legend>

			<button type="button" onclick="addPhoto(); return false;">
				<b> + </b>
			</button>
			<div id="photos[0].file">
				<spring:bind path="photos[0].file">
					Photo :<form:input type="file" path="photos[0].file"
						value="upload photo" />
					<span class="help-inline"> <form:errors
							path="photos[0].file" />
					</span>
				</spring:bind>
			</div>

			<!-- 				<li><input type="file" name="photo[1]" value="upload photo"></li> -->


		</fieldset> --%>
		<!-- sur ses Fonction -->
		<fieldset id="fonctions">
			<legend>Fonctions:</legend>
			<ul>
				<li><button type="button"
						onclick="addFonction(); return false;">
						<b> + </b>
					</button></li>
				<div id="personneFonctions[0].fonction.fonction">
					<spring:bind path="personneFonctions[0].fonction.fonction">
						<li>Fonction :<form:input type="text"
								path="personneFonctions[0].fonction.fonction" name="fonction"
								value="" />

						</li>
						<span class="help-inline"> <form:errors
								path="personneFonctions[0].fonction.fonction" />
						</span>
					</spring:bind>
				</div>
				<div id="personneFonctions[0].dateDebut">
					<spring:bind path="personneFonctions[0].dateDebut">
						<li>Date debut :<form:input
								path="personneFonctions[0].dateDebut" type="text" name="dd"
								value=" " />
						</li>
						<span class="help-inline"> <form:errors
								path="personneFonctions[0].dateDebut" />
						</span>
					</spring:bind>
				</div>
				<div id="personneFonctions[0].dateFin">
					<spring:bind path="personneFonctions[0].dateFin">
						<li>Date Fin :<form:input path="personneFonctions[0].dateFin"
								type="text" name="df" value="" />
						</li>

						<span class="help-inline"> <form:errors
								path="personneFonctions[0].dateFin" />
						</span>

					</spring:bind>
				</div>
			</ul>
		</fieldset>
		
		
		<!-- <input type="submit" value="OK"> -->
		<button type="submit">Save changes</button>

	</form:form>
</body>
</html>