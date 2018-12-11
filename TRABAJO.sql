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
DROP TABLE CITAS;
DROP TABLE CLIENTES;
DROP TABLE CONCESIONARIOS;
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
    matricula varchar2(7) not null,
    fechaAlta date not null,
    fechaVenta date not null,
    unique (matricula)
);

--Creación de tabla Financiacion
CREATE TABLE FINANCIACIONES(
    id_fin number(10) primary key,
    nombre varchar2(40) not null,
    maxima number(10,2)not null,
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
    nombre varchar2(80) not null,
    descripcion varchar2(400) not null,
    precio number(10,2) not null,
    disponible number(1) not null, check ((disponible=0) or (disponible = 1)),
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
    id_tpro number(10)not null,
    id_pro number(10) not null,
    id_veh number(10) not null,
    PRIMARY KEY (id_tpro,id_pro,id_veh),
    unique(id_tpro,id_veh),
    foreign key (id_veh) REFERENCES TIPOPROPIEDADES,
    foreign key (id_pro) REFERENCES PROPIEDADES,
    foreign key (id_veh) REFERENCES VEHICULOS
);

--Creación de tabla Descuento
CREATE TABLE DESCUENTOS(
    id_fin number(10)not null,
    descuento number(10,2) not null,
    id_veh number(10)not null,
    primary key(id_fin,id_veh),
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
   unique(dni), 
   unique(email)
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
drop sequence seq_financiaciones;
drop sequence seq_vehiculos;
drop sequence seq_tipopropiedades; 
drop sequence seq_propiedades;
drop sequence seq_cliente;
drop sequence seq_citas;
drop sequence seq_concesionario;
drop sequence seq_vehiculosvendidos;




--Creamos las secuencias
create sequence seq_fotoVehiculos  MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_fotoVehiculos.nextval from dual;
create sequence seq_tipovehiculos;
create sequence seq_financiaciones MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_financiaciones.nextval from dual;
create sequence seq_vehiculos MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_vehiculos.nextval from dual;
create sequence seq_tipopropiedades  MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_tipopropiedades.nextval from dual;
create sequence seq_propiedades MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_propiedades.nextval from dual;
create sequence seq_cliente;
create sequence seq_citas;
create sequence seq_concesionario;
create sequence seq_vehiculosvendidos;

    
    --Creación de Trigger Vehículo Vendido (secuencia)
    create or replace trigger SECUENCIA_VEHICULOS_VENDIDOS
    before insert on VEHICULOSVENDIDOS
    for each row
    begin
        :new.id_vhv := seq_vehiculosvendidos.nextval;    
    end;
    /


    /*--Creación de Trigger Financiación (secuencia)
    create or replace trigger SECUENCIA_FINANCIACIONES
    before insert on FINANCIACIONES
    for each row
    begin
        :new.id_fin := seq_financiaciones.nextval;    
    end;
    /*/
    

    --Creación de Trigger Tipo Propiedades (secuencia)
   /* create or replace trigger SECUENCIA_TIPO_PROPIEDADES
    before insert on TIPOPROPIEDADES
    for each row
    begin
        :new.id_tpro := seq_tipopropiedades.nextval;    
    end;
    /*/
    

    /*--Creación de Trigger Propiedades (secuencia)
    create or replace trigger SECUENCIA_PROPIEDADES
    before insert on PROPIEDADES
    for each row
    begin
        :new.id_pro := seq_propiedades.nextval;
    end;
    / */
    

    /*--Creación de Trigger Vehículo (secuencia)
    create or replace trigger SECUENCIA_VEHICULOS
    before insert on VEHICULOS
    for each row
    begin
        :new.id_veh := seq_vehiculos.nextval;   
    end;
    / */

    --Creación de Trigger TipoVehículo (secuencia)
    create or replace trigger SECUENCIA_TIPO_VEHICULOS
    before insert on TipoVehiculos
    for each row
    begin
        :new.id_tveh := seq_TipoVehiculos.nextval;    
    end;
    /    
    
    
    /*    --Creación de Trigger Vehículo (secuencia)
    create or replace trigger SECUENCIA_FOTOS_VEHICULOS
    before insert on FOTOVEHICULOS
    for each row
    begin
        :new.id_ft := seq_fotoVehiculos.nextval;   
    end;
    / */

  
    

    --Creación de Trigger Cliente (secuencia)
    create or replace trigger SECUENCIA_CLIENTES
    before insert on CLIENTES
    for each row
    begin
    :new.id_cli := seq_cliente.nextval;
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
    :new.id_conces := seq_concesionario.nextval;
    end;
    /


/************************************************************************
                        TRIGGER
*************************************************************************/

create or replace TRIGGER VEHICULO_VENDIDO
AFTER DELETE ON VEHICULOS
FOR EACH ROW
BEGIN
insert into vehiculosvendidos(matricula,fechaalta,fechaventa) values (:old.matricula,:old.fechaalta,to_date(sysdate));
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
    cod_tpro INTEGER;
    begin 
    insert into tipopropiedades values (seq_tipopropiedades.currval,t_pro);
    cod_tpro := seq_tipopropiedades.nextval;
    
     EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK work;
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
    (nombre_fin in financiaciones.nombre%type,
    maxima_fin in financiaciones.nombre%type)is
    cod_fin INTEGER;
    begin 
    insert into financiaciones values (seq_financiaciones.currval,nombre_fin,maxima_fin);
    cod_fin := seq_financiaciones.nextval;
    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK work;
    end insertar_financiacion ;
    /
    
    create or replace procedure actualizar_financiacion 
    (cod_fin in financiaciones.id_fin%type, 
    nombre_fin in financiaciones.nombre%type,
    maxima_fin in financiaciones.nombre%type)is
    begin 
    update financiaciones set maxima=maxima_fin, nombre = nombre_fin where cod_fin = id_fin;
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
    cod_pro INTEGER;
    begin 
    insert into propiedades values (seq_propiedades.currval, cod_tpro, nombre_pro);
    cod_pro := seq_propiedades.nextval;
    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK work;
    end insertar_propiedad;
    /
    
    create or replace procedure actualizar_propiedad
    (cod_pro in propiedades.id_pro%type, 
    nombre_pro in propiedades.nombre%type)is
    begin     
    update propiedades set  nombre = nombre_pro where cod_pro = id_pro;
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
    cod_veh Integer;
    begin 
    insert into vehiculos(id_veh,matricula,fechaalta,nombre,descripcion,precio,disponible,id_conces,id_tveh) 
    values (seq_vehiculos.currval,matricula_vhe,fecha_alta_vhe,nombre_vhe,descripcion_vhe,precio_vhe,disponible_vhe,id_conces_vhe,id_tveh_vhe);
    
    cod_veh := seq_vehiculos.nextval;
    
    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK work;
        
    end insertar_vehiculo;
    /
    
    create or replace procedure actualizar_vehiculo
    (cod_veh in vehiculos.id_veh%type,
    matricula_veh in vehiculos.matricula%type,
    fecha_alta_veh in vehiculos.fechaalta%type,
    nombre_veh in vehiculos.nombre%type,
    descripcion_veh in vehiculos.descripcion%type,
    precio_veh in vehiculos.precio%type,
    disponible_veh in vehiculos.disponible%type,
    id_conces_veh in vehiculos.id_conces%type,
    id_tveh_veh in vehiculos.id_tveh%type)is
    begin 
    update vehiculos set  matricula = matricula_veh, fechaalta = fecha_alta_veh , nombre = nombre_veh , descripcion = descripcion_veh,
    precio = precio_veh , disponible = disponible_veh , id_conces = id_conces_veh , id_tveh=id_tveh_veh where cod_veh = id_veh;
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
    
     --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR DESCUENTOS
    create or replace procedure insertar_descuento
    (cod_fin in descuentos.id_fin%type,
    valor_descuento in descuentos.descuento%type,
    cod_veh in descuentos.id_veh%type)is
    begin insert into descuentos(id_fin,descuento,id_veh) values (cod_fin,valor_descuento,cod_veh);
    commit work;
    end insertar_descuento;
    /
    
    create or replace procedure actualizar_descuento
    (cod_fin in descuentos.id_fin%type,
    valor_descuento in descuentos.descuento%type,
    cod_veh in descuentos.id_veh%type)is
    begin     
    if (valor_descuento <> 0)then
    update descuentos set descuento = valor_descuento where id_fin = cod_fin and id_veh = cod_veh;
    else 
    delete from descuentos where id_fin = cod_fin and id_veh = cod_veh;
    end if;
    commit work;
    end actualizar_descuento;
    /
  
    
    
     --PROCEDURES INSERTAR Y BORRAR FOTO VEHICULO Y ACTUALIZAR POSICION
    create or replace procedure insertar_foto_vehiculo
    (cod_veh in fotovehiculos.id_veh%type,
    valor_posicion in fotovehiculos.posicion%type)is
    begin 
    insert into fotovehiculos(id_veh,posicion) values (cod_veh,valor_posicion);
    commit work;
    end insertar_foto_vehiculo;
    /
    
    create or replace procedure actualizar_ft_veh_posición 
    (cod_ft in fotovehiculos.id_ft%type,
    valor_posicion in fotovehiculos.posicion%type)is
    begin 
    update fotovehiculos set posicion = valor_posicion where id_ft=cod_ft;
    commit work;
    end actualizar_ft_veh_posición;
    /
    
    
     create or replace procedure eliminar_foto_vehiculo 
    (cod_ft in fotovehiculos.id_ft%type)is
    begin 
    delete from fotovehiculos where id_ft=cod_ft;
    commit work;
    end eliminar_foto_vehiculo;
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
    
    --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR CLIENTES
    create or replace procedure insertar_clientes
    (email_cli in CLIENTES.email%type,
    dni_cli in CLIENTES.dni%type, 
    nombre_cli in CLIENTES.nombre%type,
    telef_cli in CLIENTES.telef%type,
    movil_cli in CLIENTES.movil%type,
    FechAlta_cli in CLIENTES.FechAlta%type) is
    begin
    insert into CLIENTES(email,dni,nombre,telef,movil,FechAlta) 
    values (email_cli, dni_cli, nombre_cli, telef_cli, movil_cli,FechAlta_cli);
    commit work;
    end insertar_clientes;
    /
   
   create or replace procedure actualizar_clientes(
   id_clii in CLIENTES.id_cli%type,
   email_cli in CLIENTES.email%type,
   dni_cli in CLIENTES.dni%type,
   nombre_cli in CLIENTES.nombre%type,
   telef_cli in CLIENTES.telef%type,
   movil_cli in CLIENTES.movil%type,
   FechAlta_cli in CLIENTES.FechAlta%type) is
   begin
   update CLIENTES set email= email_cli, dni=dni_cli, nombre=nombre_cli, telef=telef_cli,
   movil= movil_cli,FechAlta= FechAlta_cli where id_clii= id_cli;
   commit work;
   end actualizar_clientes;
   /
   create or replace procedure eliminar_clientes(cod_cli in clientes.id_cli%type)is
   begin
   delete from CITAS where cod_cli  = id_cli;
   delete from CLIENTES where cod_cli = id_cli;
   commit work;
   end eliminar_clientes;
   /
       
   --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR CONCESIONARIOS
   create or replace procedure insertar_concesionarios
   (nombre_con in CONCESIONARIOS.nombre%type,
   direccion_con in CONCESIONARIOS.direccion%type,
   telef_con in CONCESIONARIOS.telef%type,
   email_con in CONCESIONARIOS.email%type,
   NoCitas_con in CONCESIONARIOS.NoCitas%type) is
   begin
   insert into CONCESIONARIOS(Nombre,Direccion,Telef,Email,NoCitas)
   values (nombre_con,direccion_con,telef_con,email_con,NoCitas_con);
   commit work;
   end insertar_concesionarios;
   /
   create or replace procedure actualizar_concesionarios(
   id_concess in CONCESIONARIOS.id_conces%type,
   nombre_con in CONCESIONARIOS.nombre%type,
   direccion_con in CONCESIONARIOS.direccion%type,
   telef_con in CONCESIONARIOS.telef%type,
   email_con in CONCESIONARIOS.email%type,
   NoCitas_con in CONCESIONARIOS.NoCitas%type) is
   begin
   update CONCESIONARIOS set nombre = nombre_con, direccion= direccion_con, telef = telef_con, email= email_con,
   NoCitas = NoCitas_con where id_concess= id_conces;
   commit work;
   end actualizar_concesionarios;
   /
   create or replace procedure eliminar_concesionario(cod_conces in concesionarios.id_conces%type)is
   begin
   delete from CITAS where cod_conces = id_conces;
   delete from CONCESIONARIOS where cod_conces = id_conces;
   commit work;
   end eliminar_concesionario;
   /
   --PROCEDURES INSERTAR, ACTUALIZAR Y BORRAR CITAS
   create or replace procedure insertar_citas
   (fecha_cit in CITAS.Fecha%type,
   hora_cit in CITAS.hora%type,
   id_cli_cit in CITAS.id_cli%type,
   id_conces_cit in CITAS.id_conces%type) is
   begin
   insert into CITAS (fecha, hora, id_cli, id_conces) 
   values(fecha_cit,hora_cit,id_cli_cit,id_conces_cit);
   commit work;
   end insertar_citas;
   /
   create or replace procedure actualizar_citas(
   id_cit_cit in CITAS.id_cit%type,
   fecha_cit in CITAS.Fecha%type,
   hora_cit in CITAS.hora%type,
   id_cli_cit in CITAS.id_cli%type,
   id_conces_cit in CITAS.id_conces%type) is
   begin
   update CITAS set Fecha=fecha_cit, hora=hora_cit, id_cli=id_cli_cit, id_conces=id_conces_cit where id_cit_cit=id_cit;
   commit work;
   end actualizar_citas;
   /
   create or replace procedure eliminar_citas(cod_cit in CITAS.id_cit%type) is
   begin 
   delete from CITAS where cod_cit = id_cit;
   commit work;
   end eliminar_citas;
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

     /* Seleccionar departamento y comprobar que los datos se insertaron correctamente */
    w_cod := seq_tipopropiedades.currval;
    
    /* Insertar fila*/
    insertar_tipo_propiedades(w_nom);
    
   
       
    
    SELECT * INTO tipopropiedad FROM tipopropiedades WHERE id_tpro=w_cod;
    
    
    IF ((tipopropiedad.nombre<>w_nom)) THEN
      salida := false;
     END IF;
     
     COMMIT WORK;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada)); 
    
    EXCEPTION
        WHEN OTHERS THEN
          salida := false;
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;

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



