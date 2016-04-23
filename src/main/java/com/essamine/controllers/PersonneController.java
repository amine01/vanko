package com.essamine.controllers;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.essamine.entities.Email;
import com.essamine.entities.Fonction;
import com.essamine.entities.Personne;
import com.essamine.entities.PersonneFonction;
import com.essamine.entities.Photo;
import com.essamine.entities.Surnom;
import com.essamine.repositories.EmailRepository;
import com.essamine.repositories.FonctionRepository;
import com.essamine.repositories.PersonneFonctionRepository;
import com.essamine.repositories.PersonneRepository;
import com.essamine.repositories.PhotoRepository;
import com.essamine.repositories.SurnomRepository;

@Controller
@PropertySource("classpath:info.properties")
public class PersonneController {

	@Value("${path}")
	String path;

	@Autowired
	PersonneRepository personneRepository;

	@Autowired
	SurnomRepository surnomRepository;

	@Autowired
	EmailRepository emailRepository;

	@Autowired
	FonctionRepository fonctionRepository;

	@Autowired
	PersonneFonctionRepository personneFonctionRepository;

	@Autowired
	PhotoRepository photoRepository;

	// i am here
	@RequestMapping(value = "/personnes", method = RequestMethod.GET)
	public String getPersons(Model model) {
		model.addAttribute("personnes", personneRepository.findAll());
		return "personne/list";
	}

	@RequestMapping(value = "/personne", params = "add", method = RequestMethod.GET)
	public String addPersonne(Model model) {
		// System.out.println(surnom.getSurnom());
		return "personne/add";
	}

	

	 @RequestMapping(value = "/personne", method = RequestMethod.POST, params
	 = "add")
	 public String addPersonne(@RequestParam String nom, @RequestParam String
	 prenom,
	 @RequestParam("surnom") String[] surnoms, @RequestParam(value = "email")
	 String[] emails,
	 @RequestParam(value = "polariser", required = false) String[] polarisers,
	 @RequestParam(value = "photo", required = false) MultipartFile[] photos,
	 @RequestParam(value = "fonction", required = false) String[] fonctions,
	 @RequestParam(value = "dd", required = false) String[] dds,
	 @RequestParam(value = "df", required = false) String[] dfs) throws
	 IOException {
	 // @RequestParam("file") MultipartFile[] files
	
	 // A changer
	 Personne per = new Personne();
	 Surnom s;
	 Email em;
	 //
	 per.setNom(nom);
	 per.setPrenom(prenom);
	 per.setDateNaissance(new Date());
	 per = personneRepository.save(per);
	
	 // List<Surnom> listSurnoms = new ArrayList<Surnom>();
	
	 for (int i = 0; i < surnoms.length; i++) {
	 s = new Surnom();
	 // System.out.println(surnoms[i]);
	 s.setSurnom(surnoms[i]);
	 s.setPersonne(per);
	 surnomRepository.save(s);
	 }
	
	 System.out.println("emails " + emails.length);
	 System.out.println("polariser :" + polarisers.length);
	
	 // System.out.println("polarisers " + polarisers.length);
	
	 for (int i = 0; i < emails.length; i++) {
	 em = new Email();
	 em.setEmail(emails[i]);
	 if (polarisers[i].equalsIgnoreCase("oui")) {
	 em.setPola(true);
	 } else {
	 em.setPola(false);
	 }
	 em.setPersonne(per);
	 emailRepository.save(em);
	 }
	
	 //
	 Photo photo;
	 System.out.println("path" + path);
	 for (int i = 0; i < photos.length; i++) {
	 photo = new Photo();
	 StringBuilder uniqueFileName = new
	 StringBuilder(uniqueFileName(photos[i].getOriginalFilename()));
	 System.out.println("uniqueFileName " + uniqueFileName);
	 StringBuilder newFileName = new StringBuilder(path + uniqueFileName);
	 System.out.println("newFileName to string :"+newFileName);
	 photo.setNomPhoto(uniqueFileName.toString());
	 photo.setUrlPhoto(newFileName.toString());
	 photo.setPersonne(per);
	 //
	 uploadFile(photos[i], newFileName.toString());
	 //
	 photoRepository.save(photo);
	 }
	
	 // System.out.println(photos[0].getOriginalFilename());
	
	 // traitement upload photos
	
	 //
	 Fonction fon;
	 PersonneFonction perFon;
	 for (int i = 0; i < fonctions.length; i++) {
	 fon = new Fonction();
	 perFon = new PersonneFonction();
	 fon.setFonction(fonctions[i]);
	 fon = fonctionRepository.save(fon);
	
	 perFon.setFonction(fon);
	
	 System.out.println(dds[i]);
	 perFon.setDateDebut(new Date());
	 perFon.setDateFin(new Date());
	 perFon.setPersonne(per);
	 personneFonctionRepository.save(perFon);
	 }
	
	 return "personne/add";
	 }

	@RequestMapping(value = "/personne", method = RequestMethod.GET, params = "view")
	public String personneView(@RequestParam long id, Model model) {
		model.addAttribute("personne", personneRepository.findOne(id));
		return "personne/view";
	}

	// C:\\uploadfiles\
	public void uploadFile(MultipartFile file, String desti) throws IOException {

		InputStream in = file.getInputStream();
		File fileDesti = new File(desti);
		FileUtils.copyInputStreamToFile(in, fileDesti);
	}

	public String uniqueFileName(String fileName) {
		Random random = new Random();
		int randomNumber = random.nextInt(10 - 1) + 1;

		String fileExtention = fileName.substring(fileName.length() - 3);
		Calendar cal = Calendar.getInstance();

		Long uniqueNumber = cal.getTimeInMillis() / 100000;
		String uniqueFileName = (uniqueNumber + randomNumber) + "." + fileExtention;

		return uniqueFileName;
	}

}
