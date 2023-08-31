
CREATE TABLE STUDENT(
STUDENT_ID NUMBER(10),
NAME VARCHAR(50),
EMAIL VARCHAR(50),
GENDER VARCHAR(5),
INSTITUTION VARCHAR(50),
CLASS NUMBER(2) CONSTRAINT CL CHECK(CLASS < 13),
CONTACT NUMBER(11),
DOB DATE,
GUARDIAN_NAME VARCHAR2(50),
PASSWORD VARCHAR(20),
PRIMARY KEY (STUDENT_ID)
);


CREATE TABLE COURSE(
COURSE_ID NUMBER(3),
COURSE_NAME VARCHAR(100),
ENROLLMENT NUMBER(5),
START_DATE DATE,
REGISTRATON_FEES NUMBER(3),
TOTAL_CLASS NUMBER(3),
DURATION VARCHAR(4),
PRIMARY KEY(COURSE_ID)
);

CREATE TABLE EXAM(
COURSE_ID NUMBER(3),
EXAM_ID NUMBER(5),
DURATION VARCHAR(5),
STARTING  VARCHAR(5),
TOTAL_MARKS NUMBER(3),
PARTICIPANT NUMBER(4),
QUESTION_REVIEW VARCHAR(15),
PRIMARY KEY (EXAM_ID),
FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID)
);



CREATE TABLE INSTRUCTOR(
INSTRUCTOR_ID NUMBER(5),
NAME VARCHAR(50) NOT NULL,
EXPERIENCE NUMBER(2),
MONTHLY_SALARY NUMBER(5),
RATING NUMBER(4),
EMAIL VARCHAR(50),
AGE NUMBER(2),
PRIMARY KEY (INSTRUCTOR_ID)
);

CREATE TABLE LECTURE(
INSTRUCTOR_ID NUMBER(5),
    LECTURE_NO NUMBER(10),
    TOPIC VARCHAR2(50),
    LECTURE_DATE DATE,
    START_TIME VARCHAR2(50),
    DURATION VARCHAR(4),
    PRIMARY KEY(LECTURE_NO, TOPIC),
		FOREIGN KEY(INSTRUCTOR_ID) REFERENCES INSTRUCTOR(INSTRUCTOR_ID)
);




CREATE TABLE QUESTON_BANK(
COURSE_ID NUMBER(3),
CHAPTER VARCHAR(50),
TOPIC VARCHAR(100),
QUESTION VARCHAR(1000),
ANSWER VARCHAR(1000),
YEAR NUMBER(5),
PRIMARY KEY(QUESTION,YEAR),
FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID) 
);

CREATE TABLE RESOURCES(
COURSE_ID NUMBER(3),
RESOURCE_ID NUMBER(20),
CHAPTER NUMBER(2),
TOPIC VARCHAR(15),
CLASS_RECORDING VARCHAR(30),
CLASS_NOTE VARCHAR(1000),
SUGGESTION VARCHAR (500),
PRIMARY KEY(RESOURCE_ID),
FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID)
);



CREATE TABLE STUDENT_FORUM(
STUDENT_ID NUMBER(10),
TITLE VARCHAR(60), 
DESCRIPTION VARCHAR(1000),
QUESTION_NO NUMBER(4),
QUESTION VARCHAR(500),
ANSWER VARCHAR(1200),
PRIMARY KEY(TITLE, QUESTION_NO),
FOREIGN KEY(STUDENT_ID) REFERENCES STUDENT(STUDENT_ID)
);

CREATE TABLE GUARDIAN_FORUM(
GUARDIAN_ID NUMBER(10),
TITLE VARCHAR(60), 
DESCRIPTION VARCHAR(1000),
QUESTION_NO NUMBER(4),
QUESTION VARCHAR(500),
ANSWER VARCHAR(1200),
PRIMARY KEY(TITLE, QUESTION_NO),
FOREIGN KEY(GUARDIAN_ID) REFERENCES GUARDIAN(GUARDIAN_ID)
);


