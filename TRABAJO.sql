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
DROP TABLE Citas;
DROP TABLE Clientes;
DROP TABLE Concesionarios;
DROP TABLE VEHICULOSVENDIDOS;




--Creación de tabla TipoVehiculos
CREATE TABLE TIPOVEHICULOS(
    id_tveh number(10) primary key,
    nombre varchar2(40) not null,
    unique (nombre)
);

--Creación de tabla Venta de Vehículo
CREATE TABLE VEHICULOSVENDIDOS(
    id_vhv number(10) primary key,
    matricula varchar2(40) not null,
    fechaAlta date not null,
    fechaVenta date not null,
    unique (matricula)
);

--Creación de tabla Financiacion
CREATE TABLE FINANCIACIONES(
    id_fin number(10) primary key,
    nombre varchar2(40) not null,
    unique (nombre)
);

--Creación de tabla Tipo Propiedades
CREATE TABLE TIPOPROPIEDADES(
    id_tpro number(10) primary key,
    nombre varchar2(40) not null,
    unique (nombre)
);


--Creación Tabla Concesionario
Create table CONCESIONARIOS(
   id_conces number(10) primary key,
   Nombre varchar(40) not null,
   Direccion varchar2(40) not null,
   Telef number(9) not null,
   Email varchar2(50) not null,
   NoCitas number(10) not null, check (NoCitas!=0)
);

--Creación de tabla Vehículo
CREATE TABLE VEHICULOS(
    id_veh number(10) primary key,
    matricula varchar2(7) not null,
    fechaAlta date not null,
    nombre varchar(80) not null,
    descripcion varchar(400) not null,
    precio number(10,2) not null,
    disponible number(1) not null,
    id_conces number(10), 
    id_tveh number(10),
    FOREIGN KEY (id_conces) REFERENCES CONCESIONARIOS, 
    FOREIGN KEY (id_tveh) REFERENCES TIPOVEHICULOS, 
    UNIQUE (matricula)
    
);

--Creación de tabla Propiedades
CREATE TABLE PROPIEDADES(
    id_pro number(10) primary key,
    id_tpro number(10),
    nombre varchar2(40) not null ,
    unique(nombre),
    foreign key (id_tpro) REFERENCES TIPOPROPIEDADES
);

--Creación de tabla relación propiedades y vehículo
CREATE TABLE PROPIEDADESVEHICULOS(
    id_tpro number(10),
    id_pro number(10),
    id_veh number(10),
    PRIMARY KEY (id_tpro,id_pro,id_veh),
    unique(id_tpro,id_veh),
    foreign key (id_veh) REFERENCES TIPOPROPIEDADES,
    foreign key (id_pro) REFERENCES PROPIEDADES,
    foreign key (id_veh) REFERENCES VEHICULOS
);

--Creación de tabla Descuento
CREATE TABLE DESCUENTOS(
    id_des number(10) primary key,
    id_fin number(10)not null,
    descuento number(10,2) not null,
    id_veh number(10)not null,
    unique(id_fin,id_veh),
    foreign key (id_fin) REFERENCES FINANCIACIONES,
    foreign key (id_veh) REFERENCES VEHICULOS
);

--Creación de tabla Foto VehÃ­culo
CREATE TABLE FOTOVEHICULOS(
    id_ft number(12) primary key,
    id_veh number(10),
    posicion number(12),
    unique(id_veh,posicion),
    foreign key(id_veh) references vehiculos
);


--Creación Tabla de Cliente
Create table CLIENTES(
   id_cli number(10) primary key,
   email varchar2(50) not null,
   dni varchar2(9) not null,
   nombre varchar(40) not null,
   telef number(9) not null,
   movil number(9) not null,
   FechAlta date not null,
   unique(dni, email)
);

