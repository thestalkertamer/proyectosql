CREATE SCHEMA INSCRIPCIONES_BECAS ; 
USE INSCRIPCIONES_BECAS ;

# Todo sobre tabla INVESTIGACION -->
CREATE TABLE Investigacion (
id_inv INT PRIMARY KEY AUTO_INCREMENT,
confirmacion INT(1) , 
titulo VARCHAR(50) NOT NULL,
formato VARCHAR(1),
tematica VARCHAR (50) );

ALTER TABLE Investigacion ADD num_pags
INT NOT NULL ; 

ALTER TABLE Investigacion MODIFY COLUMN num_pags INT NOT NULL AFTER tematica ;
ALTER TABLE Investigacion ADD fecha_publicacion DATE NOT NULL ;
ALTER TABLE Investigacion MODIFY COLUMN fecha_publicacion DATE NOT NULL AFTER num_pags ;
ALTER TABLE Investigacion DROP COLUMN biblioteca ;

		#foraneas
ALTER TABLE Investigacion ADD COLUMN id_beca INT ;
ALTER TABLE Investigacion ADD COLUMN autor INT AFTER titulo ;
ALTER TABLE Investigacion ADD FOREIGN KEY (autor) REFERENCES Estudiantes (id_estudiante) ;
ALTER TABLE Investigacion ADD COLUMN id_biblioteca INT ;
ALTER TABLE Investigacion ADD FOREIGN KEY (id_biblioteca) REFERENCES Biblioteca (id_biblioteca) ;
ALTER TABLE Investigacion ADD COLUMN id_pag_web INT ;
ALTER TABLE Investigacion ADD FOREIGN KEY (id_pag_web) REFERENCES Pagina_web (id_pag_web) ;

#Tabla ESTUDIANTES
CREATE TABLE Estudiantes (
id_estudiante INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
edad INT ) ;

		#foreaneas
ALTER TABLE Estudiantes ADD COLUMN investigacion INT ;
ALTER TABLE Estudiantes ADD FOREIGN KEY (investigacion) REFERENCES Investigacion (id_inv) ;
ALTER TABLE EStudiantes ADD COLUMN carrera INT AFTER edad ;
ALTER TABLE Estudiantes ADD FOREIGN KEY (carrera) REFERENCES Carreras (id_carrera) ;
ALTER TABLE Estudiantes ADD COLUMN inscripcion_beca INT ; 
ALTER TABLE Estudiantes ADD FOREIGN KEY (inscripcion_beca) REFERENCES Beca (id_beca) ;

#Tabla BECA
CREATE TABLE Beca (
id_beca INT PRIMARY KEY AUTO_INCREMENT,
institucion VARCHAR (30) NOT NULL,
aporte INT NOT NULL );


ALTER TABLE Beca ADD fecha_beca
DATE NOT NULL ;

#Tabla UNIVERSIDADES
CREATE TABLE Universidades (
id_facultad INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR (35) );

#Tabla CARRERAS
CREATE TABLE Carreras (
id_carrera INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(30) ,
universidad VARCHAR(30) NOT NULL,
anos_carrera INT );

ALTER TABLE Carreras MODIFY COLUMN universidad INT ;
ALTER TABLE Carreras ADD FOREIGN KEY (universidad) REFERENCES Universidades (id_facultad) ;

#Tabla BIBLIOTECA 
CREATE TABLE Biblioteca (
id_biblioteca INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30),
ubicacion VARCHAR (30) ) ;

#Tabla PAGINA WEB
CREATE TABLE Pagina_web (
id_pag_web INT PRIMARY KEY AUTO_INCREMENT,
URL VARCHAR(60),
nombre VARCHAR(35) );