CREATE OR REPLACE PACKAGE PRUEBAS_PROPIEDADES AS 

   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2,w_id_tpro INTEGER, w_nom VARCHAR2,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2,w_cod INTEGER, w_nom VARCHAR2, salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2,w_cod INTEGER, salidaEsperada BOOLEAN);

END PRUEBAS_PROPIEDADES;
/

 CREATE OR REPLACE PACKAGE BODY PRUEBAS_PROPIEDADES AS

  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN

    /* Borrar contenido de la tabla */
      DELETE FROM propiedadesvehiculos;
      DELETE FROM propiedades;
    NULL;
  END inicializar;

/* PRUEBA PARA LA INSERCIÓN*/
  PROCEDURE insertar (nombre_prueba VARCHAR2,w_id_tpro INTEGER, w_nom VARCHAR2,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    propiedad propiedades%ROWTYPE;
    w_cod NUMBER(12);
  BEGIN
    
    /* Seleccionar departamento y comprobar que los datos se insertaron correctamente */
    w_cod := seq_propiedades.currval;
    
    /* Insertar fila*/
    insertar_propiedad(w_nom,w_id_tpro);
    
    SELECT * INTO propiedad FROM propiedades WHERE id_pro=w_cod;
    IF ((propiedad.nombre<>w_nom) and (propiedad.id_tpro<>w_id_tpro)) THEN
      salida := false;
    END IF;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada)); 
    
    COMMIT WORK;
    
    EXCEPTION
        WHEN OTHERS THEN
          
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
    
    
    
      
    
  END insertar;

