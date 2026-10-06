
DROP DATABASE GTonline;

CREATE DATABASE GTonline;
USE GTonline;

-- =========================================
-- 1. USERS
-- =========================================
CREATE TABLE Users(
	Email VARCHAR(100) PRIMARY KEY,
	Password VARCHAR(100) NOT NULL
);

CREATE TABLE User_Name (
	FirstName VARCHAR(100), 
	LastName VARCHAR(100), 
	Email VARCHAR(100) PRIMARY KEY,
    
	FOREIGN KEY (Email) 
		REFERENCES Users(Email)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- 2. ADMIN USER
-- =========================================
CREATE TABLE Admin_User(
	Email VARCHAR(100) PRIMARY KEY,
	LastLogin DATETIME,
    
	FOREIGN KEY(Email)
		REFERENCES Users(Email) 
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- =========================================
-- 3. REGULAR USER
-- =========================================
CREATE TABLE Regular_User(
	Email VARCHAR(100) PRIMARY KEY,
	Sex ENUM('M','F'),
	BirthDate DATE,
	CurrentCity VARCHAR(100),
	HomeTown VARCHAR(100),
    
	FOREIGN KEY(Email)
		REFERENCES Users(Email) 
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- =========================================
-- 4. REGULAR USER INTEREST
-- =========================================
CREATE TABLE Regular_User_Interests(
	Email VARCHAR(100),
	Interest VARCHAR(100),
	PRIMARY KEY (Email, Interest),
    
	FOREIGN KEY (email) 
		REFERENCES Regular_User(email) 
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- 5. EMPLOYER
-- =========================================
CREATE TABLE Employer(
	EmployerName VARCHAR(100) PRIMARY KEY
);

-- =========================================
-- 6. USER EMPLOYER
-- =========================================
CREATE TABLE User_Employer(
	EmployerName VARCHAR(100),
	Email VARCHAR(100),
	JobTitle VARCHAR(100),
                            
    PRIMARY KEY(JobTitle,Email,EmployerName),
                            
    FOREIGN KEY (Email) 
		REFERENCES Regular_User(Email) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
                                        
	FOREIGN KEY (EmployerName) 
		REFERENCES Employer(EmployerName) 
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- 7. SCHOOL TYPE
-- =========================================
CREATE TABLE School_Type (
    TypeName VARCHAR(100) PRIMARY KEY
);

-- =========================================
-- 8. SCHOOL
-- =========================================
CREATE TABLE School (
    SchoolName VARCHAR(255) PRIMARY KEY,
    TypeName VARCHAR(100) NOT NULL,

    FOREIGN KEY (TypeName)
        REFERENCES School_Type(TypeName) 
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- 9. USER SCHOOL
-- =========================================
CREATE TABLE User_School (
    Email VARCHAR(100) NOT NULL,
    SchoolName VARCHAR(255) NOT NULL,
    YearGraduated YEAR NOT NULL,

    PRIMARY KEY (Email, SchoolName, YearGraduated),

    FOREIGN KEY (Email)
        REFERENCES Regular_User(Email) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (SchoolName)
        REFERENCES School(SchoolName)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- 10. FRIENDSHIP
-- =========================================
CREATE TABLE Friendship (
    RequesterEmail VARCHAR(100) PRIMARY KEY ,
    AccepterEmail VARCHAR(100),
    
    FOREIGN KEY (RequesterEmail)
        REFERENCES Regular_User(Email) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (AccepterEmail)
        REFERENCES Regular_User(Email) 
		ON DELETE CASCADE
        ON UPDATE CASCADE
);



