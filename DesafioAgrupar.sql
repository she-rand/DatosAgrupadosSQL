CREATE TABLE INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

--Total de registros
SELECT COUNT(*) FROM inscritos;

--Total de inscritos
SELECT SUM(cantidad) as TotalInscritos from inscritos;

--Registros más antiguos
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) from inscritos);

-- Cantidad de inscritos por día
SELECT fecha, SUM(cantidad) AS InscritosPorFecha FROM inscritos GROUP BY fecha;

--Cantidad de inscritos por fuente
SELECT fuente, SUM(cantidad) AS InscritosPorFuente FROM inscritos GROUP BY fuente;

--Día en que se inscribió la mayor cantidad de personas
SELECT  fecha, SUM(cantidad) FROM inscritos GROUP BY fecha ORDER BY SUM(cantidad) DESC LIMIT 1;

--Día en que se inscribiron más personas usando el blog
SELECT fuente,fecha, SUM(cantidad) AS InscritosPorFuente FROM inscritos WHERE fuente='Blog' GROUP BY fuente, fecha ORDER BY SUM(cantidad)  DESC LIMIT 1 ;

--Promedio de personas inscritas por día
SELECT  fecha, AVG(cantidad) FROM inscritos GROUP BY fecha ORDER BY fecha;

--El día en que se inscribieron más de 50 personas
SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha HAVING SUM(cantidad)>50;

--Promedio por día desde el tercer  día
SELECT  fecha, AVG(cantidad) FROM inscritos WHERE fecha NOT IN ((SELECT  fecha, SUM(cantidad) FROM inscritos GROUP BY fecha ORDER BY fecha LIMIT 2
)) GROUP BY fecha ORDER BY fecha;

SELECT  fecha, SUM(cantidad) FROM inscritos GROUP BY fecha ORDER BY fecha LIMIT 2;

