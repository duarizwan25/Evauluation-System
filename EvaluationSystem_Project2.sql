
-- DROP statements (for re-run convenience)
DROP TABLE IF EXISTS Evaluation;
DROP TABLE IF EXISTS Assessment;
DROP TABLE IF EXISTS RubricLevel;
DROP TABLE IF EXISTS Rubric;
DROP TABLE IF EXISTS CLO;
DROP TABLE IF EXISTS Student;

-- Table 1: Student
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    RollNumber VARCHAR(20) UNIQUE,
    Session VARCHAR(10),
    Semester INT
);

-- Table 2: CLO
CREATE TABLE CLO (
    CLO_ID INT PRIMARY KEY,
    Description TEXT,
    Taxonomy_Level VARCHAR(50),
    PLO VARCHAR(50)
);

-- Table 3: Rubric
CREATE TABLE Rubric (
    RubricID INT PRIMARY KEY,
    CLO_ID INT,
    Description TEXT,
    FOREIGN KEY (CLO_ID) REFERENCES CLO(CLO_ID)
);

-- Table 4: RubricLevel
CREATE TABLE RubricLevel (
    RubricLevelID INT PRIMARY KEY,
    RubricID INT,
    LevelNumber INT CHECK (LevelNumber BETWEEN 1 AND 6),
    Criteria TEXT,
    Marks INT CHECK (Marks >= 0),
    FOREIGN KEY (RubricID) REFERENCES Rubric(RubricID)
);

-- Table 5: Assessment
CREATE TABLE Assessment (
    AssessmentID INT PRIMARY KEY,
    Title VARCHAR(100),
    TotalMarks INT,
    Weightage DECIMAL(5,2)
);

-- Table 6: Evaluation
CREATE TABLE Evaluation (
    EvaluationID INT PRIMARY KEY,
    StudentID INT,
    AssessmentID INT,
    RubricLevelID INT,
    ObtainedMarks INT CHECK (ObtainedMarks >= 0),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (AssessmentID) REFERENCES Assessment(AssessmentID),
    FOREIGN KEY (RubricLevelID) REFERENCES RubricLevel(RubricLevelID)
);

-- Students
INSERT INTO Student VALUES 
(1, 'Ali Raza', 'CE123', '2023', 4),
(2, 'Fatima Khan', 'CE124', '2023', 4),
(3, 'Ahmed Noor', 'CE125', '2023', 4);

-- CLOs
INSERT INTO CLO VALUES 
(1, 'Construct DML queries', 'Cognitive Two', 'Modern Tool Usage'),
(2, 'Construct DDL queries', 'Cognitive Two', 'Modern Tool Usage'),
(3, 'Develop projects with real data', 'Cognitive Two', 'Design/Development');

-- Rubrics
INSERT INTO Rubric VALUES 
(1, 1, 'Evaluate DML syntax'),
(2, 2, 'Check table creation and constraints'),
(3, 3, 'Evaluate full project with real dataset');

-- Rubric Levels
INSERT INTO RubricLevel VALUES 
(1, 1, 1, 'Minimal DML usage', 1),
(2, 1, 2, 'Basic DML usage', 2),
(3, 2, 1, 'Incorrect DDL structure', 1),
(4, 2, 2, 'Correct basic table creation', 2),
(5, 3, 1, 'Limited project structure', 2),
(6, 3, 2, 'Complete project with reports', 5);

-- Assessments
INSERT INTO Assessment VALUES 
(1, 'Lab 9 - Project 2', 10, 15.00);

-- Evaluations
INSERT INTO Evaluation VALUES 
(1, 1, 1, 2, 2),
(2, 2, 1, 4, 2),
(3, 3, 1, 6, 5);
