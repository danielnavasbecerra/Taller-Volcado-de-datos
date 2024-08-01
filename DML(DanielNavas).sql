-- 5. Puble los departamentos y municipios usando como fuente de información la tabla de localidades

-- Importación de datos desde CSV a la tabla localidades 
/*
    \copy localidades (codigo_departamento, nombre_departamento, codigo_municipio, nombre_municipio)
    FROM '/home/camper/Música/PostgreSQL/localidades.csv' DELIMITER ',' CSV HEADER;
*/

-- Insertar pais en la tabla pais
INSERT INTO pais (nombre) VALUES ('Colombia');

-- Insertar departamentos en la tabla departamento
INSERT INTO departamento (nombre, pais_id)
SELECT DISTINCT nombre_departamento, (SELECT id FROM pais WHERE nombre = 'Colombia')
FROM localidades;

-- Insertar municipios en la tabla municipio
INSERT INTO municipio (codigo, nombre, departamento_id)
SELECT DISTINCT l.codigo_municipio, l.nombre_municipio, d.id
FROM localidades l
JOIN departamento d ON l.nombre_departamento = d.nombre
ORDER BY l.codigo_municipio;
