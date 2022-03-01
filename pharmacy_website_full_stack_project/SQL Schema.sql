DROP SCHEMA IF EXISTS Project2_AlphaGamez;
CREATE SCHEMA Project2_Alphagamez;

DROP DATABASE IF EXISTS Project2_AlphaGamez;
CREATE DATABASE Project2_AlphaGamez;

USE Project2_AlphaGamez;

CREATE TABLE doctor
(
	  `SSN` VARCHAR(15) NOT NULL,
	  `Full_Name` VARCHAR(45) NULL,
	  `Specialty` VARCHAR(45) NULL,
	  `Years_Experience` INT NULL,
	  PRIMARY KEY (SSN)
);

CREATE TABLE patient
(	  `SSN` VARCHAR(15) NOT NULL,
	  `PCP_SSN` VARCHAR(15) NOT NULL,
	  `Full_Name` VARCHAR(45) NULL,
	  `Age` INT NULL,
	  `Address` VARCHAR(45) NULL,
	  `State` VARCHAR(45) NULL,
	  
	   PRIMARY KEY (SSN),
       FOREIGN KEY (PCP_SSN) REFERENCES doctor(SSN) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Pharmaceutical_Company 
(
		`Name` VARCHAR(45) NOT NULL,
		`Phone_Number` VARCHAR(45) NOT NULL,
		 PRIMARY KEY (Name)
);

CREATE TABLE Drug 
(
	    `Name` VARCHAR(45) NOT NULL,
	    `Formula` VARCHAR(45) NOT NULL,
	    `Pharmaceutical_Company_Name` VARCHAR(45) NOT NULL,
	    PRIMARY KEY (Name),
		FOREIGN KEY (Pharmaceutical_Company_Name) REFERENCES Pharmaceutical_Company (Name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Pharmacy 
(
		  `Name` VARCHAR(45) NOT NULL,
		  `Phone_Number` VARCHAR(45) NOT NULL,
		  `Address` VARCHAR(45) NULL,
		  `State` VARCHAR(45) NULL,
		  PRIMARY KEY (Name)
);

CREATE TABLE Pharmacy_has_Drug 
(
		`Drug_Name` VARCHAR(45) NOT NULL,
		`Pharmacy_Name` VARCHAR(45) NOT NULL,
		`Drug_Price` DECIMAL(6,2) NOT NULL,
		PRIMARY KEY (Drug_Name, Pharmacy_Name),
		FOREIGN KEY (Pharmacy_Name) REFERENCES Pharmacy(Name) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (Drug_Name) REFERENCES Drug(Name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Doctor_Prescribes_Drug
(
	   `PrescriptionID` INT NOT NULL AUTO_INCREMENT,
	   `Doctor_SSN` VARCHAR(15) NOT NULL,
	   `Patient_SSN` VARCHAR(15) NOT NULL,
	   `Drug_Name` VARCHAR(45) NULL,
	   `Prescription_Date` DATE NOT NULL,
	   `Prescription_Quantity` INT NOT NULL,
	    PRIMARY KEY (PrescriptionID),
        FOREIGN KEY (Doctor_SSN) REFERENCES doctor(SSN) ON DELETE RESTRICT ON UPDATE CASCADE,
		FOREIGN KEY (Patient_SSN) REFERENCES patient(SSN) ON DELETE RESTRICT ON UPDATE CASCADE,
		FOREIGN KEY (Drug_Name) REFERENCES Drug(Name) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Pharmacy_Order 
(
	`Order_Num` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`Doctor_Prescribes_Drug_PrescriptionID` INT NOT NULL,
	`Pharmacy_Name` VARCHAR(45) NOT NULL,
	`Order_Fill_Date` DATE NOT NULL,
	PRIMARY KEY (Order_Num),
    FOREIGN KEY (Pharmacy_Name) REFERENCES Pharmacy(Name) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Doctor_Prescribes_Drug_PrescriptionID) REFERENCES Doctor_Prescribes_Drug(PrescriptionID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Pharmacy_Pharmaceutical_Contract 
(
	  `Pharmacy_Name` VARCHAR(45) NOT NULL,
	  `Pharmaceutical_Company_Name` VARCHAR(45) NOT NULL,
	  `Contract_Supervisor_Name` VARCHAR(45) NOT NULL,
	  `Start_Date` DATE NOT NULL,
	  `End_Date` DATE NOT NULL,
	  `Contract_Text` LONGTEXT NULL,
	   PRIMARY KEY (Pharmacy_Name, Pharmaceutical_Company_Name),
	   FOREIGN KEY (Pharmacy_Name) REFERENCES Pharmacy(Name) ON DELETE CASCADE ON UPDATE CASCADE,
	   FOREIGN KEY (Pharmaceutical_Company_Name) REFERENCES Pharmaceutical_Company(Name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Doctor_has_Patient 
(
   `Doctor_SSN` VARCHAR(15) NOT NULL,
   `Patient_SSN` VARCHAR(15) NOT NULL,
    PRIMARY KEY (Doctor_SSN, Patient_SSN),
    FOREIGN KEY (Doctor_SSN) REFERENCES doctor(SSN) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Patient_SSN) REFERENCES patient(SSN) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('017-621-255','Jung Okamoto','Dermatology',16);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('037-058-332','Moshe Souther','Anesthesiology',21);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('058-906-950','Conrad Hernandez','Obstetrics',20);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('115-851-695','Lynn Mann','General Surgery',29);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('165-316-560','Grady Devaughn','Child Neurology',36);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('204-140-496','Adolfo McDuff','Hematology',65);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('209-005-913','Anastasia Godina','Infectious Disease',7);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('306-054-994','Daisey Sherwood','pediatric pathology',9);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('306-859-178','Keith Ocasio','Nephrology',11);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('314-473-953','Brendan Guzman','Nephrology',3);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('324-466-030','Woodrow Rogers','Radiology',2);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('330-467-430','Carolyne Foose','Pathology',41);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('344-872-162','Gerald Evans','Family Medicine',31);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('396-608-935','Cassi Wolske','Ocular Oncology',28);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('642-871-411','Aaron Gilbert','Gynaecology',10);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('673-931-565','Denise Hampton','Urology',47);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('684-590-871','Courtney Arnold','Ophthalmology',9);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('719-585-593','Roland Cain','Emergency Medicine',4);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('831-995-913','Mitzie Wier','Ophthalmology',12);
INSERT INTO doctor(SSN,Full_Name,Specialty,Years_Experience) VALUES ('877-338-007','Rachael Berry','Psychiatry',8);

INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('078-667-613','017-621-255','Eryn Dahm',76,'1151 Sawmill Ln Algonquin 60102','Illinois');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('084-607-028','037-058-332','Branda Wohlgemuth',11,'7971 Cottonwood Dr Jenison 49428','Michigan');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('231-984-539','058-906-950','Yuko Lannon',24,'3836 82nd Hwy W. Leland 38756','Missiissippi');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('248-588-541','115-851-695','Jamie Fowler',48,'1804 Cinnabar Way Green Bay 54311','Wisconsin');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('287-743-630','165-316-560','Kristin Mendez',31,'25545 Mackinac St Roseville 48066','Michigan');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('347-826-838','204-140-496','Dale Jackson',73,'1638 N 400 East Rd Pawnee 62558','Illinois');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('416-156-698','209-005-913','Rosalie Fuller',13,'219 Radius Rd Longs 29568','South Carolina');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('500-754 543','306-054-994','Elwood Balducci',13,'3060 Winnsboro Rd Monroe 71202','Louisiana');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('535-697-542','306-859-178','Darryl Bates',53,'413 Maren St West Hempstead 11552','New York');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('570-127-379','314-473-953','Jeanette Rini',5,'575 Boys Camp Rd Kilmarnock 22482','Virginia');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('589-777-394','324-466-030','Marleen Smalley',65,'3085 Meeting Creek Rd Eastview 42732','Kentucky');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('613-066-782','330-467-430','Katrina Simon',10,'205 Railroad St Kouts 46347','Indiana');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('615-550-912','344-872-162','Tyler Hawkins',7,'211 Dearborn St Saginaw 48602','Michigan');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('633-153-109','396-608-935','Jerome Newton',78,'16239 23rd Hwy NE Oak Park 56357','Minnesota');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('633-814-651','642-871-411','Isabel Terry',38,'1614 Wilkinson Ave Marquette 49855','Michigan');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('670-526-547','673-931-565','Hugh McCampbell',48,'210 Reeves Rd Laurel 39443','Mississippi');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('716-321-192','684-590-871','Tara French',47,'26 Homefield Ave Dracut 18261','Massachusetts');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('765-436-123','719-585-593','Corey Butler',44,'319 N Monroe St Butler 16001','Pennsylvania');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('775-852-534','831-995-913','Russell Newman',19,'417 New York St Chinook 59523','Montana');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('778-892-077','877-338-007','Arthur Watson',4,'73 Robin Hood Cir Many 71449','Louisiana');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('813-755-837','017-621-255','Tricia Harmon',72,'2612 S Beltline Blvd Columbia 29201','South Carolina');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('839-561-314','037-058-332','Darla Little',56,'14516 Scarboro St Poway 92064','California');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('849-499-886','058-906-950','Becky Houston',77,'1706 2nd Ave Kinder 70648','Louisiana');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('876-737-102','115-851-695','Isabell Ocasio',42,'3428 Brinkley Rd Temple Hills 20748','Maryland');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('879-394-408','165-316-560','Cathy Crawford',64,'124 Elmhurst St Highland Park 48203','Michigan');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('906-895-232','204-140-496','Adam Jefferson',32,'5504 Nc 35 Hwy Conway 27820','North Carolina');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('917-189-112','306-054-994','Earle Ku',88,'155 Pacific Rd SE Carrollton 44615','Ohio');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('926-188-044','314-473-953','Alysha Bray',76,'1462 E. Intruder Circle Virginia Beach 23454','Virginia');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('943-819-915','642-871-411','Whitney Marsh',22,'130 Broadway Ocean Grove 77516','New Jersey');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('952-451-286','642-871-411','Guadalupe Ortiz',70,'47 Rr 1 Liberty 25124','West Virginia');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('966-130-921','324-466-030','Diane Griffin',30,'1366 Hayes Rd Spring Lake 28390','North Carolina');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('981-504-426','673-931-565','Glenn Frank',62,'2217 Normandy Dr Michigan 46360','Indiana');
INSERT INTO patient(SSN,PCP_SSN,Full_Name,Age,Address,State) VALUES ('990-258-914','877-338-007','Glenda May',9,'300 Oak St Passaic 70155','New Jersey');

INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('017-621-255','078-667-613');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('642-871-411','078-667-613');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('037-058-332','084-607-028');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('058-906-950','084-607-028');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('165-316-560','231-984-539');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('719-585-593','231-984-539');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('204-140-496','500-754 543');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('344-872-162','500-754 543');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('209-005-913','570-127-379');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('324-466-030','570-127-379');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('306-054-994','589-777-394');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('673-931-565','589-777-394');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('115-851-695','670-526-547');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('306-859-178','670-526-547');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('330-467-430','765-436-123');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('684-590-871','765-436-123');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('396-608-935','775-852-534');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('877-338-007','775-852-534');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('314-473-953','778-892-077');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('831-995-913','778-892-077');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('017-621-255','813-755-837');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('037-058-332','876-737-102');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('165-316-560','906-895-232');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('204-140-496','917-189-112');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('209-005-913','926-188-044');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('306-054-994','966-130-921');
INSERT INTO doctor_has_patient(Doctor_SSN,Patient_SSN) VALUES ('306-859-178','990-258-914');

INSERT INTO pharmaceutical_company(Name,Phone_Number) VALUES ('Aqua Fetz Pharma','739-39-6856');
INSERT INTO pharmaceutical_company(Name,Phone_Number) VALUES ('Aspacia Pharma','698-321-8889');
INSERT INTO pharmaceutical_company(Name,Phone_Number) VALUES ('Batomig & Ja','983-638-2962');
INSERT INTO pharmaceutical_company(Name,Phone_Number) VALUES ('Bluelake','962-238-3608');
INSERT INTO pharmaceutical_company(Name,Phone_Number) VALUES ('CLxA Pharma','618-651-7140');
INSERT INTO pharmaceutical_company(Name,Phone_Number) VALUES ('Crystal+Dyna','337-293-8076');
INSERT INTO pharmaceutical_company(Name,Phone_Number) VALUES ('KeyWest Eco Pharma','472-824-7318');
INSERT INTO pharmaceutical_company(Name,Phone_Number) VALUES ('Limner Gom Pharma','790-644-9784');
INSERT INTO pharmaceutical_company(Name,Phone_Number) VALUES ('Rasp Haqui Pharma','762-473-7092');
INSERT INTO pharmaceutical_company(Name,Phone_Number) VALUES ('RedRx','671-317-8733');

INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Amlodipine','C26H31ClN2O8S','Aqua Fetz Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Atorvastain','C8H10N4O2','Aspacia Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Cephalexin','C16H17N3O4S','Batomig & Ja');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Citalopram','C20H22BrFN2O','Bluelake');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Clonazepam','C15H10ClN3O3','CLxA Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Clopidogrel','C16H16ClNO2SHCl','Crystal+Dyna');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Duloxetine','C18H19NOS','KeyWest Eco Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Escitalopram','C20H21FN2O','Limner Gom Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Fluticasone','C25H31F3O5S','Rasp Haqui Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Furosemide','C12H11ClN2O5S','RedRx');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('GabaPentin','C9H17NO2','Aqua Fetz Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Glipizide','C21H27N5O4S','Aspacia Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Ibuprofen','C13H18O2','Batomig & Ja');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Latanoprost','C26H40O5','Bluelake');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Levothyroxine','C15H11I4NO4','CLxA Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('LisinoPril','C18H21NO3','Crystal+Dyna');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Loratadine','C22H23ClN2O2','KeyWest Eco Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Losartan','C22H23ClN6O','Limner Gom Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Meloxicam','C14H13N3O4S2','Rasp Haqui Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Metformin','C4H11N5','RedRx');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Metoprolol','C15H25NO3','Aqua Fetz Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Montelukast','C35H36ClNO3S','Aspacia Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('OmePrazole','C17H19N3O3S','Batomig & Ja');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Pantoprazole','C16H14F2N3NaO4S','Bluelake');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Pragabalin','C8H17NO2','CLxA Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Sertraline','C17H18Cl3Nv','Crystal+Dyna');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Simvastatin','C25H38O5','KeyWest Eco Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Tamsulosini','C20H28N2O5S','Limner Gom Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Venlafaxine','C17H27NO2','Rasp Haqui Pharma');
INSERT INTO drug(Name,Formula,Pharmaceutical_Company_Name) VALUES ('Zolpidem','C19H21N3O','RedRx');

INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Candor Drugs','304-736-1312','619 4th Ave Washburn 58577','North Dakota');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Cogent Dole Drugs','970-476-7471','93590 99th Hwy S Junction 97448','Oregon');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Essentials Body Care','972-745-9169','4 Hidden Spring Ln Landenberg 19350','Pennsylvania');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Globex Pharmacy','920-825-1232','6005 Valencia Rd Gibsonia 15044','Pennsylvania');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Heart Beat Natural Pharmacy','540-253-5852','1380 Centerville Ln Gardnerville 89410','Nevada');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Inibrell Co','336-766-6157','26645 Kitch St','Inkster Michigan 48141');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Lambent Pharmacy','402-586-2355','15 Lincoln Dr Newark 19711','Delaware');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Revive Camphor Pharmacy','973-746-5148','803 Vivian St Wausa 68786','Nebraska');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Sanguine Pharmacy','910-738-9669','703 County Rd #433 Crossville 35962','Alabama');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Satia Drug Boutique','606-654-6253','310 Holly St Lumberton 28358','North Carolina');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Saturn Pharmacy','509-966-7247','118 Martin Dr Barboursville 25504','West Virginia');
INSERT INTO pharmacy(Name,Phone_Number,Address,State) VALUES ('Vappa Drugs','574-533-5550','112 Chestnut Hills Cir Willowbrook 60527','Illinois');

INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Amlodipine','Candor Drugs',23.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Atorvastain','Cogent Dole Drugs',98.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Cephalexin','Essentials Body Care',950.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Citalopram','Globex Pharmacy',800.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Clonazepam','Heart Beat Natural Pharmacy',92.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Clopidogrel','Lambent Pharmacy',410.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Duloxetine','Revive Camphor Pharmacy',36.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Escitalopram','Sanguine Pharmacy',60.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Fluticasone','Satia Drug Boutique',230.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Furosemide','Saturn Pharmacy',400.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('GabaPentin','Vappa Drugs',62.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Glipizide','Candor Drugs',495.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Ibuprofen','Cogent Dole Drugs',270.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Latanoprost','Essentials Body Care',320.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Levothyroxine','Globex Pharmacy',455.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('LisinoPril','Heart Beat Natural Pharmacy',66.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Loratadine','Inibrell Co',58.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Losartan','Lambent Pharmacy',60.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Meloxicam','Revive Camphor Pharmacy',420.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Metformin','Sanguine Pharmacy',190.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Metoprolol','Satia Drug Boutique',315.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Montelukast','Saturn Pharmacy',130.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('OmePrazole','Vappa Drugs',150.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Pantoprazole','Candor Drugs',85.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Pragabalin','Cogent Dole Drugs',180.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Sertraline','Essentials Body Care',45.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Simvastatin','Globex Pharmacy',188.00);
INSERT INTO pharmacy_has_drug(Drug_Name,Pharmacy_Name,Drug_Price) VALUES ('Tamsulosini','Heart Beat Natural Pharmacy',20.00);

INSERT INTO pharmacy_pharmaceutical_contract(Pharmacy_Name,Pharmaceutical_Company_Name,Contract_Supervisor_Name,Start_Date,End_Date) VALUES ('Candor Drugs','Aqua Fetz Pharma','Charlotte Burns','2013-11-21','2040-08-19');
INSERT INTO pharmacy_pharmaceutical_contract(Pharmacy_Name,Pharmaceutical_Company_Name,Contract_Supervisor_Name,Start_Date,End_Date) VALUES ('Cogent Dole Drugs','Aspacia Pharma','Miranda Shaw','1981-02-03','2018-07-02');
INSERT INTO pharmacy_pharmaceutical_contract(Pharmacy_Name,Pharmaceutical_Company_Name,Contract_Supervisor_Name,Start_Date,End_Date) VALUES ('Essentials Body Care','Batomig & Ja','Roland Lloyd','1981-09-11','2007-08-02');
INSERT INTO pharmacy_pharmaceutical_contract(Pharmacy_Name,Pharmaceutical_Company_Name,Contract_Supervisor_Name,Start_Date,End_Date) VALUES ('Globex Pharmacy','Bluelake','Ora Soto','2013-11-07','2026-03-15');
INSERT INTO pharmacy_pharmaceutical_contract(Pharmacy_Name,Pharmaceutical_Company_Name,Contract_Supervisor_Name,Start_Date,End_Date) VALUES ('Heart Beat Natural Pharmacy','CLxA Pharma','Edward Doyle','2000-02-18','2039-12-13');
INSERT INTO pharmacy_pharmaceutical_contract(Pharmacy_Name,Pharmaceutical_Company_Name,Contract_Supervisor_Name,Start_Date,End_Date) VALUES ('Inibrell Co','Crystal+Dyna','Marilyn Powell','1989-12-19','2043-05-14');
INSERT INTO pharmacy_pharmaceutical_contract(Pharmacy_Name,Pharmaceutical_Company_Name,Contract_Supervisor_Name,Start_Date,End_Date) VALUES ('Lambent Pharmacy','KeyWest Eco Pharma','Dustin Hicks','1984-12-11','2019-08-29');

INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (1,'017-621-255','078-667-613','Amlodipine','1976-10-28',2);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (2,'037-058-332','084-607-028','Atorvastain','2037-07-18',10);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (3,'058-906-950','231-984-539','Cephalexin','2088-12-02',4);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (4,'115-851-695','500-754 543','Citalopram','1955-07-18',20);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (5,'165-316-560','570-127-379','Clonazepam','1958-10-21',200);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (6,'204-140-496','589-777-394','Clopidogrel','1906-09-18',50);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (7,'209-005-913','670-526-547','Duloxetine','1905-03-17',40);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (8,'306-054-994','765-436-123','Escitalopram','2015-05-07',10);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (9,'306-859-178','775-852-534','Fluticasone','1931-08-12',70);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (10,'314-473-953','778-892-077','Furosemide','2003-06-22',25);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (11,'324-466-030','813-755-837','GabaPentin','1976-10-28',900);
INSERT INTO doctor_prescribes_drug(PrescriptionID,Doctor_SSN,Patient_SSN,Drug_Name,Prescription_Date,Prescription_Quantity) VALUES (12,'330-467-430','876-737-102','Glipizide','2037-07-18',10);

INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (1,1,'Candor Drugs','1949-04-25');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (2,2,'Cogent Dole Drugs','2046-05-31');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (3,3,'Essentials Body Care','2012-03-14');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (4,4,'Globex Pharmacy','1989-07-29');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (5,5,'Heart Beat Natural Pharmacy','2092-06-12');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (6,6,'Inibrell Co','1919-06-29');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (7,7,'Lambent Pharmacy','1998-11-09');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (8,8,'Revive Camphor Pharmacy','1981-03-17');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (9,9,'Sanguine Pharmacy','1935-11-18');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (10,10,'Satia Drug Boutique','2036-04-09');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (11,11,'Saturn Pharmacy','1960-08-11');
INSERT INTO pharmacy_order(Order_Num,Doctor_Prescribes_Drug_PrescriptionID,Pharmacy_Name,Order_Fill_Date) VALUES (12,12,'Vappa Drugs','1917-08-12');


-- REPORT SELECT STATEMENTS

-- Query 1: Select the doctor who has the highest amount of experience in “Nephrology”
SELECT  SSN, Full_Name, Specialty, MAX(Years_Experience) 
AS "Years of Experience" 
FROM Doctor WHERE Specialty = "Nephrology";

-- Query 2: Show all prescriptions and prescription quantities as well as the name of the medication, for all 
-- patients and include the doctors who prescribed it. Order the data by date of prescription.
SELECT dpd.Prescription_Date, dpd.Prescription_Quantity, dpd.Drug_Name, pat.Full_Name 
AS 'Patient FullName', d.Full_Name AS 'Doctor Full_Name'
FROM doctor d 
JOIN doctor_has_patient dhp ON dhp.Doctor_SSN = d.SSN
JOIN doctor_prescribes_drug dpd ON dpd.Doctor_SSN = dhp.Doctor_SSN
JOIN patient pat ON pat.SSN = dhp.Patient_SSN
ORDER BY Prescription_Date;

-- Query 3: Show medication names and price, where the contract supervisor is Charlotte Burns. Show the
-- name of the pharmaceutical company as well as the name of the pharmacy that has the drug. 
-- No duplicate entries. Order the data by medication price.
SELECT DISTINCT d.name, phd.drug_price, phd.Pharmacy_Name AS 'Pharmacy Name', 
ppc.Pharmaceutical_Company_Name, ppc.Contract_Supervisor_Name
FROM drug d 
JOIN pharmacy_has_drug phd ON phd.Drug_Name = d.name 
JOIN pharmacy p ON p.name = phd.Pharmacy_Name
JOIN pharmacy_pharmaceutical_contract ppc ON ppc.Pharmacy_Name = p.Name
WHERE ppc.Contract_Supervisor_Name = 'Charlotte Burns'
ORDER BY phd.drug_price;

-- Query 4: Show the full patient name, social security number, age, as well as medication name and formula.
-- make sure the formula does not contain the ingredient C1. Order the data by patient age.
SELECT d.name AS 'Medication Name', d.formula AS 'Medication Formula', pat.SSN 
AS 'Patient SSN', pat.Full_Name AS 'Patient Full Name', pat.Age AS 'Patient Age'
FROM drug d
JOIN doctor_prescribes_drug dpd ON dpd.Drug_Name = d.Name
JOIN patient pat ON pat.SSN = dpd.Patient_SSN
WHERE d.formula NOT LIKE '%C1%'
ORDER BY pat.Age;

-- Query 5: Show Pharmacy name, , and state as well as matching patient data. This query is used to 
-- provide patients with information on which pharmacy to order from.
SELECT p.name AS 'Pharmacy Name', P.Address AS 'Pharmacy  Location', p.State AS 
'Pharmacy State Location', pat.Full_Name AS 'Patient Full Name', pat.State AS 'Patient Resides In St'
FROM pharmacy p
JOIN pharmacy_has_drug phd ON phd.Pharmacy_Name = p.Name
JOIN drug d ON d.Name = phd.Drug_Name
JOIN doctor_prescribes_drug dpd ON dpd.Drug_Name = d.Name
JOIN patient pat ON pat.SSN = dpd.Patient_SSN
ORDER BY p.State;