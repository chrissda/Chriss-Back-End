-- Crear una base de datos de una empresa que gestiona plataforma de aprendizaje en linea
CREATE DATABASE aprendizaje_en_linea;

-- Tablas
-- categoria ( id AI PK, nombre no nulo y TEXT)
CREATE TABLE categoria(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre_categoria TEXT NOT NULL
);

-- Cursos (id AI PK, nombre TEXT no puede ser nulo, categoria INT)
CREATE TABLE cursos(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre_curso TEXT NOT NULL,
    categoria_curso INT NOT NULL
    -- CONSTRAINT fk_categoria FOREIGN KEY(categoria_id) REFERENCES categoria(id)
);

INSERT INTO cursos (id, nombre_curso, categoria_curso) VALUES
(default, 'matematica', 1),
(default, 'algebra', 1),
(default, 'calculo', 1),
(default, 'hardware', 2),
(default, 'computacion', 2),
(default, 'java script', 3),
(default, 'CSS', 3),
(default, 'ingles', 4);

-- estudiantes (id AI PK, nombre TEXT no nulo, correo unico text no nulo)
CREATE TABLE estudiantes(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre_estudiante TEXT NOT NULL,
    correo_estudiante TEXT NOT NULL UNIQUE
);

INSERT INTO estudiantes (id, nombre_estudiante, correo_estudiante) VALUES
(default, 'Turles Sonne', 't.sonne@outlook.com'),
(default, 'Hashirama Senju', 'hashirama.senju@hotmail.com'),
(default, 'Leon.S Kenneddy', 'leonychriss@outlook.com'),
(default, 'Bryan OConner', 'elbryan56@gmail.com'),
(default, 'Void Spirit', 'voidgaga@gmail.com'),
(default, 'Nagato Pain', 'nagatoro666@hotmail.com'),
(default, 'Buzz Lightyear', 'heybuzztwo@outlook.com');

-- inscripciones ( id AI PK, curso_id INT No nulo, estudiante_id INT no nulo, fecha_inscripcion timestamp)
CREATE TABLE inscripciones(
    id SERIAL NOT NULL PRIMARY KEY,
    curso_id INT NOT NULL,
    CONSTRAINT fk_curso FOREIGN KEY(curso_id) REFERENCES cursos(id),
    estudiante_id INT NOT NULL,
    CONSTRAINT fk_estudiantes FOREIGN KEY(estudiante_id) REFERENCES estudiantes(id),
    fecha_inscripcion TIMESTAMP DEFAULT NOW()
);

INSERT INTO inscripciones (id, curso_id, estudiante_id, fecha_inscripcion) VALUES
(default, 4, 5, '2024-07-02'),
(default, 3, 6, '2024-07-25'),
(default, 5, 7, '2024-07-20'),
(default, 1, 4, '2024-07-06'),
(default, 4, 7, '2024-07-05'),
(default, 3, 5, '2024-07-09'),
(default, 4, 2, '2024-07-05'),
(default, 6, 3, '2024-07-17');


-- evaluaciones (id AI PK, una relacion con la tabla de inscripciones en la cual una inscripcion tiene varias evaluaciones y una evaluacion pertenece a una incripcion, nota float, fecha_evaluacion timestamp)
CREATE TABLE evaluaciones(
    id SERIAL NOT NULL PRIMARY KEY,
    inscripciones_id INT NOT NULL,
    CONSTRAINT fk_inscripciones FOREIGN KEY(inscripciones_id) REFERENCES inscripciones(id),
    nota FLOAT,
    fecha_evaluacion TIMESTAMP DEFAULT NOW()
);

INSERT INTO evaluaciones (id, inscripciones_id, nota, fecha_evaluacion) VALUES
(default, 6, 18, '2024-08-15'),
(default, 3, 10, '2024-08-16'),
(default, 5, 17, '2024-08-17'),
(default, 8, 16, '2024-08-18'),
(default, 1, 14, '2024-08-19'),
(default, 3, 20, '2024-08-20'),
(default, 4, 19, '2024-08-05'),
(default, 6, 13, '2024-08-02');

-- Devolver todos los estudiantes y los cursos que estan inscritos
SELECT nombre_estudiante, nombre_curso FROM estudiantes INNER JOIN inscripciones
ON estudiantes.id = inscripciones.estudiante_id
INNER JOIN cursos
ON cursos.id = inscripciones.curso_id
ORDER BY nombre_estudiante;

-- Mostrar todos los cursos y los estudiantes que estan inscritos en ellos(tener en cuenta que puede haber cursos sin estudiantes)
SELECT nombre_curso, nombre_estudiante FROM cursos INNER JOIN inscripciones
ON cursos.id = inscripciones.curso_id
INNER JOIN estudiantes
ON estudiantes.id = inscripciones.estudiante_id
ORDER BY nombre_curso;

-- Obtener el promedio de notas por curso
SELECT nombre_curso, AVG(nota) AS promedio_curso FROM cursos INNER JOIN inscripciones
ON cursos.id = inscripciones.curso_id
INNER JOIN evaluaciones
ON evaluaciones.id = inscripciones.curso_id
GROUP BY nombre_curso ORDER BY nombre_curso;

-- Listar los estudiantes con su nombre y su promedio de notas (GROUP BY)
SELECT nombre_estudiante, AVG(nota) AS promedio_de_notas FROM estudiantes INNER JOIN inscripciones
ON estudiantes.id = inscripciones.estudiante_id
INNER JOIN evaluaciones
ON evaluaciones.id = inscripciones.estudiante_id
GROUP BY nombre_estudiante ORDER BY nombre_estudiante;