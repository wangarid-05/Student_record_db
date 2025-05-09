CREATE DATABASE StudentRecordsDB;
USE StudentRecordsDB;
-- Students Table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Gender ENUM('Male', 'Female') NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(100)
);

-- Courses Table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL
);

-- Professors Table
CREATE TABLE Professors (
    ProfessorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Department VARCHAR(100) NOT NULL
);

-- Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Grades Table
CREATE TABLE Grades (
    GradeID INT AUTO_INCREMENT PRIMARY KEY,
    EnrollmentID INT NOT NULL,
    Grade VARCHAR(2),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);

-- ProfessorAssignments Table
CREATE TABLE ProfessorAssignments (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    ProfessorID INT NOT NULL,
    CourseID INT NOT NULL,
    FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Students
INSERT INTO Students (FirstName, LastName, DOB, Gender, Email, Phone, Address) VALUES
('Alice', 'Johnson', '2001-04-12', 'Female', 'alice.j@example.com', '0712345678', 'Nairobi'),
('Brian', 'Ochieng', '2000-11-08', 'Male', 'brian.o@example.com', '0722233445', 'Kisumu'),
('Cynthia', 'Kariuki', '2002-01-15', 'Female', 'cynthia.k@example.com', '0745566778', 'Mombasa'),
('Daniel', 'Mwangi', '1999-09-20', 'Male', 'daniel.m@example.com', '0751234567', 'Nakuru'),
('Emily', 'Njeri', '2001-06-10', 'Female', 'emily.n@example.com', '0709988776', 'Eldoret'),
('Felix', 'Otieno', '2003-03-03', 'Male', 'felix.o@example.com', '0733445566', 'Kakamega'),
('Grace', 'Mutiso', '2000-12-25', 'Female', 'grace.m@example.com', '0711778899', 'Machakos'),
('Henry', 'Kiptoo', '1998-07-30', 'Male', 'henry.k@example.com', '0729988776', 'Kericho'),
('Ivy', 'Wambui', '2002-10-02', 'Female', 'ivy.w@example.com', '0755667788', 'Thika'),
('James', 'Odhiambo', '2001-08-18', 'Male', 'james.o@example.com', '0767788990', 'Kisii');

-- Courses
INSERT INTO Courses (CourseName, Credits) VALUES
('Database Systems', 3),
('Web Development', 4),
('Data Structures', 3),
('Operating Systems', 3),
('Networking Fundamentals', 2),
('Mobile App Development', 4),
('Software Engineering', 3),
('Computer Architecture', 3),
('Cybersecurity Basics', 2),
('Artificial Intelligence', 4);

-- Professors
INSERT INTO Professors (FirstName, LastName, Email, Department) VALUES
('John', 'Karanja', 'john.k@example.com', 'Computer Science'),
('Lucy', 'Kamau', 'lucy.k@example.com', 'Information Technology'),
('Peter', 'Otieno', 'peter.o@example.com', 'Software Engineering'),
('Jane', 'Wanjiku', 'jane.w@example.com', 'Computer Science'),
('Mark', 'Mwangi', 'mark.m@example.com', 'Cybersecurity'),
('Susan', 'Omondi', 'susan.o@example.com', 'Data Science'),
('George', 'Ndegwa', 'george.n@example.com', 'Computer Engineering'),
('Ann', 'Chebet', 'ann.c@example.com', 'Networking'),
('David', 'Munyao', 'david.m@example.com', 'AI & Robotics'),
('Carol', 'Kimani', 'carol.k@example.com', 'Mobile Computing');

-- Enrollments
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-11'),
(3, 3, '2024-01-12'),
(4, 4, '2024-01-13'),
(5, 5, '2024-01-14'),
(6, 6, '2024-01-15'),
(7, 7, '2024-01-16'),
(8, 8, '2024-01-17'),
(9, 9, '2024-01-18'),
(10, 10, '2024-01-19');

-- Grades
INSERT INTO Grades (EnrollmentID, Grade) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'A'),
(5, 'B'),
(6, 'C'),
(7, 'A'),
(8, 'B'),
(9, 'C'),
(10, 'A');

-- Professor Assignments
INSERT INTO ProfessorAssignments (ProfessorID, CourseID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