/* ACTUALIZACIÓN*/
  PROCEDURE actualizar (nombre_prueba VARCHAR2,w_cod INTEGER, w_nom VARCHAR2, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    propiedad propiedades%ROWTYPE;
  BEGIN
 
    actualizar_propiedad(w_cod,w_nom);
    

    SELECT * INTO propiedad FROM propiedades WHERE id_pro=w_cod;
    IF (propiedad.nombre<>w_nom) THEN
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
    

    eliminar_propiedad(w_cod);
    

    SELECT COUNT(*) INTO n FROM propiedades WHERE id_pro=w_cod;
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

END PRUEBAS_PROPIEDADES;
/






 CREATE OR REPLACE PACKAGE PRUEBAS_VEHICULOS AS 

   PROCEDURE inicializar;
   
   PROCEDURE insertar (
   nombre_prueba VARCHAR2, 
   w_matricula VARCHAR2,
   w_fechaAlta date,
   w_nombre varchar2,
   w_descripcion varchar2,
   w_precio number,
   w_disponible number,
   cod_conces number,
   cod_tveh number,
   salidaEsperada BOOLEAN);
   
   PROCEDURE actualizar (
   nombre_prueba VARCHAR2,
   cod_veh INTEGER,
   w_matricula VARCHAR2,
   w_fechaAlta date,
   w_nombre varchar2,
   w_descripcion varchar2,
   w_precio number,
   w_disponible number,
   cod_conces number,
   cod_tveh number,
   salidaEsperada BOOLEAN);
   
   PROCEDURE eliminar (nombre_prueba VARCHAR2,cod_veh INTEGER, salidaEsperada BOOLEAN);

END PRUEBAS_VEHICULOS;
/

 CREATE OR REPLACE PACKAGE BODY PRUEBAS_VEHICULOS AS

  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN

    /* Borrar contenido de la tabla */
      DELETE FROM propiedadesvehiculos;
      DELETE FROM descuentos;
      delete from vehiculosvendidos;
      DELETE FROM vehiculos;
    NULL;
  END inicializar;

/* PRUEBA PARA LA INSERCIÓN*/
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_matricula VARCHAR2, w_fechaAlta date, w_nombre varchar2, w_descripcion varchar2, 
  w_precio number, w_disponible number, cod_conces number, cod_tveh number, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    vehiculo vehiculos%ROWTYPE;
    w_cod NUMBER(12);
  BEGIN
    
     /* Seleccionar departamento y comprobar que los datos se insertaron correctamente */
    w_cod := seq_vehiculos.currval;
    
    /* Insertar fila*/
    insertar_vehiculo(w_matricula,w_fechaAlta,w_nombre,w_descripcion,w_precio,w_disponible,cod_conces,cod_tveh);
    
   
    SELECT * INTO vehiculo FROM vehiculos WHERE id_veh=w_cod;
 
    
    IF ((vehiculo.matricula<>w_matricula) or (vehiculo.fechaAlta<>w_fechaAlta) or (vehiculo.nombre<>w_nombre) or 
    (vehiculo.descripcion<>w_descripcion) or (vehiculo.precio<>w_precio) or (vehiculo.disponible<>w_disponible) or
    (vehiculo.id_conces<>cod_conces) or (vehiculo.id_tveh<>cod_tveh)) THEN
      salida := false;
    END IF;
    
    COMMIT WORK;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada)); 
    
    
    EXCEPTION
        WHEN OTHERS THEN
          
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
 
    
  END insertar;

