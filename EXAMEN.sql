--1. Create a tablespace with name 'quiz3' and two datafiles. Each datafile of 50Mb.

CREATE TABLESPACE EXAMEN
DATAFILE 'prueba.txt' SIZE 50M,
'prueba1.txt' SIZE 50M
EXTENT MANAGEMENT LOCAL AUTOALLOCATE;

--2. Create a profile with 5 attempts to lock the password, the name of the profile should be 'estudiante_quiz'
CREATE PROFILE estudiante_quiz LIMIT
FAILED_LOGIN_ATTEMPTS 5;

--3. Create an user named "carlos_1" with password "carlos_1". 
CREATE USER carlos_1
IDENTIFIED BY carlos_1
DEFAULT TABLESPACE EXAMEN
QUOTA UNLIMITED ON EXAMEN
PROFILE estudiante_quiz;

  -- The user should be able to connect
	-- The user should has the profile "estudiante_quiz"
	-- The user should be associated to the tablespace "quiz3"
	-- The user should be able to create tables WITHOUT USING THE DBA ROLE. 
CREATE ROLE desarrollador;
GRANT CONNECT TO desarrollador;
GRANT desarrollador TO carlos_1;
GRANT CREATE TABLE TO desarrollador;

--Create an user named "user2" with password "user2"

CREATE USER user2
IDENTIFIED BY user2
DEFAULT TABLESPACE EXAMEN
QUOTA UNLIMITED ON EXAMEN
PROFILE estudiante_quiz;

--PART II

--1. With the carlos_1 create the next table (DON'T CHANGE THE NAME OF THE TABLE NOR COLUMNS: 

create table icfes (
	tipo_documento 	varchar2(255),
	nacionalidad		varchar2(255),
	genero					varchar2(255),
	fecha_nacimiento	date,
	periodo					varchar2(255),
	consecutivo			varchar2(255),
	departamento_residencia	varchar2(255),
	codigo_departamento_residencia	integer,
	municipio_residencia		varchar2(255),
	codigo_municipio_residencia	varchar2(255),
	estrato					varchar2(255),
	educacion_padre	varchar2(255),
	educacion_madre	varchar2(255),
	tiene_internet	varchar2(255),
	tiene_tv				varchar2(255),
	tiene_lavadora	varchar2(255),
	tiene_horno_micro_o_gas	varchar2(255),
	tiene_automovil	varchar2(255),
	tiene_motocicleta	varchar2(255),
	tiene_consola_videojuegos	varchar2(255),
	colegio_codigo_icfes	varchar2(255),
	colegio_codigo_dane		varchar2(255),
	colegio_nombre				varchar2(255),
	puntaje_lectura_critica	integer,
	puntaje_matematicas		integer,
	puntaje_ciencias_naturales	integer,
	puntaje_sociales			integer,
	puntaje_ingles				integer,
	desempeno_ingles			varchar2(255),
	puntaje_global				integer
);

--1. SHOW THE GENRE, DATE OF BIRTH, SEQUENCE (CONSECUTIVO), MUNICIPIO, GLOBAL SCORE (PUNTAJE GLOBAL) WITH THE HIGHEST GLOBAL SCORE (ONE QUERY)
SELECT ESTU_GENERO, ESTU_FECHANACIMIENTO ,ESTU_consecutivo, ESTU_DEPTO_RESIDE, PUNT_GLOBAL
FROM ICFES
ORDER BY PUNT_GLOBAL DESC;



--SHOW THE GENRE, DATE OF BIRTH, SEQUENCE (CONSECUTIVO), MUNICIPIO, GLOBAL SCORE (PUNTAJE GLOBAL) OF THE STUDENTS WHICH HAVE A C IN DESEMPEÑO OF ENGLISH
SELECT ESTU_GENERO, ESTU_FECHANACIMIENTO ,ESTU_consecutivo, ESTU_DEPTO_RESIDE, PUNT_GLOBAL
FROM ICFES
WHERE DESEMP_INGLES LIKE 'C';

--3. COUNT THE NUMBER COLEGIO_NOMBRE WITHOUT REPETITION (UNIQUE VALUES) OF THE STUDENTS

SELECT DISTINCT COLE_NOMBRE_ESTABLECIMIENTO, COUNT(COLE_NOMBRE_ESTABLECIMIENTO)
FROM ICFES
GROUP BY COLE_NOMBRE_ESTABLECIMIENTO;

--4. COUNT THE NUMBER OF STUDENTS WHICH ARE LOCATED IN MONTERÍA

SELECT ESTU_MCPIO_RESIDE,COUNT(ESTU_MCPIO_RESIDE)
FROM ICFES
WHERE ESTU_MCPIO_RESIDE LIKE 'MONTERIA'
GROUP BY ESTU_MCPIO_RESIDE;


