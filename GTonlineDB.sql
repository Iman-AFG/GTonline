CREATE DATABASE GTonline;
USE GTonline;

-- =========================================
-- 1. USERS
-- =========================================
CREATE TABLE Users(Email VARCHAR(100) PRIMARY KEY,
	Password VARCHAR(100) NOT NULL
);

CREATE TABLE Name (First_name VARCHAR(100), 
	Last_name VARCHAR(100), 
	Email VARCHAR(100) PRIMARY KEY,
    
	FOREIGN KEY (Email) 
		REFERENCES Users(Email)
);
-- =========================================
-- 2. ADMIN USER
-- =========================================
CREATE TABLE AdminUser(Email VARCHAR(100) PRIMARY KEY,
	Last_login DATETIME,
    
	FOREIGN KEY(Email)
		REFERENCES Users(Email) ON DELETE CASCADE
);
-- =========================================
-- 3. REGULAR USER
-- =========================================
CREATE TABLE RegularUser(Email VARCHAR(100) PRIMARY KEY,
	Sex ENUM('M','F'),
	Birth_Date DATE,
	Current_City VARCHAR(100),
	HomeTown VARCHAR(100),
    
	FOREIGN KEY(Email)
		REFERENCES Users(Email) ON DELETE CASCADE
);
-- =========================================
-- 4. REGULAR USER INTEREST
-- =========================================
CREATE TABLE RegularUserInterests(Email VARCHAR(100),
	Interest VARCHAR(100),
	PRIMARY KEY (Email, Interest),
    
	FOREIGN KEY (email) 
		REFERENCES RegularUser(email) ON DELETE CASCADE
);
-- =========================================
-- 5. EMPLOYER
-- =========================================
CREATE TABLE Employer(
	Employer_Name VARCHAR(100) PRIMARY KEY
);
-- =========================================
-- 6. USER EMPLOYER
-- =========================================
CREATE TABLE UsreEmployee(Job_Title VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Employer_Name VARCHAR(100) NOT NULL,
                            
    PRIMARY KEY(Job_Title,Email,Employer_Name),
                            
    FOREIGN KEY (email) 
		REFERENCES RegularUser(email) ON DELETE CASCADE,
                                        
	FOREIGN KEY (Employer_Name) 
		REFERENCES Employer(Employer_Name) ON DELETE CASCADE
);
-- =========================================
-- 7. SCHOOL TYPE
-- =========================================
CREATE TABLE SchoolType (
    TypeName VARCHAR(100) PRIMARY KEY
);
-- =========================================
-- 8. SCHOOL
-- =========================================
CREATE TABLE School (
    SchoolName VARCHAR(255) PRIMARY KEY,
    TypeName VARCHAR(100) NOT NULL,

    FOREIGN KEY (TypeName)
        REFERENCES SchoolType(TypeName) ON DELETE CASCADE
);
-- =========================================
-- 9. USER SCHOOL
-- =========================================
CREATE TABLE UserSchool (
    Email VARCHAR(100) NOT NULL,
    SchoolName VARCHAR(255) NOT NULL,
    YearGraduated YEAR NOT NULL,

    PRIMARY KEY (Email, SchoolName, YearGraduated),

    FOREIGN KEY (Email)
        REFERENCES RegularUser(Email) ON DELETE CASCADE,

    FOREIGN KEY (SchoolName)
        REFERENCES School(SchoolName)ON DELETE CASCADE
);
-- =========================================
-- 10. FRIENDSHIP
-- =========================================
CREATE TABLE Friendship (
    RequesterEmail VARCHAR(100) PRIMARY KEY ,
    AccepterEmail VARCHAR(100),
    
    FOREIGN KEY (RequesterEmail)
        REFERENCES RegularUser(Email) ON DELETE CASCADE,

    FOREIGN KEY (AccepterEmail)
        REFERENCES RegularUser(Email) ON DELETE CASCADE
);



