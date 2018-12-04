/************************************************************************
                        TABLAS
*************************************************************************/

--Borramos las tablas
DROP TABLE FOTOVEHICULOS;
DROP TABLE DESCUENTOS;
DROP TABLE PROPIEDADESVEHICULOS;
DROP TABLE PROPIEDADES;
DROP TABLE TIPOPROPIEDADES;
DROP TABLE VEHICULOS;
DROP TABLE FINANCIACIONES;
DROP TABLE TIPOVEHICULOS;
DROP TABLE Clientes;
DROP TABLE Citas;
DROP TABLE Concesionarios;



--Creaci贸n de tabla Financiacion
CREATE TABLE TIPOVEHICULOS(
    id_tveh number(10) primary key,
    nombre varchar2(40) not null,
    unique (nombre)
);

<<<<<<< HEAD
--Creaci髇 de tabla Financiacion
=======

--Creaci贸n de tabla Financiacion
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
CREATE TABLE FINANCIACIONES(
    id_fin number(10) primary key,
    nombre varchar2(40) not null,
    unique (nombre)
);

--Creaci贸n de tabla Tipo Propiedades
CREATE TABLE TIPOPROPIEDADES(
    id_tpro number(10) primary key,
    nombre varchar2(40) not null,
    unique (nombre)
);

<<<<<<< HEAD
--Creaci髇 Tabla Concesionario
Create table CONCESIONARIOS(
   id_conces number(10) primary key,
   Nombre varchar(40) not null,
   Direccion varchar2(40) not null,
   Telef number(9) not null,
   Email varchar2(50) not null,
   NoCitas number(10) not null, check (NoCitas!=0)
);

--Creaci髇 de tabla Veh韈ulo
=======
--Creaci贸n de tabla Veh铆culo
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
CREATE TABLE VEHICULOS(
    id_veh number(10) primary key,
    matricula varchar2(7) not null,
    fechaAlta date not null,
    nombre varchar(80) not null,
    descripcion varchar(400) not null,
    precio number(10,2) not null,
    disponible number(1) not null,
    UNIQUE (matricula)
);

--Creaci贸n de tabla Propiedades
CREATE TABLE PROPIEDADES(
    id_pro number(10) primary key,
    id_tpro number(10),
    nombre varchar2(40) not null ,
    unique(nombre),
    foreign key (id_tpro) REFERENCES TIPOPROPIEDADES
);

--Creaci贸n de tabla relaci贸n propiedades y veh铆culo
CREATE TABLE PROPIEDADESVEHICULOS(
    id_tpro number(10),
    id_pro number(10),
    id_veh number(10),
    PRIMARY KEY (id_tpro,id_pro,id_veh),
    foreign key (id_veh) REFERENCES TIPOPROPIEDADES,
    foreign key (id_pro) REFERENCES PROPIEDADES,
    foreign key (id_veh) REFERENCES VEHICULOS
);

--Creaci贸n de tabla Descuento
CREATE TABLE DESCUENTOS(
    id_des number(10) primary key,
    id_fin number(10),
    nombre varchar2(40) not null ,
    unique(nombre),
    foreign key (id_fin) REFERENCES FINANCIACIONES
);

--Creaci贸n de tabla Foto Veh铆culo
CREATE TABLE FOTOVEHICULOS(
    id_ft number(12) primary key,
    id_veh number(10),
    posicion number(12),
    unique(id_veh,posicion),
    foreign key(id_veh) references vehiculos
);

