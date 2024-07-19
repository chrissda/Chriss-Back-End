-- Crear base de datos llamada finanzas
CREATE DATABASE finanzas;

-- Crear una tabla en la cual registremos la informacion de los calicentres de la siguiente manera
-- id autoincrementable primary key
-- nombre texto no puede ser nulo
-- correo unico(no se repita) no puede ser nulo
-- status texto no puede ser nulo
-- activo booleano por defecto sea verdadero
-- fecha_creacion date

CREATE TYPE enum_status AS ENUM ('TIPO_A', 'TIPO_B', 'TIPO_C');

CREATE TABLE clientes (
  id SERIAL NOT NULL PRIMARY KEY,
  nombre TEXT NOT NULL,
  correo TEXT NOT NULL UNIQUE,
  status enum_status NOT NULL DEFAULT 'TIPO_A',
  activo BOOLEAN DEFAULT true,
  fecha_creacion TIMESTAMP DEFAULT NOW() -- Asi se captura la hora actual del servidor al momento de hacer un insert
);


-- Insertar los siguientes registros
INSERT INTO clientes (nombre, correo, status, activo) VALUES
('Rodrigo Juarez Quispe', 'rjuarez@gmail.com', 'TIPO_A', true),
('Mariana Sanchez Gil', 'msanchez@hotmail.com', 'TIPO_B', true),
('Juliana Taco Martinez', 'jtaco@gmail.com', 'TIPO_A', true),
('Gabriel Gonza Perez', 'ggonza@yahoo.com', 'TIPO_C', false);

-- FUNCIONES DE AGREGACION
-- promedio > avg()
-- minimo > min()
-- maximo > max(COLUMNA_NUMERICA)
-- contar > count(COLUMNA O REGISTRO CUALQUIERA)
-- Si usamos a parte de la funcio nde agregacion otra columna, entonces nos vemos en la obligacion de utilizar el GROUP BY (Agrupamiento)

SELECT COUNT(id), correo FROM clientes GROUP BY correo;

-- Cuentos usuarios estan activos o no
SELECT COUNT(status), activo FROM clientes GROUP BY activo;

-- Cuantos clientes son del TIPO_A o TIPO_B

SELECT COUNT(*) status 
FROM clientes 
WHERE status IN ('TIPO_A', 'TIPO_B')
GROUP BY status 
ORDER BY COUNT(*) ASC;
-- En el order by se puede poner el nombre dfe la columna o el numero de la columna, es decir, si queremos la primera columna
ORDER BY 1 ASC;

-- id autoincrementable primary key
-- numero_cuenta texto not null unico,
-- tipo_moneda SOLES | DOLARES | EUROS no nulo
-- fecha_creacion timestamp valor actual del servidor no nulo
-- mantenimiento float puede ser nulo

CREATE TYPE enum_status1 AS ENUM ('SOLES', 'DOLARES', 'EUROS');

CREATE TABLE cuentas(
  id SERIAL NOT NULL PRIMARY KEY,
  numero_cuenta TEXT NOT NULL UNIQUE,
  tipo_moneda enum_status1 NOT NULL,
  fecha_creacion TIMESTAMP DEFAULT NOW(),
  mantenimiento FLOAT NULL,
  cliente_id INT NOT NULL,
  -- CREO LA RELACION ENTRE CUENTAS Y CLIENTES
  CONSTRAINT fk_clientes FOREIGN KEY(cliente_id) REFERENCES clientes(id)
);