/* ACTUALIZACIÓN*/
  PROCEDURE actualizar (nombre_prueba VARCHAR2, cod_veh INTEGER, w_matricula VARCHAR2, w_fechaAlta date, w_nombre varchar2,
   w_descripcion varchar2, w_precio number, w_disponible number, cod_conces number, cod_tveh number, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    vehiculo vehiculos%ROWTYPE;
  BEGIN
 
    actualizar_vehiculo(cod_veh,w_matricula,w_fechaAlta,w_nombre,w_descripcion,w_precio,w_disponible,cod_conces,cod_tveh);
    

   SELECT * INTO vehiculo FROM vehiculos WHERE id_veh=cod_veh;
   
    IF ((vehiculo.matricula<>w_matricula) or (vehiculo.fechaAlta<>w_fechaAlta) or (vehiculo.nombre<>w_nombre) or 
    (vehiculo.descripcion<>w_descripcion) or (vehiculo.precio<>w_precio) or (vehiculo.disponible<>w_disponible) or
    (vehiculo.id_conces<>cod_conces) or (vehiculo.id_tveh<>cod_tveh)) THEN
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
  PROCEDURE eliminar (nombre_prueba VARCHAR2,cod_veh INTEGER, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n INTEGER;
  BEGIN
    

    eliminar_vehiculos(cod_veh);
    

    SELECT COUNT(*) INTO n FROM vehiculos WHERE id_veh=cod_veh;
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

END PRUEBAS_VEHICULOS;
/




CREATE OR REPLACE PACKAGE PRUEBAS_PROPIEDADESVEHICULOS AS 

   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, w_id_tpro INTEGER,w_id_pro INTEGER,w_id_veh INTEGER,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2, w_id_tpro INTEGER,w_id_pro INTEGER,w_id_veh INTEGER, salidaEsperada BOOLEAN);
   

END PRUEBAS_PROPIEDADESVEHICULOS;
/

 CREATE OR REPLACE PACKAGE BODY PRUEBAS_PROPIEDADESVEHICULOS AS

  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN

    /* Borrar contenido de la tabla */
      DELETE FROM propiedadesvehiculos;
    NULL;
  END inicializar;

/* PRUEBA PARA LA INSERCIÓN*/
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_id_tpro INTEGER,w_id_pro INTEGER,w_id_veh INTEGER,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    propiedadvehiculo propiedadesvehiculos%ROWTYPE;
  BEGIN
    
    /* Insertar fila*/
    insertar_propiedad_vehiculo(w_id_tpro,w_id_pro,w_id_veh);
    
     
    SELECT * INTO propiedadvehiculo FROM propiedadesvehiculos WHERE id_tpro=w_id_tpro and id_pro=w_id_pro and id_veh=w_id_veh;
    IF (propiedadvehiculo.id_tpro<>w_id_tpro and propiedadvehiculo.id_pro<>w_id_pro and propiedadvehiculo.id_veh<>w_id_veh) THEN
      salida := false;
    END IF;
    
    COMMIT WORK;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada)); 
    
    EXCEPTION
        WHEN OTHERS THEN
          
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
    
    
    
      
    
  END insertar;