--Creación Tabla Citas
Create table Citas(
   id_cit number(10) primary key,
   Fecha date not null,
   Hora number(2) not null, check ((Hora = 10) or (Hora=12) or (Hora = 16) or (Hora = 18)),
   id_cli number(10),
   id_conces number(10),
   FOREIGN KEY (id_conces) REFERENCES CONCESIONARIOS,
   FOREIGN KEY (id_cli) REFERENCES CLIENTES
   );





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
drop sequence seq_vehiculosvendidos;




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
create sequence seq_vehiculosvendidos;

    
    --Creación de Trigger Vehículo Vendido (secuencia)
    create or replace trigger SECUENCIA_VEHICULOS_VENDIDOS
    before insert on VEHICULOSVENDIDOS
    for each row
    begin
        :new.id_vhv := seq_vehiculosvendidos.nextval;    
    end;
    /


    --Creación de Trigger Financiación (secuencia)
    create or replace trigger SECUENCIA_FINANCIACIONES
    before insert on FINANCIACIONES
    for each row
    begin
        :new.id_fin := seq_finaciaciones.nextval;    
    end;
    /
    

    --Creación de Trigger Tipo Propiedades (secuencia)
    create or replace trigger SECUENCIA_TIPO_PROPIEDADES
    before insert on TIPOPROPIEDADES
    for each row
    begin
        :new.id_tpro := seq_tipopropiedades.nextval;    
    end;
    /
    

    --Creación de Trigger Propiedades (secuencia)
    create or replace trigger SECUENCIA_PROPIEDADES
    before insert on PROPIEDADES
    for each row
    begin
        :new.id_pro := seq_propiedades.nextval;
    end;
    / 
    

    --Creación de Trigger Vehículo (secuencia)
    create or replace trigger SECUENCIA_VEHICULOS
    before insert on VEHICULOS
    for each row
    begin
        :new.id_veh := seq_vehiculos.nextval;   
    end;
    / 

    --Creación de Trigger TipoVehículo (secuencia)
    create or replace trigger SECUENCIA_TIPO_VEHICULOS
    before insert on TipoVehiculos
    for each row
    begin
        :new.id_tveh := seq_TipoVehiculos.nextval;    
    end;
    /    
        --Creación de Trigger Vehículo (secuencia)
    create or replace trigger SECUENCIA_FOTOS_VEHICULOS
    before insert on FOTOVEHICULOS
    for each row
    begin
        :new.id_ft := seq_fotoVehiculos.nextval;   
    end;
    / 

    --Creación de Trigger Descuento(secuencia)
    create or replace trigger SECUENCIA_DESCUENTOS
    before insert on DESCUENTOS
    for each row
    begin
        :new.id_des := seq_descuentos.nextval;    
    end;
    /
    

    --Creación de Trigger Cliente (secuencia)
    create or replace trigger SECUENCIA_CLIENTES
    before insert on CLIENTES
    for each row
    begin
    :new.id_cli := seq_clientes.nextval;
    end;
    /
    

    --Creación de Trigger Citas (secuencia)
    create or replace trigger SECUENCIA_CITAS
    before insert on CITAS
    for each row
    begin
    :new.id_cit := seq_citas.nextval;
    end;
    /
    

    --Creación de Trigger Concesionario (secuencia)
    create or replace trigger SECUENCIA_CONCESIONARIOS
    before insert on CONCESIONARIOS
    for each row
    begin
    :new.id_conces := seq_concesionarios.nextval;
    end;
    /


/************************************************************************
                        TRIGGER
*************************************************************************/





--TRIGGER PARA AÑADIR VEHICULO VENDIDO AL BORRAR UN VEHICULO
CREATE OR REPLACE TRIGGER VEHICULO_VENDIDO
AFTER DELETE ON VEHICULOS
FOR EACH ROW
BEGIN
insertar_vehiculo_vendido(:old.matricula,:old.fechaalta,SYSDATE);
END;
/


 --TRIGGER PARA AÑADIR VEHICULO VENDIDO AL BORRAR UN VEHICULO
CREATE OR REPLACE TRIGGER PROPIEDADA_TIPOPROPIEDAD
BEFORE INSERT OR UPDATE ON PROPIEDADESVEHICULOS
FOR EACH ROW
DECLARE 
 COD_TPRO INTEGER;
BEGIN

SELECT ID_TPRO INTO COD_TPRO FROM PROPIEDADES WHERE :NEW.ID_PRO=ID_PRO ;
IF (:NEW.ID_TPRO <> COD_TPRO) THEN
    RAISE_APPLICATION_ERROR(-20400,cod_tpro|| ' TIPO DE PROPIEDAD ERRONEA');

END IF;

END;
/


