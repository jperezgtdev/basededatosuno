DELETE FROM TMP_JSON_TABLE;

INSERT INTO  TMP_JSON_TABLE(IDCLIENTE, JSONDATA) VALUES (1, '{
  "nombre": "Juan P�rez",
  "edad": 30,
  "puesto": "Desarrollador de Software",
  "departamento": "Tecnolog�a de la Informaci�n",
  "salario": 60000.00,
  "fecha_contratacion": "2021-01-15"
}');

INSERT INTO TMP_JSON_TABLE (IDCLIENTE, JSONDATA) VALUES (
    3,
    '{
  "nombre": "Juan P�rez",
  "edad": 30,
  "puesto": "Desarrollador de Software",
  "departamento": "Tecnolog�a de la Informaci�n",
  "salario": 60000.00,
  "fecha_contratacion": "2021-01-15",
  "direccion": {
    "calle": "Calle Principal 123",
    "ciudad": "Ciudad de Ejemplo",
    "codigo_postal": "12345",
    "pais": "EjemploLand"
  },
  "contacto": {
    "telefono": "123-456-7890",
    "email": "juan.perez@example.com"
  }
}'
);

SELECT IDCLIENTE, TRIM(JSONDATA) FROM TMP_JSON_TABLE;

select 
json_value(jsonData, '$.nombre') nombre,
json_value(jsonData, '$.puesto') puesto,
json_value(jsonData, '$.salario') salario
from TMP_JSON_TABLE where idcliente = 3;

SELECT 
json_value(jsondata, '$.ability.name') name
, json_value(jsondata, '$.ability.url') url
from TMP_JSON_TABLE where idcliente = 2;

-------------------------------
--Clase 22102023
-------------------------------
/*
Uso de variables en pl/sql
*/

DECLARE
    V_CLIENTE NUMBER;
BEGIN
    V_CLIENTE := 3;

    FOR DATOS IN (select 
        json_value(jsonData, '$.nombre') nombre,
        json_value(jsonData, '$.puesto') puesto,
        json_value(jsonData, '$.salario') salario
        from TMP_JSON_TABLE where idcliente =  V_CLIENTE) LOOP
        DBMS_OUTPUT.PUT_LINE('NAME: '|| DATOS.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('URL: '|| DATOS.PUESTO);
    END LOOP;

END;

-----------------------
--Otro cambio
-----------------------