/* ACTUALIZACIÓN*/
  PROCEDURE actualizar (nombre_prueba VARCHAR2, w_id_tpro INTEGER,w_id_pro INTEGER,w_id_veh INTEGER, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    propiedadvehiculo propiedadesvehiculos%ROWTYPE;
    n INTEGER;
  BEGIN
 
    actualizar_propiedad_vehiculo(w_id_tpro,w_id_pro,w_id_veh);
    
    if (w_id_pro<>0)then
        SELECT * INTO propiedadvehiculo FROM propiedadesvehiculos WHERE id_tpro=w_id_tpro and id_pro=w_id_pro and id_veh=w_id_veh;
    else
        SELECT COUNT(*) INTO n FROM propiedadesvehiculos WHERE id_pro=w_id_pro;
    end if;
    
    
    
    IF ((w_id_pro=0))THEN
        if(n<> 0) then
            salida := false;
        end if;
    elsIF ( propiedadvehiculo.id_tpro<>w_id_tpro and propiedadvehiculo.id_pro<>w_id_pro and propiedadvehiculo.id_veh<>w_id_veh) THEN
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

END PRUEBAS_PROPIEDADESVEHICULOS;
/

create or replace package PRUEBAS_CLIENTE as
    procedure inicializar;
    procedure insertar(
    nombre_prueba VARCHAR2,
    w_email VARCHAR2,
    w_dni VARCHAR2,
    w_nombre VARCHAR,
    w_telef NUMBER,
    w_movil NUMBER,
    w_fechalta DATE,
    salidaEsperada BOOLEAN);
    procedure actualizar(
    nombre_prueba VARCHAR2,
    w_cod_cli number,
    w_email VARCHAR2,
    w_dni VARCHAR2,
    w_nombre VARCHAR,
    w_telef NUMBER,
    w_movil NUMBER,
    w_fechalta DATE,
    salidaEsperada BOOLEAN);
    procedure eliminar(
    nombre_prueba VARCHAR2,
    w_cod_cli number,
    salidaEsperada BOOLEAN);
end PRUEBAS_CLIENTE;
/

create or replace package body PRUEBAS_CLIENTE as
-----------------Inicializar-----------------
    procedure inicializar as
    Begin
        delete from CITAS;
        delete from CLIENTES;
        delete from CONCESIONARIOS;
      null;
    end inicializar;
    
---------------Insertar---------------------
    procedure insertar(nombre_prueba VARCHAR2,w_email VARCHAR2, w_dni VARCHAR2,w_nombre VARCHAR, w_telef number, w_movil number,w_fechAlta date,salidaEsperada BOOLEAN) as
    salida BOOLEAN := true;
    cliente clientes%ROWTYPE;
    w_cod_cli number(12);
    begin
        /*insertar fila*/
        insertar_clientes(w_email,w_dni,w_nombre,w_telef,w_movil,w_fechAlta);
         
        w_cod_cli :=seq_cliente.currval;
         
        select * into cliente from CLIENTES where id_cli = w_cod_cli;
        if((cliente.email<>w_email) or (cliente.dni <>w_dni) or (cliente.nombre <>w_nombre) or (cliente.telef<>w_telef) or
        (cliente.movil <>w_movil) or (cliente.FechAlta<>w_fechAlta)) then
        salida := false;
        end if;
         
        /*Mostrar resultado de la prueba*/
        DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
            ROLLBACK;
        commit work;
        
        
    end insertar;
-----------------Actualizar--------------
    procedure actualizar (nombre_prueba VARCHAR2,w_cod_cli number,w_email VARCHAR2,w_dni VARCHAR2,w_nombre VARCHAR,w_telef NUMBER,
    w_movil NUMBER, w_fechalta DATE,salidaEsperada BOOLEAN) as
    salida BOOLEAN := true;
    cliente  clientes%ROWTYPE;
    begin
    
    
        actualizar_clientes(w_cod_cli,w_email,w_dni,w_nombre,w_telef,w_movil,w_fechalta);
       
        select * into cliente from clientes where id_cli = w_cod_cli;
        
        if((cliente.email<>w_email) or (cliente.dni <>w_dni) or (cliente.nombre <>w_nombre) or (cliente.telef<>w_telef) or
         (cliente.movil <>w_movil) or (cliente.FechAlta<>w_fechAlta)) then
         salida := false;
        end if;
        commit work;
        
        DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
           DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
           ROLLBACK;
    end actualizar;
    -----------------Eliminar--------------
    procedure eliminar (nombre_prueba VARCHAR2,w_cod_cli number,salidaEsperada BOOLEAN) as
      salida BOOLEAN:= true;
      n_clientes INTEGER;
    begin
       eliminar_clientes(w_cod_cli);
      
       select count (*) into n_clientes from CLIENTES where id_cli=w_cod_cli;
       if(n_clientes <> 0)then
       salida := false;
       end if;
       commit work;
      
       /* Mostrar resultado de la prueba */
       DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada));
      
      
       EXCEPTION
       WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
    END eliminar;   
