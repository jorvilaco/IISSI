
--"EMPLEADOS" 

--Borrado de tablas
DROP TABLE Empleados;
DROP TABLE Concesionarios;
DROP SEQUENCE SEQ_Empleados;
DROP SEQUENCE SEQ_Concesionarios;
CREATE SEQUENCE SEQ_Empleados;
CREATE SEQUENCE SEQ_Concesionarios;

CREATE TABLE Concesionarios(
   id_conces number(10) primary key,
   Nombre varchar(40) not null,
   Direccion varchar2(40) not null,
   Telef number(9) not null,
   Email varchar2(50) not null,
   NoCitas number(10) not null, check (NoCitas!=0)
);
--TABLA EMPLEADO
CREATE TABLE Empleados(
    id_empleado number(10) primary key,
    nombre varchar2(50) not null,
    rol varchar2 (50) not null,
    usuario varchar2 (10)not null,
    contraseña varchar2(24) not null,
    dni varchar2 (9) not null,
    UNIQUE (usuario)
);



--CREACION DE TRIGGER EMPLEADO
CREATE OR REPLACE TRIGGER SECUENCIA_EMPLEADOS BEFORE INSERT ON Empleados FOR EACH ROW BEGIN :NEW.id_empleado := SEQ_Empleados.NEXTVAL;
END;
/

--CREACION DE TRIGGER CONCESIONARIO
CREATE OR REPLACE TRIGGER SECUENCIA_CONCESIONARIOS BEFORE INSERT ON Concesionarios FOR EACH ROW BEGIN :NEW.id_conces := SEQ_Concesionarios.NEXTVAL;
END;
/

--INSERCION DE DATOS EN TABLA EMPLEADO
INSERT INTO Empleados(nombre, rol, usuario, contraseña, dni)
VALUES('Rosa Márquez', 'Jefa de Marketing','rosmar','1904rm','48592056B');

INSERT INTO Empleados(nombre, rol, usuario, contraseña, dni)
VALUES('Manuel Marín', 'Administrativo','manumr','manu100385','32096400Y');

INSERT INTO Empleados(nombre, rol, usuario, contraseña, dni)
VALUES('María Martínez', 'Jefa de Ventas','marimar','mmz18890','01724748R');

--INSERCION DE DATOS EN TABLA CONCESIONARIO
INSERT INTO Concesionarios (Nombre, Direccion, Telef, Email, NoCitas)
VALUES('Viuda de Terry', 'Calle Álava',967345678,'pruebacon@gmail.com',10 );
