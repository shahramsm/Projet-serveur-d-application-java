INSERT INTO natureservice (description) VALUES ('Cours');
INSERT INTO natureservice (description)VALUES ('BabySitter');
INSERT INTO natureservice (description)VALUES ('Jardinage');
INSERT INTO natureservice (description)VALUES ('bricolage');

INSERT INTO utilisateur (adresse, datenaissance, description, email, estadmin, login, mdp, nom, prenom, sexe, tel) 
	VALUES ('France,Paris,75016', '2020-03-01', 'Administrateur du site', 'admin@weho.com', true, 'admin', '1000:114d40aa7e78475b93ca59c88cf1ac86:06b261dbe62554ef53ef19495aa915f83fac9de23dba47bec4842b6207fb69aaacf226f217a9555a6c35119d4ea05aa3aad6618734db06506aa3edac8238ec43', 'admin', 'admin', 'Masculin', '0123456789');
INSERT INTO utilisateur (adresse, datenaissance, description, email, estadmin, login, mdp, nom, prenom, sexe, tel) 
	VALUES ('France,Saint-Denis,93200', '1994-06-22', 'Etudiant', 'paul.vong@dauphine.eu', false, 'paul', '1000:eecd35c94985c95f573b1d5fe431215e:9b5dfb614ddb2295d8261f595df8ab75a5d7e9c2cbb9e99b97c1a93630334affbd2e55b6c6d8b73b8e9d412351bf769def92cd8ecb7d3f368c4ebb1a576b440e', 'Vong', 'Paul', 'Masculin', '0695189447');
INSERT INTO utilisateur (adresse, datenaissance, description, email, estadmin, login, mdp, nom, prenom, sexe, tel) 
	VALUES ('France,Paris,75016', '1996-03-01', 'Etudiant', 'ismail.elamouri@dauphine.eu', false, 'ismail', '1000:fe07df254deb1265606d75a20be70b8b:1563202e3e527fce5c13e27edcdb61d6f6b45b055a83b282f6e9d9928b2630f8eb3578ec3c8e2df8c9c707c8f56f0c949a967aaca2b3f4f0d9b21157d4d0dc34', 'Elamouri', 'Ismail', 'Masculin', '0123456789');

INSERT INTO service (courtedescription, datedebut, datefin, etat, localisation, longuedescription, offreservice, typeservice, demandeuser_codeutilisateur, offreuser_codeutilisateur, natureservice_id) 
	VALUES ('ServiceSupp', '2020-02-20', '2020-02-20', 'OBSOLETE', 'AA', 'AA', 'A', 'A', NULL, NULL, 1);
INSERT INTO service (courtedescription, datedebut, datefin, etat, localisation, longuedescription, offreservice, typeservice, demandeuser_codeutilisateur, offreuser_codeutilisateur, natureservice_id) 
	VALUES ('informatique', '2020-03-04', '2020-03-04', 'VALIDE', 'France,Paris,75016', 'développer en java', 'Offre de service', 'Service à offrir', NULL, 2, 1);
INSERT INTO service (courtedescription, datedebut, datefin, etat, localisation, longuedescription, offreservice, typeservice, demandeuser_codeutilisateur, offreuser_codeutilisateur, natureservice_id) 
	VALUES ('informatique', '2020-03-05', '2020-03-05', 'VALIDE', 'France,Paris,75016', 'développer en C++', 'Demande de service', 'Service à offrir', 3, NULL, 1);
INSERT INTO service (courtedescription, datedebut, datefin, etat, localisation, longuedescription, offreservice, typeservice, demandeuser_codeutilisateur, offreuser_codeutilisateur, natureservice_id) 
	VALUES ('réparer une porte', '2020-03-07', '2020-03-07', 'EN_COURS', 'France,Paris,75016', 'Viens au domicile de la personne pour réparer une porte', 'Offre de service', 'Service à offrir', NULL, 3, 4);
INSERT INTO service (courtedescription, datedebut, datefin, etat, localisation, longuedescription, offreservice, typeservice, demandeuser_codeutilisateur, offreuser_codeutilisateur, natureservice_id) 
	VALUES ('garde d''enfant', '2020-03-07', '2020-03-07', 'EN_COURS', 'France,Paris,75016', 'Garder les enfant une après-midi', 'Demande de service', 'Service à offrir', 2, NULL, 2);

INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'L''utilisateur paul a créé une nouvelle offre de service', 2, 1, 2);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'L''utilisateur paul a créé une nouvelle demande de service', 2, 1, 3);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'L''utilisateur ismail a créé une nouvelle offre de service', 3, 1, 5);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'L''utilisateur ismail a créé une nouvelle demande de service', 3, 1, 4);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'Votre demande de service a été accepté par l''administrateur du site', 1, 2, 3);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'Votre offre de service a été accepté par l''administrateur du site', 1, 2, 2);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'Ci joint les coordonnées du créateur de service', 3, 2, 5);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'Votre demande de service a été accepté par l''administrateur du site', 1, 3, 4);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'Votre offre de service a été accepté par l''administrateur du site', 1, 3, 5);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'Ci joint les coordonnées du créateur de service', 2, 3, 3);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'Je suis disponible ce jour-là pour garder vos enfants.', 3, 2, 3);
INSERT INTO notification (datenotif, estlu, message, emetteur_codeutilisateur, recepteur_codeutilisateur, service_id) 
	VALUES ('2020-03-01', true, 'Merci de votre aide.', 2, 3, 5);