/************************************************************************
                        PROCEDURES
*************************************************************************/


    
    --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR TIPO PROPIEDADES
    create or replace procedure insertar_tipo_propiedades 
    (t_pro in tipopropiedades.nombre%type)is
    begin insert into tipopropiedades(nombre) values (t_pro);
    commit work;
    end insertar_tipo_propiedades;
    /
    
    create or replace procedure actualizar_tipo_propiedades 
    (idt_pro in tipopropiedades.id_tpro%type,
    t_pro_act in tipopropiedades.nombre%type )is
    begin update TIPOPROPIEDADES set nombre = t_pro_act where id_tpro = idt_pro;
    commit work;
    end actualizar_tipo_propiedades;
    /
    
     create or replace procedure eliminar_tipo_propiedades 
    (idt_pro in tipopropiedades.id_tpro%type)is
    begin 
    delete from propiedadesvehiculos where id_tpro = idt_pro;
    delete from propiedades where id_tpro = idt_pro;
    delete from TIPOPROPIEDADES where id_tpro = idt_pro;
    commit work;
    end eliminar_tipo_propiedades;
    /

    
    
    --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR FINACIACION
    create or replace procedure insertar_financiacion 
    (nombre_fin in financiaciones.nombre%type)is
    begin insert into financiaciones(nombre) values (nombre_fin);
    commit work;
    end insertar_financiacion ;
    /
    
    create or replace procedure actualizar_financiacion 
    (cod_fin in financiaciones.id_fin%type, 
    nombre_fin in financiaciones.nombre%type )is
    begin update financiaciones set  nombre = nombre_fin where cod_fin = id_fin;
    commit work;
    end actualizar_financiacion ;
    /
    
     create or replace procedure eliminar_financiacion 
    (cod_fin in financiaciones.id_fin%type)is
    begin 
    delete from descuentos where cod_fin = id_fin;
    delete from financiaciones where cod_fin = id_fin;
    commit work;
    end eliminar_financiacion ;
    /
    
    
    --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR PROPIEDADES
    create or replace procedure insertar_propiedad
    (nombre_pro in propiedades.nombre%type,
    cod_tpro in propiedades.id_tpro%type)is
    begin insert into propiedades(nombre,id_tpro) values (nombre_pro,cod_tpro);
    commit work;
    end insertar_propiedad;
    /
    
    create or replace procedure actualizar_propiedad
    (cod_pro in propiedades.id_pro%type, 
    nombre_pro in propiedades.nombre%type,
    cod_tpro in propiedades.id_tpro%type )is
    begin     
    update propiedades set  nombre = nombre_pro, id_tpro = cod_tpro where cod_pro = id_pro;
    commit work;
    end actualizar_propiedad;
    /
    
     create or replace procedure eliminar_propiedad
    (cod_pro in propiedades.id_pro%type)is
    begin 
    delete from propiedadesvehiculos where cod_pro = id_pro;
    delete from propiedades where cod_pro = id_pro;
    commit work;
    end eliminar_propiedad;
    /
    
    
    --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR VEHICULO
    create or replace procedure insertar_vehiculo
    (matricula_vhe in vehiculos.matricula%type,
    fecha_alta_vhe in vehiculos.fechaalta%type,
    nombre_vhe in vehiculos.nombre%type,
    descripcion_vhe in vehiculos.descripcion%type,
    precio_vhe in vehiculos.precio%type,
    disponible_vhe in vehiculos.disponible%type,
    id_conces_vhe in vehiculos.id_conces%type,
    id_tveh_vhe in vehiculos.id_tveh%type)is
    begin 
    insert into vehiculos(matricula,fechaalta,nombre,descripcion,precio,disponible,id_conces,id_tveh) 
    values (matricula_vhe,fecha_alta_vhe,nombre_vhe,descripcion_vhe,precio_vhe,disponible_vhe,id_conces_vhe,id_tveh_vhe);
    commit work;
    end insertar_vehiculo;
    /
    
    create or replace procedure actualizar_vehiculo
    (cod_vhe in vehiculos.id_veh%type,
    matricula_vhe in vehiculos.matricula%type,
    fecha_alta_vhe in vehiculos.fechaalta%type,
    nombre_vhe in vehiculos.nombre%type,
    descripcion_vhe in vehiculos.descripcion%type,
    precio_vhe in vehiculos.precio%type,
    disponible_vhe in vehiculos.disponible%type,
    id_conces_vhe in vehiculos.id_conces%type,
    id_tveh_vhe in vehiculos.id_tveh%type)is
    begin 
    update vehiculos set  matricula = matricula_vhe, fechaalta=fecha_alta_vhe,nombre=nombre_vhe,descripcion=descripcion_vhe,
    precio=precio_vhe,disponible=disponible_vhe,id_conces=id_conces_vhe,id_tveh=id_tveh_vhe where cod_vhe = id_veh;
    commit work;
    end actualizar_vehiculo;
    /
    
     create or replace procedure eliminar_vehiculos
    (cod_veh in vehiculos.id_veh%type)is
    begin 
    delete from propiedadesvehiculos where cod_veh = id_veh;
    delete from descuentos where cod_veh = id_veh;
    delete from vehiculos where cod_veh = id_veh;
    commit work;
    end eliminar_vehiculos;
    /
    
     --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR PROPIEDADES VEHICULOS
    create or replace procedure insertar_propiedad_vehiculo
    (cod_tpro in propiedadesvehiculos.id_tpro%type,
    cod_pro in propiedadesvehiculos.id_pro%type,
    cod_veh in propiedadesvehiculos.id_veh%type)is
    begin insert into propiedadesvehiculos values (cod_tpro,cod_pro,cod_veh);
    commit work;
    end insertar_propiedad_vehiculo;
    /
    
     create or replace procedure actualizar_propiedad_vehiculo
    (cod_tpro in propiedadesvehiculos.id_tpro%type,
     cod_pro_nuevo in propiedadesvehiculos.id_pro%type,
     cod_veh in propiedadesvehiculos.id_veh%type)is
    begin     
    if (cod_pro_nuevo <> 0)then
    update propiedadesvehiculos set id_pro = cod_pro_nuevo where id_tpro = cod_tpro and id_veh = cod_veh;
    else 
    delete from propiedadesvehiculos where id_tpro = cod_tpro and id_veh = cod_veh;
    end if;
    commit work;
    end actualizar_propiedad_vehiculo;
    /
    
     --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR VEHICULO VENDIDO
    create or replace procedure insertar_vehiculo_vendido
    (matricula_vhv in vehiculosvendidos.matricula%type,
    fecha_alta_vhv in vehiculosvendidos.fechaalta%type,
    fecha_venta_vhv in vehiculosvendidos.fechaventa%type)is
    begin insert into vehiculosvendidos(matricula,fechaalta,fechaventa) values (matricula_vhv,fecha_alta_vhv,fecha_venta_vhv);
    commit work;
    end insertar_vehiculo_vendido;
    /

