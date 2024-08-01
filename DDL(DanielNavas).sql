-- 1. Crear una base de datos
CREATE DATABASE taller_volcado;

-- Conectar a la base de datos recién creada
\c taller_volcado;

-- 2. Crear las tablas de país, departamento y municipio
CREATE TABLE pais (
    id SERIAL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_pais PRIMARY KEY (id)
);

CREATE TABLE departamento (
    id SERIAL,
    nombre VARCHAR(100) NOT NULL,
    pais_id INT,
    CONSTRAINT pk_departamento PRIMARY KEY (id),
    CONSTRAINT fk_departamento_pais FOREIGN KEY (pais_id) REFERENCES pais(id)
);

CREATE TABLE municipio (
    id SERIAL,
    codigo INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    departamento_id INT,
    CONSTRAINT pk_municipio PRIMARY KEY (id),
    CONSTRAINT fk_municipio_departamento FOREIGN KEY (departamento_id) REFERENCES departamento(id)
);

-- 4. Crear una tabla llamada localidades
CREATE TABLE localidades (
    codigo_departamento INT,
    nombre_departamento VARCHAR(100),
    codigo_municipio INT,
    nombre_municipio VARCHAR(100)
);
