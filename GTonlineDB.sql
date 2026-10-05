CREATE DATABASE GTonline;
USE GTonline;

CREATE TABLE Users(Email VARCHAR(100) PRIMARY KEY,
					Password VARCHAR(100) NOT NULL
                    );
CREATE TABLE Name (First_name VARCHAR(100), 
				  Last_name VARCHAR(100), 
                  Email VARCHAR(100) PRIMARY KEY, 
                  FOREIGN KEY (Email) 
					REFERENCES Users(Email)
                  );
CREATE TABLE AdminUser(Email VARCHAR(100) PRIMARY KEY,
						Last_login DATETIME,
                        FOREIGN KEY(Email)
							REFERENCES Users(Email)
                            );