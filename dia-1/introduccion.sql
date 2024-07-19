-- Esta es la forma de escribir comentarios en la base de datos
-- DDL(Data definition language) Crear una nueva base de datos en el servidor
CREATE DATABASE pruebas;

-- Se recomienda que el nombre se pluralizado porque se guardaran varios registros de esa tabla
CREATE TABLE alumnos(
  -- nombre_de_la_columna tipo_de_dato
  -- constraint columns: PRIMARY KEY | NOT NULL | UNIQUE | FOREIGN KEY | DEFAULT... | REFERENCES
  id SERIAL NOT NULL PRIMARY KEY,
  nombre TEXT NOT NULL,
  apellidos TEXT NULL, -- SU VALOR POR DEFECTO DE UNA COLUMNA ES NULL
  correo TEXT NOT NULL UNIQUE, -- El correo va a ser unico y no repetible
  matriculado BOOLEAN DEFAULT true, -- Indicamos un valor por defecto en el caso no se ingrese
  fecha_nacimiento DATE NULL -- En la ultima columna no se coloca la coma ya que no hay otra columna
);

-- DML(Data Manipulation Language) Todo lo relacionado a como se puede manejar los datos en la DB

INSERT INTO alumnos(id, nombre, apellidos, correo, matriculado, fecha_nacimiento) VALUES
                    (default, 'Eduardo', 'de Rivero', 'gaaaaa322@gmail.com', true, '1992-08-1');

INSERT INTO "alumnos" (nombre, "apellidos", correo, "matriculado", fecha_nacimiento) VALUES
                      ('Segundo', 'Alvarez', 'salvarez@gmail.com', true, '1995-09-18'),
                      ('Renzo', 'Soles Contreras', 'rsoles@hotmail.com', false, '2000-02-14'),
                      ('Abel', 'Guevara', 'aguevara@yahoo.es', true, '1989-10-08'),
                      ('Rodrigo','Trujillo Mirano', 'rtrujillo@gmail.com', false, '1998-05-19'),
                      ('Ignacion', 'Estremadoyro Lam', 'iestremadoyro@hotmail.com', true, '1990-06-17');

-- Su en un update no ponemos la condicional, esta mnodificacion se hara a TODOS los registos
-- Actualizamos todos los alumnos su fecha_nacimiento al 1996-06-17 DONDE nombre se Abel y el apellidos sea Guevara
-- Para actualizar mas de una columna se utiliza la coma, el AND u OR SOLO va en condicionales(WHERE)
UPDATE "alumnos" SET "fecha_nacimiento" = '1995-06-17', matriculado = false
WHERE nombre = 'Abel' AND apellidos = 'Guevara';

-- Elimina de manera permanente los registros en la base de datos
DELETE FROM "alumnos" WHERE nombre = 'Shrek';

-- Si quieremos hacer una serie de pasos (o un paso) que se puedan revertir debemos utilizar una transaccion
BEGIN; -- Empezamos la transaccion
DELETE FROM "alumnos" WHERE nombre = "Eduardo";
-- O bien se usa rollback o bien se usa commit
ROLLBACK; -- Se queremos cancelar todos los cambis en la transaccion
COMMIT; -- Se guardaran los cambios de manera permanente y ahora si de manera irreversible en la DB

BEGIN;
DELETE FROM alumnos WHERE nombre = 'Eduardo';
SAVEPOINT punto_de_guardado; -- Agrego un punto de guardado en el caso quisiera retroceder hasta este momento
UPDATE alumnos SET nombre = 'Roxana' WHERE nombre = 'Ignacion'; -- Modificacion del nombre de un alumno
ROLLBACK TO punto_de_guardado; -- No! No era ese nombre y no quiero guardar los cambios, entonces retrocedo hasta el punto de guardado
UPDATE alumnos SET nombre ='Ignacio' WHERE nombre = 'Ignacion'; -- Realizo la modificacion correcta del nombre del alumno
COMMIT; -- Escritura permanente de los cambios en la base de datos


-- SELECT
-- Visualizar la informacion que esta almacenada en la DB
SELECT id, nombre FROM alumnos;

SELECT * FROM alumnos;

-- Agregar filtros
SELECT * FROM alumnos WHERE nombre = 'Abel';

SELECT * FROM alumnos WHERE nombre = 'Abel' AND matriculado = true;

-- Devolver los nombres y fecha_nacimiento de los alumnos que se llamen Abel o Renzo y que no esten matriculados

SELECT nombre, fecha_nacimiento From alumnos WHERE (nombre = 'Abel' OR nombre = 'Renzo') AND  matriculado = false;

UPDATE alumnos SET matriculado = true WHERE nombre = 'Renzo';

-- Buscar por una similitud
SELECT * FROM alumnos WHERE nombre like '%a%';
SELECT * FROM alumnos WHERE nombre ilike '%a%';

-- Si queremos buscar un caracter en una determinada posicion
SELECT * FROM alumnos WHERE nombre ilike '____a%';

-- Condicionales tambien se puede buscar con menor que, menor o igual que, mayor que, o mayor o igual que
SELECT * FROM  alumnos WHERE id >= 3;

-- Devolver todos los alumnos cuyo nombre tenga la letra 'o' o la letra 'a' y que su fecha de nacimiento sea mayor al 1995-01-01
SELECT * FROM alumnos WHERE (nombre ilike '%o%' OR nombre ilike '%a%') AND fecha_nacimiento > '1995-01-01';

-- Buscar alumnos por el 'Abel'o 'Ignacio' o 'Rodrigo'
SELECT * FROM alumnos WHERE nombre IN('Abel', 'Ignacion', 'Rodrigo');

-- Ordenamiento
SELECT * FROM alumnos ORDER BY nombre ASC;
SELECT * FROM alumnos ORDER BY nombre DESC, apellidos ASC;

-- Paginacion
-- LIMIT > Cuantos queremos
-- OFFSET > Cuantos debe omitir
SELECT * FROM alumnos LIMIT 2 OFFSET 0;