/************************************************************************
                       FUNCIONES
*************************************************************************/


CREATE OR REPLACE FUNCTION ASSERT_EQUALS (salida BOOLEAN, salida_esperada BOOLEAN) RETURN VARCHAR2 AS 
BEGIN
  IF (salida = salida_esperada) THEN
    RETURN 'EXITO';
  ELSE
    RETURN 'FALLO';
  END IF;
END ASSERT_EQUALS;
/
    
/************************************************************************
                       PAQUETES
*************************************************************************/


 CREATE OR REPLACE PACKAGE PRUEBAS_TIPOPROPIEDADES AS 

   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, w_nom VARCHAR2,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2,w_cod INTEGER, w_nom VARCHAR2, salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2,w_cod INTEGER, salidaEsperada BOOLEAN);

END PRUEBAS_TIPOPROPIEDADES;
/

 CREATE OR REPLACE PACKAGE BODY PRUEBAS_TIPOPROPIEDADES AS

  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN

    /* Borrar contenido de la tabla */
      DELETE FROM propiedadesvehiculos;
      DELETE FROM propiedades;
      DELETE FROM tipopropiedades;
    NULL;
  END inicializar;

/* PRUEBA PARA LA INSERCIÓN*/
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_nom VARCHAR2,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    tipopropiedad tipopropiedades%ROWTYPE;
    w_cod NUMBER(12);
  BEGIN
    
    /* Insertar fila*/
    insertar_tipo_propiedades(w_nom);
    
    /* Seleccionar departamento y comprobar que los datos se insertaron correctamente */
    w_cod := seq_tipopropiedades.currval;
    SELECT * INTO tipopropiedad FROM tipopropiedades WHERE id_tpro=w_cod;
    IF (tipopropiedad.nombre<>w_nom) THEN
      salida := false;
    END IF;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada)); 
    
    EXCEPTION
        WHEN OTHERS THEN
          
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
    
    
    COMMIT WORK;
      
    
  END insertar;

/* ACTUALIZACIÓN*/
  PROCEDURE actualizar (nombre_prueba VARCHAR2,w_cod INTEGER, w_nom VARCHAR2, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    tipopropiedad tipopropiedades%ROWTYPE;
  BEGIN
 
    actualizar_tipo_propiedades(w_cod,w_nom);
    

    SELECT * INTO tipopropiedad FROM tipopropiedades WHERE id_tpro=w_cod;
    IF (tipopropiedad.nombre<>w_nom) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END actualizar;


/* ELIMINACIÓN */
  PROCEDURE eliminar (nombre_prueba VARCHAR2,w_cod INTEGER, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n INTEGER;
  BEGIN
    

    eliminar_tipo_propiedades(w_cod);
    

    SELECT COUNT(*) INTO n FROM tipopropiedades WHERE id_tpro=w_cod;
    IF (n <> 0) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END eliminar;

END PRUEBAS_TIPOPROPIEDADES;
/

    
    
/************************************************************************
                        PRUEBAS
*************************************************************************/
    execute insertar_tipo_propiedades('Puertas');
    execute insertar_tipo_propiedades('Color');
    execute insertar_tipo_propiedades('Combustible');
    execute insertar_tipo_propiedades('Etiqueta Eficiencia');
    execute actualizar_tipo_propiedades(1,'Nº Puertas');
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
    insert into propiedades(id_tpro,nombre) values (3,'HÃ­brido');
    insert into propiedades(id_tpro,nombre) values (3,'ElÃ©ctrico');
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
    insert into Citas (Fecha, Hora,id_cli,id_conces) values (TO_DATE('12/12/2020'),13,1,1);
    insert into Citas (Fecha, Hora,id_cli,id_conces) values (TO_DATE('12/12/2020'),13,2,1);
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