end PRUEBAS_CLIENTE;
/


create or replace package PRUEBAS_CONCESIONARIO as
    procedure inicializar;
    procedure insertar(
    nombre_prueba VARCHAR2,
    w_nomb VARCHAR2,
    w_direc VARCHAR2,
    w_telef number
    , w_email VARCHAR2,
    w_numcitas number,
    salidaEsperada BOOLEAN);
    procedure actualizar(
    nombre_prueba VARCHAR2,
    w_cod_con number,
    w_nomb VARCHAR2,
    w_direc VARCHAR2,
    w_telef number,
    w_email VARCHAR2,
    w_numcitas number,
    salidaEsperada BOOLEAN);
    procedure eliminar(
    nombre_prueba VARCHAR2,
    w_cod_con number,
    salidaEsperada BOOLEAN);
end PRUEBAS_CONCESIONARIO;
/

create or replace package body PRUEBAS_CONCESIONARIO as
-----------------Inicializar---------
    procedure inicializar as
    begin
          delete from CITAS;
          delete from CLIENTES;
          delete from CONCESIONARIOS;
        null;
    end inicializar; 
------------------Insertar---------------
    procedure insertar (nombre_prueba VARCHAR2,w_nomb VARCHAR2, w_direc VARCHAR2,w_telef number
    ,w_email VARCHAR2, w_numcitas number,salidaEsperada BOOLEAN) as
    salida BOOLEAN:= true;
    concesionario concesionarios%ROWTYPE;
    w_cod_con number(12);
    begin
       insertar_concesionarios(w_nomb,w_direc,w_telef,w_email,w_numcitas);
          
       w_cod_con := seq_concesionario.currval; 
       select * into concesionario from CONCESIONARIOS where id_conces = w_cod_con;
         
       if((concesionario.nombre<>w_nomb) or (concesionario.direccion <> w_direc) or (concesionario.telef <> w_telef)
       or (concesionario.email <> w_email) or (concesionario.NoCitas <> w_numcitas)) then
       salida := false;
       end if;
          
       /* Mostrar resultado de la prueba */
       DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada)); 
          
       EXCEPTION
          WHEN OTHERS THEN
          /*DBMS_OUTPUT.put_line(SQLERRM);*/
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
       commit work;
        
    end insertar;
