-- Crear una base de datos de una empresa que gestiona plataforma de aprendizaje en linea
CREATE DATABASE aprendizaje_en_linea;

-- Tablas
-- categoria ( id AI PK, nombre no nulo y TEXT)
CREATE TABLE categoria(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre TEXT NOT NULL
);

-- Cursos (id AI PK, nombre TEXT no puede ser nulo, categoria INT)
CREATE TABLE cursos(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre TEXT NOT NULL,
    categoria_id INT NOT NULL,
    CONSTRAINT fk_categoria FOREIGN KEY(categoria_id) REFERENCES categoria(id)
);

-- estudiantes (id AI PK, nombre TEXT no nulo, correo unico text no nulo)
CREATE TABLE estudiantes(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre TEXT NOT NULL,
    correo TEXT NOT NULL UNIQUE
);

INSERT INTO estudiantes (id, nombre, correo) VALUES
('Turles Sonne', 't.sonne@outlook.com'),
('Hashirama Senju', 'hashirama.senju@hotmail.com'),
('Leon.S Kenneddy', 'leonychriss@outlook.com'),
('')

-- incripciones ( id AI PK, curso_id INT No nulo, estudiante_id INT no nulo, fecha_inscripcion timestamp)
CREATE TABLE inscripciones(
    id SERIAL NOT NULL PRIMARY KEY,
    curso_id INT NOT NULL,
    estudiante_id INT NOT NULL,
    fecha_inscripcion TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_curso FOREIGN KEY(curso_id) REFERENCES cursos(id),
    CONSTRAINT fk_estudiantes FOREIGN KEY(estudiante_id) REFERENCES estudiantes(id)
);
-- evaluaciones (id AI PK, una relacion con la tabla de inscripciones en la cual una inscripcion tiene varias evaluacions y una evaluacion pertenece a una incripcion, nota float, fecha_evaluacion timestamp)
CREATE TABLE evaluaciones(
    id SERIAL NOT NULL PRIMARY KEY,
    incripciones_id INT NOT NULL,
    CONSTRAINT fk_inscripciones FOREIGN KEY(incripciones_id) REFERENCES inscripciones(id),
    nota FLOAT,
    fecha_evaluacion TIMESTAMP DEFAULT NOW()
);

-- Devolver todos los estudiantes y los cursos que e4stan inscritos


-- Mostrar todos los cursos y los estudiantes que stan inscritos en ellos(tener en cuenta que puede haber cursos sin estudiantes)

-- Obtener el promedio de nostras por curso

-- Listar los estudiantes con su nombre y su promedio de notas (GROUP BY)
