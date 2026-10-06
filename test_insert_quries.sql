USE gtonline;

INSERT INTO Users
(Email, Password)
VALUES
('ahmad@gmail.com', '12345'),
('fatima@gmail.com', '67890'),
('admin@gtonline.com', 'admin123');

INSERT INTO User_Name
(Email, FirstName, LastName)
VALUES
('ahmad@gmail.com','Ahmad', 'Ahmadi'),
('fatima@gmail.com','Fatima', 'Karimi'),
('admin@gtonline.com','Admin', 'User');

INSERT INTO Regular_User
(Email, Sex, Birthdate, CurrentCity, HomeTown)
VALUES
('ahmad@gmail.com', 'M', '2003-05-15', 'Herat', 'Herat'),
('fatima@gmail.com', 'F', '2004-08-20', 'Kabul', 'Herat');

INSERT INTO Admin_User
(Email, LastLogin)
VALUES
('admin@gtonline.com', '2026-10-04 09:00:00');

INSERT INTO Regular_User_Interests
(Email, Interest)
VALUES
('ahmad@gmail.com', 'Programming'),
('ahmad@gmail.com', 'Chess'),
('ahmad@gmail.com', 'Football');

INSERT INTO Employer
(EmployerName)
VALUES
('Ahmad'),
('Fathima');

INSERT INTO User_Employer
(Email, EmployerName, JobTitle)
VALUES
('fatima@gmail.com', 'Fathima', 'Software Engineer'),
('ahmad@gmail.com', 'Ahmad', 'Software Engineer'),
('ahmad@gmail.com', 'Ahmad', 'Database Engineer');

INSERT INTO School_Type
(TypeName)
VALUES
('University'),
('High School');

INSERT INTO School
(SchoolName, TypeName)
VALUES
('Herat University', 'University'),
('Ahmad Shah Baba High School', 'High School');

INSERT INTO User_School
(Email, SchoolName, YearGraduated)
VALUES
('ahmad@gmail.com', 'Herat University', 2026);

INSERT INTO User_School
(Email, SchoolName, YearGraduated)
VALUES
('fatima@gmail.com', 'Herat University', 2025);

INSERT INTO Friendship
(RequesterEmail, AccepterEmail)
VALUES
('ahmad@gmail.com', 'fatima@gmail.com');

INSERT INTO users
(Email,Password)
VALUES
('unknown@gmail.com','112278');

INSERT INTO Regular_User
(Email, Sex, Birthdate, CurrentCity, HomeTown)
VALUES
('unknown@gmail.com', 'M', '2000-01-01', 'Herat', 'Herat');