-------------------Actualizar-----------------
    procedure actualizar (nombre_prueba VARCHAR2,w_cod_con number,w_nomb VARCHAR2, w_direc VARCHAR2,w_telef number
    , w_email VARCHAR2, w_numcitas number,salidaEsperada BOOLEAN) as
    salida BOOLEAN:= true;
    concesionario concesionarios%ROWTYPE;
    begin
          actualizar_concesionarios(w_cod_con,w_nomb,w_direc,w_telef,w_email,w_numcitas);          
         
          select * into CONCESIONARIO from CONCESIONARIOS where id_conces = w_cod_con;
          if((concesionario.nombre<>w_nomb) or (concesionario.direccion <> w_direc) or (concesionario.telef <> w_telef)
          or (concesionario.email <> w_email) or (concesionario.NoCitas <> w_numcitas)) then
          salida := false;
          end if;
          commit work;
          
          /* Mostrar resultado de la prueba */
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada));
          
          EXCEPTION
          WHEN OTHERS THEN
             /*DBMS_OUTPUT.put_line(SQLERRM);*/
             DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
             ROLLBACK;
    end actualizar;
    -------------------eliminado-----------------
    procedure eliminar (nombre_prueba VARCHAR2,w_cod_con number,salidaEsperada BOOLEAN) as
     salida BOOLEAN:= true;
     n_concesionario INTEGER;
    begin
       eliminar_concesionario(w_cod_con);
      
       select count (*) into n_concesionario from CONCESIONARIOS where id_conces=w_cod_con;
       if(n_concesionario <> 0)then
          salida := false;
       end if;
       commit work;
       
       /* Mostrar resultado de la prueba */
       DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
         DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
         ROLLBACK;
    END eliminar;   
end PRUEBAS_CONCESIONARIO;
/

create or replace package PRUEBAS_CITAS as
   procedure inicializar;
   procedure insertar(
   nombre_prueba VARCHAR2,
   w_fecha date,
   w_hora number,
   w_id_cli number,
   w_id_conces number,
   salidaEsperada BOOLEAN);
   procedure actualizar(
   nombre_prueba VARCHAR2,
   w_id_cit number,
   w_fecha date,
   w_hora number,
   w_id_cli number,
   w_id_conces number,
   salidaEsperada BOOLEAN);
   procedure eliminar(
   nombre_prueba VARCHAR2,
   w_id_cit number,
   salidaEsperada BOOLEAN);
end PRUEBAS_CITAS;
/

create or replace package body PRUEBAS_CITAS as

/* inicialización*/
   procedure inicializar as
   begin
      delete from Citas;
      delete from Clientes;
      delete from Concesionarios;
      null;
   end inicializar;

