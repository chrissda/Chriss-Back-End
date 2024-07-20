-- Crear una base de datos de una empresa que gestiona plataforma de aprendizaje en linea
-- Tablas
-- categoria ( id AI PK, nombre no nulo y TEXT)
-- Cursos (id AI PK, nombre TEXT no puede ser nulo, categoria INT)
-- estudiantes (id AI PK, nombre TEXT no nulo, correo unico text no nulo)
-- incripciones ( id AI PK, curso_id INT No nulo, estudiante_id INT no nulo, fecha_inscripcion timestamp)
-- evaluaciones (id AI PK, una relacion con la tabla de inscripciones en la cual una inscripcion tiene varias evaluacions y una evaluacion pertene a una incripcionm nota float, fecha_evaluacion timestamp)

-- Devolver todos los estudiantes y los cursos que e4stan inscritos

-- Mostrar todos los cursos y los estudiantes que stan inscritos en ellos(tener en cuenta que puede haber cursos sin estudiantes)

-- Obtener el promedio de nostras por curso

-- Listar los estudiantes con su nombre y su promedio de notas (GROUP BY)