CREATE TABLE AUTHORITY(
EMPLOYEE_ID NUMBER(5),
NAME VARCHAR(15) NOT NULL,
JOB_ID VARCHAR(10),
MONTHLY_SALARY NUMBER(10),
EMAIL VARCHAR(20) UNIQUE,
JOIN_DATE DATE ,
PRIMARY KEY (EMPLOYEE_ID)
);


CREATE TABLE DUE_PAYMENT(
DUE_ID NUMBER(5),
TOTAL_FEES NUMBER(5),
DUE_AMOUNT NUMBER(5),
DEADLINE DATE,
PRIMARY KEY(DUE_ID)
);



CREATE TABLE ASSIGNMENT(
INSTRUCTOR_ID NUMBER(5),
ASSIGNMENT_ID NUMBER(5),
TOPIC VARCHAR(20),
TOTAL_MARKS NUMBER(5),
PUBLISHING_DATE DATE,
DEADLINE DATE,
SUBMISSION_STATUS VARCHAR(1),
SUBMISSION_TIME  VARCHAR(6),
PRIMARY KEY(ASSIGNMENT_ID),
FOREIGN KEY(INSTRUCTOR_ID) REFERENCES INSTRUCTOR(INSTRUCTOR_ID)
);




CREATE TABLE RESULT(
STUDENT_ID NUMBER(10),
RESULT_ID NUMBER(5),
TITLE VARCHAR(100),
TOTAL_MARKS NUMBER(3),
OBTAINED_MARK NUMBER(3),
REMARKS VARCHAR(100),
GRADE NUMBER(4),
PRIMARY KEY(RESULT_ID),
FOREIGN KEY(STUDENT_ID) REFERENCES STUDENT(STUDENT_ID) 
);

CREATE TABLE GUARDIAN(
STUDENT_ID NUMBER(10),
GUARDIAN_ID NUMBER(6),
NAME VARCHAR(20),
EMAIL VARCHAR(20),
CONTACT_NO NUMBER(11),
PROFESSION VARCHAR(20),
PRIMARY KEY(GUARDIAN_ID),
FOREIGN KEY(STUDENT_ID) REFERENCES STUDENT(STUDENT_ID)
);

CREATE TABLE R_TUTORING(
STUDENT_ID NUMBER(5) REFERENCES STUDENT (STUDENT_ID),
INSTRUCTOR_ID NUMBER(5) REFERENCES INSTRUCTOR (INSTRUCTOR_ID),
START_DATE DATE,
TUTORING_FEE NUMBER(4),
REVIEW VARCHAR(1000),
PRIMARY KEY(STUDENT_ID,INSTRUCTOR_ID)
);

CREATE TABLE R_PENDING(
STUDENT_ID NUMBER(5) REFERENCES STUDENT (STUDENT_ID),
COURSE_ID NUMBER(5) REFERENCES COURSE(COURSE_ID),
DUE_ID NUMBER(5) REFERENCES DUE_PAYMENT(DUE_ID),
RECENT_TRANSACTION DATE,
PRIMARY KEY(STUDENT_ID,COURSE_ID,DUE_ID)
);

 


CREATE TABLE R_TEACH(
COURSE_ID NUMBER(3) REFERENCES COURSE(COURSE_ID),
INSTRUCTOR_ID NUMBER(5) REFERENCES INSTRUCTOR(INSTRUCTOR_ID),
TIMES_TAKEN NUMBER(2),
STUDENT_REVIEW VARCHAR(15),
PRIMARY KEY (INSTRUCTOR_ID, COURSE_ID)
);

CREATE TABLE R_TAKE(
STUDENT_ID NUMBER(5) REFERENCES STUDENT(STUDENT_ID),
COURSE_ID NUMBER(3) REFERENCES COURSE(COURSE_ID),
START_DATE DATE,
PRIMARY KEY (STUDENT_ID, COURSE_ID)
);