-- inserare de date in tabela masini

INSERT INTO masini VALUES (NULL, 'Audi','A4');
INSERT INTO masini(marca_masina,model_masina) VALUES ('Audi','A4 Allroad');
INSERT INTO masini(marca_masina,model_masina) VALUES ('Audi','A5');
INSERT INTO masini(marca_masina,model_masina) VALUES ('Audi','A6');
INSERT INTO masini(marca_masina,model_masina) VALUES ('Audi','A6 Allroad');


-- inserare de date in tabela Detalii_Masini folosind clauza cautand id-ul unei masini dupa marca si model

INSERT INTO Detalii_Masini VALUES(
	(SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),
	'B8', 2008, 2000, 'Benzina', 190
);
INSERT INTO Detalii_Masini VALUES(
	(SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),
	'B8', 2013, 2000, 'Diesel', 177
);
INSERT INTO Detalii_Masini VALUES(
	(SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),
	Null, 2016, 1968, 'Diesel', 150
);
INSERT INTO Detalii_Masini VALUES(
	(SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),
	'C6', 2005, 2000, 'Diesel', 140
);
INSERT INTO Detalii_Masini VALUES(
	(SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),
	Null, 2020, 2967, 'Diesel', 286
);
-- inserare de date in tabela detalii_masini afland id-ul piesei cu ajutorul secventei masini_id_masina_seq din tabela masini
INSERT INTO masini(marca_masina,model_masina) VALUES ('Volkswagen','Golf7');
INSERT INTO detalii_masini VALUES(
	masini_id_masina_seq.currval,
	Null, 2015, 1600, 'Diesel', '112'
);

INSERT INTO masini(marca_masina,model_masina) VALUES ('Dacia','Sandero');
INSERT INTO detalii_masini VALUES(
	masini_id_masina_seq.currval,
	Null, 2010, 1400, 'GPL', '123'
);

-- inserare de date in tabela piese si in tabelele piese_caroserie afland id-ul piesei cu ajutorul secventei piese_id_piesa_seq din tabela piese

INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Aripa Airbig',108);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Alba','Tabla'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Aripa RedHigh',108);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Rosie','Tabla'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Aripa DarkCarbon',108);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','Carbon'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Spoiler DarkCarbon',131);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','Carbon'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Spoiler GrayShine',114);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Gri','Plastic'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Spoiler AirWind',140);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Alba','Tabla'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Bara de protectie AirDash',80);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Alba','Tabla'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Bara de protectie DarkIron',436);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','Fier'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Bara de protectie BlueSky',163);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Albastra','Plastic'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Grila radiator AirLead',123);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Alba','Tabla'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Grila radiator DarkABS',252);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','ABS'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Grila radiator ChromeCool',473);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Crom','Fonta'
);




INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Aripa YellowShine',108);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Galbena','Plastic'
);

INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Aripa DarkDash',108);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','Carbon'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Spoiler DarkSpeed',131);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','Carbon'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Spoiler PurpleShine',104);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Mov','Plastic'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Bara de protectie GreenLizard',83);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Verde','Tabla'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Bara de protectie OrangeSteel',336);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Portocalie','Fier'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Bara de protectie BrownEarth',149);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Maro','Plastic'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Grila radiator AirCool',140);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Alba','Tabla'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Grila radiator DarkBreath',270);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','ABS'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Grila radiator ChromeWarmth',412);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Crom','Fonta'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Capota motor BlackAbyss',616);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','Carbon'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Capota motor BlueSea',657);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Albastra','Fier'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Capota motor RainbowSteel',718);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Curcubeu','Fier'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Capota motor AluminiumGray',1040);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Gri metalizat','Aluminiu'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Capota motor AirBird',311);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Alb','Tabla'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Scut motor BlackDarkness',54);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','Carbon'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Scut motor PureBlack',141);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','Carbon'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Scut motor ColdDark',150);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','Carbon'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Maner usa PureSoul',30);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Alba','Fier'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Maner usa AppleRed',35);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Rosie','Fier'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Maner usa WhiteOppening',41);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Alba','Fier'
);

INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Maner usa MidNightBlack',25);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Neagra','Fier'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Maner usa BurgundyStrong',23);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Visinie','Fier'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Maner usa PinkUnicorn',50);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Roz','Fier'
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Maner usa TealSky',31);
INSERT INTO piese_caroserie VALUEs(
	piese_id_piesa_seq.currval,
    'Bleo','Fier'
);

-- inserare de date in tabela ulei

INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Ulei Edge Titanium FST 5l',254);
INSERT INTO ulei VALUEs(
	piese_id_piesa_seq.currval,
    'Castrol','5W-30',5
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Ulei Edge Titanium FST 1l',61);
INSERT INTO ulei VALUEs(
	piese_id_piesa_seq.currval,
    'Castrol','5W-30',1
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Ulei Edge Professional',63);
INSERT INTO ulei VALUEs(
	piese_id_piesa_seq.currval,
    'Castrol','5W-30',1
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Ulei Specific',337);
INSERT INTO ulei VALUEs(
	piese_id_piesa_seq.currval,
    'Motul','0W-30',5
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Ulei Top Tec',229);
INSERT INTO ulei VALUEs(
	piese_id_piesa_seq.currval,
    'Liqui-Moly','5W-40',5
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Ulei Longlife III',63);
INSERT INTO ulei VALUEs(
	piese_id_piesa_seq.currval,
    'Liqui-Moly','5W-30',5
);

--inserare de date in tabela becuri

INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Bec Narva',9);
INSERT INTO becuri VALUEs(
	piese_id_piesa_seq.currval,
    'semnalizare','led',200,30000,3
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Bec Philips Vision',6);
INSERT INTO becuri VALUEs(
	piese_id_piesa_seq.currval,
    'semnalizare','incandescent',450,15000,40
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Bec Ultra Bright',30);
INSERT INTO becuri VALUEs(
	piese_id_piesa_seq.currval,
    'far','halogen',1600,31000,72
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Bec CANBUS P21W',25);
INSERT INTO becuri VALUEs(
	piese_id_piesa_seq.currval,
    'stop','led',1100,50000,10
);


-- inserare de date in tabela parbrize

INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Parbriz Stock',170);
INSERT INTO parbrize VALUEs(
	piese_id_piesa_seq.currval,
    'Nu','Nu','Nu',10
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Parbriz Rain',320);
INSERT INTO parbrize VALUEs(
	piese_id_piesa_seq.currval,
    'Da','Nu','Nu',0
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Parbriz Light',270);
INSERT INTO parbrize VALUEs(
	piese_id_piesa_seq.currval,
    'Nu','Da','Nu',15
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Parbriz Rain+Light',483);
INSERT INTO parbrize VALUEs(
	piese_id_piesa_seq.currval,
    'Da','Da','Nu',40
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Parbriz Visor',420);
INSERT INTO parbrize VALUEs(
	piese_id_piesa_seq.currval,
    'Nu','Nu','Da',0
);
INSERT INTO piese(denumire_piesa,pret_piesa) VALUES('Parbriz Rain+Light+Visor',635);
INSERT INTO parbrize VALUEs(
	piese_id_piesa_seq.currval,
    'Da','Da','Da',50
);

-- inserare de date in tabela combinatii_posibile luand id-ul masinii cunoscandu-se marca si modelul masinii si id-ul piesei cunoscandu-se numele piesei

insert into combinatii_posibile(id_masina,id_piesa) VALUES(
	(SELECT id_masina 
		FROM Masini 
			WHERE marca_masina = 'Audi' and model_masina='A4'),
	(SELECT id_piesa 
		FROM piese 
			WHERE denumire_piesa='Aripa Airbig')
);
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Aripa Airbig'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Aripa Airbig'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Aripa Airbig'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Aripa RedHigh'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Aripa DarkCarbon'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Aripa DarkCarbon'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Aripa DarkCarbon'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Aripa DarkCarbon'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Aripa YellowShine'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Aripa DarkDash'));

insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bara de protectie OrangeSteel'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bara de protectie OrangeSteel'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bara de protectie BrownEarth'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bara de protectie BrownEarth'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bara de protectie DarkIron'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bara de protectie GreenLizard'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bara de protectie BlueSky'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bara de protectie AirDash'));

insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Capota motor AirBird'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Capota motor AluminiumGray'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Capota motor BlueSea'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Capota motor BlackAbyss'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Capota motor RainbowSteel'));

insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Grila radiator DarkABS'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Grila radiator ChromeWarmth'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Grila radiator DarkBreath'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Grila radiator ChromeWarmth'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Grila radiator ChromeCool'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Grila radiator AirCool'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Grila radiator AirLead'));

insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Scut motor ColdDark'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Scut motor ColdDark'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Scut motor ColdDark'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Scut motor ColdDark'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Scut motor ColdDark'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Scut motor PureBlack'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Scut motor BlackDarkness'));

insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Spoiler GrayShine'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Spoiler DarkCarbon'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Spoiler GrayShine'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Spoiler DarkCarbon'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Spoiler AirWind'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Spoiler DarkSpeed'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Spoiler PurpleShine'));

insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Maner usa PureSoul'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Maner usa AppleRed'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Maner usa WhiteOppening'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Maner usa MidNightBlack'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Maner usa BurgundyStrong'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Maner usa PinkUnicorn'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Maner usa TealSky'));

insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Top Tec'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Longlife III'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Edge Professional'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Specific'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Top Tec'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Longlife III'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Edge Professional'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Specific'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Edge Titanium FST 5l'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Edge Titanium FST 1l'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Specific'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Top Tec'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Longlife III'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Ulei Top Tec'));

insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Ultra Bright'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec CANBUS P21W'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Philips Vision'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Ultra Bright'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec CANBUS P21W'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Narva'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Ultra Bright'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec CANBUS P21W'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Philips Vision'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Ultra Bright'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec CANBUS P21W'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Narva'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Ultra Bright'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec CANBUS P21W'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A5'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Narva'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Ultra Bright'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec CANBUS P21W'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Philips Vision'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Ultra Bright'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec CANBUS P21W'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Bec Philips Vision'));

insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Parbriz Light'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A4 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Parbriz Rain+Light'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Parbriz Rain'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Audi' and model_masina='A6 Allroad'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Parbriz Rain+Light+Visor'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Volkswagen' and model_masina='Golf7'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Parbriz Visor'));
insert into combinatii_posibile(id_masina,id_piesa) VALUES((SELECT id_masina FROM Masini WHERE marca_masina = 'Dacia' and model_masina='Sandero'),(SELECT id_piesa FROM piese WHERE denumire_piesa='Parbriz Stock'));



	