<<<<<<< HEAD
--Creaci髇 Tabla de Cliente
Create table Clientes(
=======
--Creaci贸n Tabla de Cliente
Create table Cliente(
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
   id_cli number(10) primary key,
   email varchar2(50) not null,
   dni varchar2(9) not null,
   nombre varchar(40) not null,
   telef number(9) not null,
   movil number(9) not null,
   FechAlta date not null,
   unique(dni, email)
);

--Creaci贸n Tabla Citas
Create table Citas(
   id_cit number(10) primary key,
   Fecha date not null,
   Hora number(2) not null, check ((Hora = 10) or (Hora=12) or (Hora = 16) or (Hora = 18))
);

<<<<<<< HEAD


/************************************************************************
                        SECUENCIAS
*************************************************************************/



--Borramos las secuencias
drop sequence seq_fotoVehiculos;
drop sequence seq_tipovehiculos;
drop sequence seq_finaciaciones;
drop sequence seq_vehiculos;
drop sequence seq_tipopropiedades;
drop sequence seq_propiedades;
drop sequence seq_descuentos;
drop sequence seq_clientes;
drop sequence seq_citas;
drop sequence seq_concesionarios;




--Creamos las secuencias
create sequence seq_fotoVehiculos;
create sequence seq_tipovehiculos;
create sequence seq_finaciaciones;
create sequence seq_vehiculos;
create sequence seq_tipopropiedades;
create sequence seq_propiedades;
create sequence seq_descuentos;
create sequence seq_clientes;
create sequence seq_citas;
create sequence seq_concesionarios;
=======
--Creaci贸n Tabla Concesionario
Create table Concesionario(
   id_conces number(10) primary key,
   Nombre varchar(40) not null,
   Direccion varchar2(40) not null,
   Telef number(9) not null,
   Email varchar2(50) not null,
   NoCitas number(10) not null, check (NoCitas!=0)
);
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413




<<<<<<< HEAD
    --Creaci髇 de Trigger Financiaci髇 (secuencia)
    create or replace trigger SECUENCIA_FINANCIACIONES
=======
    --Creaci贸n de Trigger Financiaci贸n (secuencia)
    create or replace trigger Sec_FI_
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
    before insert on FINANCIACIONES
    for each row
    begin
        :new.id_fin := seq_finaciaciones.nextval;    
    end;
    /
    
<<<<<<< HEAD
    --Creaci髇 de Trigger Tipo Propiedades (secuencia)
    create or replace trigger SECUENCIA_TIPO_PROPIEDADES
=======
    --Creaci贸n de Trigger Tipo Propiedades (secuencia)
    create or replace trigger Sec_TP_
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
    before insert on TIPOPROPIEDADES
    for each row
    begin
        :new.id_tpro := seq_tipopropiedades.nextval;    
    end;
    /
    
<<<<<<< HEAD
    --Creaci髇 de Trigger Propiedades (secuencia)
    create or replace trigger SECUENCIA_PROPIEDADES
=======
    --Creaci贸n de Trigger Propiedades (secuencia)
    create or replace trigger Sec_P_
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
    before insert on PROPIEDADES
    for each row
    begin
        :new.id_pro := seq_propiedades.nextval;
    end;
    / 
    
<<<<<<< HEAD
    --Creaci髇 de Trigger Veh韈ulo (secuencia)
    create or replace trigger SECUENCIA_VEHICULOS
=======
    --Creaci贸n de Trigger Veh铆culo (secuencia)
    create or replace trigger Sec_V_
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
    before insert on VEHICULOS
    for each row
    begin
        :new.id_veh := seq_vehiculos.nextval;   
    end;
    / 
<<<<<<< HEAD
        
        --Creaci髇 de Trigger Veh韈ulo (secuencia)
    create or replace trigger SECUENCIA_FOTOS_VEHICULOS
=======
    
    
        --Creaci贸n de Trigger Veh铆culo (secuencia)
    create or replace trigger Sec_FV_
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
    before insert on FOTOVEHICULOS
    for each row
    begin
        :new.id_ft := seq_fotoVehiculos.nextval;   
    end;
    / 
<<<<<<< HEAD
        
    --Creaci髇 de Trigger Descuento(secuencia)
    create or replace trigger SECUENCIA_DESCUENTOS
=======
    
    
    --Creaci贸n de Trigger Descuento(secuencia)
    create or replace trigger Sec_DE_
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
    before insert on DESCUENTOS
    for each row
    begin
        :new.id_des := seq_descuentos.nextval;    
    end;
    /
    
<<<<<<< HEAD
    --Creaci髇 de Trigger Cliente (secuencia)
    create or replace trigger SECUENCIA_CLIENTES
    before insert on Clientes
=======
    --Creaci贸n de Trigger Cliente (secuencia)
    create or replace trigger Sec_Cl_
    before insert on Cliente
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
    for each row
    begin
    :new.id_cli := seq_clientes.nextval;
    end;
    /
    
<<<<<<< HEAD
    --Creaci髇 de Trigger Citas (secuencia)
    create or replace trigger SECUENCIA_CITAS
=======
    --Creaci贸n de Trigger Citas (secuencia)
    create or replace trigger Sec_Ci_
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
    before insert on Citas
    for each row
    begin
    :new.id_cit := seq_citas.nextval;
    end;
    /
    
<<<<<<< HEAD
    --Creaci髇 de Trigger Concesionario (secuencia)
    create or replace trigger SECUENCIA_CONCESIONARIOS
    before insert on Concesionarios
=======
    --Creaci贸n de Trigger Concesionario (secuencia)
    create or replace trigger Sec_Con_
    before insert on Concesionario
>>>>>>> 039e7268a8eb8aa0bff2e5ed0f177c2f020c7413
    for each row
    begin
    :new.id_conces := seq_concesionarios.nextval;
    end;
    /



/************************************************************************
                        PROCEDURES
*************************************************************************/


    
    --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR 
    create or replace procedure insertar_tipo_propiedades (t_pro in tipopropiedades.nombre%type)is
    begin insert into tipopropiedades(nombre) values (t_pro);
    commit work;
    end insertar_tipo_propiedades;
    /
    
    create or replace procedure actualizar_tipo_propiedades 
    (idt_pro in tipopropiedades.id_tpro%type,t_pro_act in tipopropiedades.nombre%type )is
    begin update TIPOPROPIEDADES set nombre = t_pro_act where id_tpro = idt_pro;
    commit work;
    end actualizar_tipo_propiedades;
    /
    
     create or replace procedure eliminar_tipo_propiedades 
    (idt_pro in tipopropiedades.id_tpro%type)is
    begin delete from TIPOPROPIEDADES where id_tpro = idt_pro;
    commit work;
    end eliminar_tipo_propiedades;
    /



    
    
    
/************************************************************************
                        PRUEBAS
*************************************************************************/

    execute insertar_tipo_propiedades('Puertas');
    execute insertar_tipo_propiedades('Color');
    execute insertar_tipo_propiedades('Combustible');
    execute insertar_tipo_propiedades('Etiqueta Eficiencia');
    execute actualizar_tipo_propiedades(1,'N潞 Puertas');
    --execute eliminar_tipo_propiedades(2);



    insert into vehiculoS(matricula,fechaAlta,nombre,descripcion,precio,disponible) values ('0178ZQJ',TO_DATE(SYSDATE),'COCHE C3 BLANCO SEGUNDA MANO','ESTO ES UNA PRUEBA',8500,1);
    insert into vehiculoS(matricula,fechaAlta,nombre,descripcion,precio,disponible) values ('0179ZQJ',TO_DATE(SYSDATE),'COCHE C3 NEGRO SEGUNDA MANO','ESTO ES UNA PRUEBA',8000,1);
    insert into vehiculoS(matricula,fechaAlta,nombre,descripcion,precio,disponible) values ('0171ZQJ',TO_DATE(SYSDATE),'COCHE C4 NEGRO SEGUNDA MANO','ESTO ES UNA PRUEBA',7400,1);
    insert into vehiculoS(matricula,fechaAlta,nombre,descripcion,precio,disponible) values ('0172ZQJ',TO_DATE(SYSDATE),'COCHE C4 BLANCO SEGUNDA MANO','ESTO ES UNA PRUEBA',9400,1);
    insert into vehiculoS(matricula,fechaAlta,nombre,descripcion,precio,disponible) values ('0173ZQJ',TO_DATE(SYSDATE),'COCHE C5 NEGRO SEGUNDA MANO','ESTO ES UNA PRUEBA',9800,1);
    insert into vehiculoS(matricula,fechaAlta,nombre,descripcion,precio,disponible) values ('0174ZQJ',TO_DATE(SYSDATE),'COCHE C5 BLANCO SEGUNDA MANO','ESTO ES UNA PRUEBA',12000,1);
    insert into propiedades(id_tpro,nombre) values (2,'Negro');
    insert into propiedades(id_tpro,nombre) values (2,'Blanco');
    insert into propiedades(id_tpro,nombre) values (1,'3 Puertas');
    insert into propiedades(id_tpro,nombre) values (1,'4 Puertas');
    insert into propiedades(id_tpro,nombre) values (1,'5 Puertas');
    insert into propiedades(id_tpro,nombre) values (3,'Gasolina');
    insert into propiedades(id_tpro,nombre) values (3,'Diesel');
    insert into propiedades(id_tpro,nombre) values (3,'H铆brido');
    insert into propiedades(id_tpro,nombre) values (3,'El茅ctrico');
    insert into propiedades(id_tpro,nombre) values (4,'0 Emisiones');
    insert into propiedades(id_tpro,nombre) values (4,'Eco');
    insert into propiedades(id_tpro,nombre) values (4,'C');
    insert into propiedades(id_tpro,nombre) values (4,'B');
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (2,2,1);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (1,3,1);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (3,6,1);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (4,12,1);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (2,1,2);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (1,3,2);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (3,9,2);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (4,10,2);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (2,1,3);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (1,4,3);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (3,6,3);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (2,2,4);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (1,4,4);
    insert into propiedadesvehiculos(id_tpro,id_pro,id_veh) values (3,6,4);
    insert into Clientes (email,dni,nombre,telef,movil,FechAlta) 
    values ('prueba@prueba.com','66606660w','Juan',666666666,999999999,TO_DATE('12/12/2012'));
    insert into Clientes (email,dni,nombre,telef,movil,FechAlta) 
    values ('prueba2@prueba2.com','66606660T','Juon',666606666,999909999,TO_DATE('12/2/2012'));
    insert into Citas (Fecha, Hora) values (TO_DATE('12/12/2020'),13);
    insert into Citas (Fecha, Hora) values (TO_DATE('12/12/2020'),13);
    insert into Concesionarios (Nombre, Direccion, Telef, Email, NoCitas) 
    values ('Con','calle',756493498,'prueba@prueba.com',10);
    insert into Concesionarios (Nombre, Direccion, Telef, Email, NoCitas) 
    values ('Con2','calle2',756493499,'prueba2@prueba2',11);
    
   
   
   
   
    SELECT tp.nombre, p.nombre 
FROM propiedadesvehiculos PT, tipopropiedades TP, propiedades P 
WHERE pt.id_pro=p.id_pro AND pt.id_tpro=tp.id_tpro and pt.id_veh=1;

SELECT tp.nombre, p.nombre 
FROM propiedadesvehiculos PT, tipopropiedades TP, propiedades P 
WHERE pt.id_pro=p.id_pro AND pt.id_tpro=tp.id_tpro and pt.id_veh=2;

SELECT tp.nombre, p.nombre 
FROM propiedadesvehiculos PT, tipopropiedades TP, propiedades P 
WHERE pt.id_pro=p.id_pro AND pt.id_tpro=tp.id_tpro and pt.id_veh=3;

SELECT tp.nombre, p.nombre 
FROM propiedadesvehiculos PT, tipopropiedades TP, propiedades P 
WHERE pt.id_pro=p.id_pro AND pt.id_tpro=tp.id_tpro and pt.id_veh=4;



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
contrase帽a varchar(24) not null,
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
INSERT INTO Empleado(nombre, rol, usuario, contrase帽a, dni)
VALUES('Rosa M谩rquez', 'Jefa de Marketing','rosmar','1904rm','48592056B');

INSERT INTO Empleado(nombre, rol, usuario, contrase帽a, dni)
VALUES('Manuel Mar铆n', 'Administrativo','manumr','manu100385','32096400Y');

INSERT INTO Empleado(nombre, rol, usuario, contrase帽a, dni)
VALUES('Mar铆a Mart铆nez', 'Jefa de Ventas','marimar','mmz18890','01724748R');

--INSERCION DE DATOS EN TABLA CONCESIONARIO
INSERT INTO Concesionario (Nombre, Direccion, Telefono, Email, NumCitas)
VALUES('Viuda de Terry', 'Calle 脕lava',967345678,'pruebacon@gmail.com',10 );
