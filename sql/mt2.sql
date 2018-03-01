CREATE TABLE School(
SchoolID Integer Primary Key,
Name varchar(64),
City varchar(32), 
State varchar(3)
);


CREATE TABLE Professor(
ProfId Integer Primary Key,
F_Nm varchar(32),
L_Nm varchar(32),
score Integer,
ChiliPeppers Integer,
School Integer
);


8972	Drexel University	Philadelphia	PA
7896	(null)	Northland	WI
5439	Big State University	Providence	RI
1738	Wishuwentere College	Miami	FL
5033	Hardtogetin College	Cambridge	MA


insert into School values(8972, 'Drexel University','Philadelphia','PA');
insert into School values(7896,null,'Northland','WI');
insert into School values(5439,'Big State University','Providence','RI');
insert into School values(1738,'Wishuwentere College','Miami','FL');
insert into School values(5033,'Hardtogetin College','Cambridge','MA');


insert into Professor values(345,'Lois','Lane',2.4,14,7896);
insert into Professor values(835,'Bruce','Wayne',2.6,9,5439);
insert into Professor values(890,'Super','Man',3.3,12,5033);
insert into Professor values(267,'Peter','Parker',3.8,2,8972);
insert into Professor values(306,'Clark','Kent',2.5,0,(null));

insert into Professor values(

SELECT p.F_Nm, p.L_Nm, p.Score, s.Name
FROM Professor p JOIN School s ON p.School = s.SchoolId;
SELECT p.F_Nm, p.L_Nm, p.Score, s.Name
FROM Professor p LEFT JOIN School s ON p.School = s.SchoolId;

SELECT p.F_Nm, p.L_Nm, p.Score, s.Name
FROM Professor p RIGHT JOIN School s ON p.School = s.SchoolId;
d)	SELECT p.F_Nm, p.L_Nm, p.Score, s.Name
FROM Professor p FULL OUTER JOIN School s ON p.School = s.SchoolId;

c)	SELECT *
FROM Professor p RIGHT JOIN School s ON p.School = s.SchoolId;

SELECT id, person, begatby, LEVEL
      FROM Generations
      START WITH begatby= null
      CONNECT BY PRIOR begatby = id
      ORDER SIBLINGS BY begatby;

select id, person, begatby, LEVEL
	from Generations
	Where level = 16
	Connect by Prior id = begatby;


select id, person, begatby, level
	From Generations
	where person='Aaron'
	connect by Prior id = begatby;



create table Professors(
ProfessorId Integer Primary Key,
FirstName varchar(32),
LastName varchar(32)
);


insert into Professors values (341,'Marcus','Aurelius');
insert into Professors values (784,'John','Locke');
insert into Professors values (986,'George','Berkeley');
insert into Professors values (334,'Thomas','Aquinas');
insert into Professors values (653,'Michel','Foucault');

SELECT ProfessorId, LastName,
 (CASE 
 WHEN LastName = 'Aurelius' THEN 'Cool'
 WHEN LastName = 'Locke' THEN 'Empirical'
 WHEN LastName = 'Berkeley' THEN 'Skeptical'
 WHEN LastName = 'Aquinas' THEN 'Objective'
 END) As Status
FROM Professors;



c)	SELECT ProfessorId, LastName,
 (CASE 
 WHEN LastName = 'Aurelius' THEN 'Cool'
 WHEN LastName = 'Locke' THEN 'Empirical'
 WHEN LastName = 'Berkeley' THEN 'Skeptical'
 WHEN LastName = 'Aquinas' THEN 'Objective'
 ELSE 'Obscure'
 END) As Status
FROM Professors;

b)	SELECT ProfessorId, LastName,
 (CASE 
 WHEN LastName = 'Aurelius' THEN 'Cool'
 WHEN LastName = 'Locke' THEN 'Empirical'
 WHEN LastName = 'Aquinas' THEN 'Objective'
 ELSE 'Obscure'
 END) As Status
FROM Professors;
