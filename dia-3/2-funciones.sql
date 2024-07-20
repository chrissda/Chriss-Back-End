CREATE TABLE demostracion_triggers (
  id SERIAL PRIMARY KEY NOT NULL,
  contador INT
);

-- Se puede instalar extensiones
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Funcion
CREATE OR REPLACE FUNCTION insertar_clientes_con_cuenta(nombre_cliente TEXT, 
      correo_cliente TEXT, 
      status_cliente enum_status, 
      activo_cliente BOOLEAN,
      tipo_moneda enum_status1
      )
RETURNS VOID AS $$
-- JUSTO ANTES DE EMPEZAR LA FUNCION DECLARO LAS VARIABLES A UTLIZAR EN LA FUNCION
DECLARE
  nuevo_cliente_id INT;
-- Inicia la ejecuacion de la funcion
BEGIN 
  -- Inicia la transaccion
  BEGIN
    -- RETURNING retorna informacion si es un INSERT, UPDATE o DELETE
    INSERT INTO clientes (nombre, correo, status, activo) VALUES (nombre_cliente, correo_cliente, status_cliente, activo_cliente) 
    RETURNING id INTO nuevo_cliente_id;
  
    INSERT INTO cuentas (numero_cuenta, tipo_moneda, cliente_id) VALUES (uuid_generate_v4(), tipo_moneda, nuevo_cliente_id);
  COMMIT;
  -- SI tuviesemos un error
  EXCEPTION
    -- Para capturar el error se usa la palabra EXCEPTION pero esta debe estar vinculada a una especie de CASE-SWITCH
    WHEN OTHERS THEN -- No nos fijamos en el eorror que esta sucedencia osea solo basta con que tengamos un error
      ROLLBACK;
  END; -- FINALIZA LA TRANSACCION
END; -- FINALIZA LA FUNCION
$$ LANGUAGE plpgsql;

SELECT insertar_clientes_con_cuenta('Shrek', 'shrek@dreamworks.com', 'TIPO_B', true, 'SOLES');


