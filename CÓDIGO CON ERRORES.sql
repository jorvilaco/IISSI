
--"EMPLEADOS" 

--Borrado de tablas
DROP TABLE Empleado;
DROP TABLE Concesionario;

--Borrado de secuencias
DROP SEQUENCE SEQ_Empleado;
DROP SEQUENCE SEQ_Concesionario;
CREATE SEQUENCE SEQ_Empleado;
CREATE SEQUENCE SEQ_Concesionario;

--TABLA EMPLEADO
CREATE TABLE Empleado(
id_empleado number(50) primary key,
nombre varchar(50) not null,
rol varchar (50) not null,
usuario varchar (10)not null,
contraseña varchar(24) not null,
dni varchar2 (9) not null,
UNIQUE (usuario)
);

--TABLA CONCESIONARIO
CREATE TABLE Concesionario(
id_concesionario number(50) primary key,
nombre varchar(50) not null,
direccion varchar2 (50) not null,
telefono number (9)not null,
email varchar2(50) not null,
numCitas number (50) not null 
check(numCitas!=0)
);

--CREACION DE TRIGGER EMPLEADO
CREATE OR REPLACE TRIGGER SEQ_E BEFORE INSERT ON Empleado FOR EACH ROW BEGIN :NEW.id_empleado := SEQ_Empleado.NEXTVAL;
END;
/

--CREACION DE TRIGGER CONCESIONARIO
CREATE OR REPLACE TRIGGER SEQ_C BEFORE INSERT ON Concesionario FOR EACH ROW BEGIN :NEW.id_concesionario := SEQ_Concesionario.NEXTVAL;
END;
/

--INSERCION DE DATOS EN TABLA EMPLEADO
INSERT INTO Empleado(nombre, rol, usuario, contraseña, dni)
VALUES('Rosa Márquez', 'Jefa de Marketing','rosmar','1904rm','48592056B');

INSERT INTO Empleado(nombre, rol, usuario, contraseña, dni)
VALUES('Manuel Marín', 'Administrativo','manumr','manu100385','32096400Y');

INSERT INTO Empleado(nombre, rol, usuario, contraseña, dni)
VALUES('María Martínez', 'Jefa de Ventas','marimar','mmz18890','01724748R');

--INSERCION DE DATOS EN TABLA CONCESIONARIO
INSERT INTO Concesionario (Nombre, Direccion, Telefono, Email, NumCitas)
VALUES('Viuda de Terry', 'Calle �?lava',967345678,'pruebacon@gmail.com',10 );