/*insertar*/
   procedure insertar (nombre_prueba VARCHAR2,w_fecha date,w_hora number,w_id_cli number,w_id_conces number,salidaEsperada BOOLEAN) as
      salida BOOLEAN:= true;
      cita citas%rowtype;
      w_cod number(12);
   begin 
   
      insertar_citas(w_fecha,w_hora,w_id_cli,w_id_conces);
      --id_cit fecha hoea id_cli id_conces
      w_cod := seq_citas.currval;
      
      select * into cita from citas where id_cit = w_cod;
      
      if((cita.fecha <> w_fecha)or (cita.hora <>w_hora) or (cita.id_cli<>w_id_cli) or(cita.id_conces <> w_id_conces)) then
      salida := false;
      end if;
   
   
      DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada)); 
   
      EXCEPTION
           WHEN OTHERS THEN
             DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
             ROLLBACK;
       COMMIT WORK;
    
   end insertar; 
   
   procedure actualizar (nombre_prueba VARCHAR2,w_id_cit number,w_fecha date,w_hora number,
   w_id_cli number,w_id_conces number,salidaEsperada BOOLEAN)as
   salida BOOLEAN := true;
   cita citas%rowtype;
   
   begin 
        actualizar_citas(w_id_cit,w_fecha,w_hora,w_id_cli,w_id_conces);
        
        select * into cita from CITAS where id_cit = w_id_cit;
        if((cita.fecha <> w_fecha) or (cita.hora <> w_hora) or (cita.id_cli <> w_id_cli)
        or (cita.id_CONCES <> w_id_conces)) then
        salida := false;
        end if;
     
        DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
        /*DBMS_OUTPUT.put_line(SQLERRM);*/
            DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
            ROLLBACK;
        commit work;
   end actualizar;
   
   procedure eliminar(nombre_prueba VARCHAR2,w_id_cit number,salidaEsperada BOOLEAN) as
   salida BOOLEAN:= true;
     n_citas INTEGER;
    begin
       eliminar_citas(w_id_cit);
      
       select count (*) into n_citas from CITAS where id_cit=w_id_cit;
       if(n_citas <> 0)then
          salida := false;
       end if;
       commit work;
       
       /* Mostrar resultado de la prueba */
       DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada));
      
      EXCEPTION
      WHEN OTHERS THEN
         DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
         ROLLBACK;
   
   end eliminar;
end PRUEBAS_CITAS; 
/




 CREATE OR REPLACE PACKAGE PRUEBAS_FINACIACIONES AS 

   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, w_nom VARCHAR2, w_maxima_fin number,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2,w_cod INTEGER, w_nom VARCHAR2,w_maxima_fin number, salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2,w_cod INTEGER, salidaEsperada BOOLEAN);

END PRUEBAS_FINACIACIONES;
/

 CREATE OR REPLACE PACKAGE BODY PRUEBAS_FINACIACIONES AS

  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN

    /* Borrar contenido de la tabla */
      DELETE FROM descuentos;
      DELETE FROM financiaciones;
    NULL;
  END inicializar;

/* PRUEBA PARA LA INSERCIÓN*/
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_nom VARCHAR2, w_maxima_fin number,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    financiacion financiaciones%ROWTYPE;
    w_cod NUMBER(12);
  BEGIN

     /* Seleccionar departamento y comprobar que los datos se insertaron correctamente */
    w_cod := seq_financiaciones.currval;
    
    /* Insertar fila*/
    insertar_financiacion(w_nom,w_maxima_fin);
    
    SELECT * INTO financiacion FROM financiaciones WHERE id_fin=w_cod;
    
    
    IF ((financiacion.nombre<>w_nom) or (financiacion.maxima<>w_maxima_fin)) THEN
      salida := false;
     END IF;
     
     COMMIT WORK;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(salida,salidaEsperada)); 
    
    EXCEPTION
        WHEN OTHERS THEN
          salida := false;
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;

  END insertar;

/* ACTUALIZACIÓN*/
  PROCEDURE actualizar (nombre_prueba VARCHAR2,w_cod INTEGER, w_nom VARCHAR2,w_maxima_fin number, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    financiacion financiaciones%ROWTYPE;
  BEGIN
 
    actualizar_financiacion(w_cod,w_nom,w_maxima_fin); 

    SELECT * INTO financiacion FROM financiaciones WHERE id_fin=w_cod;  

    IF ((financiacion.nombre<>w_nom) or (financiacion.maxima<>w_maxima_fin)) THEN
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
    

    eliminar_financiacion(w_cod);
    

    SELECT COUNT(*) INTO n FROM financiaciones WHERE id_fin=w_cod;
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

END PRUEBAS_FINACIACIONES;
/

    
    
/************************************************************************
                        PRUEBAS
*************************************************************************/


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
    
   

