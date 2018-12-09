
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

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*Varios errores en las pruebas (package body) */

---------------------------------------------------------------PAQUETES-------------------------------------------------
create or replace package PRUEBAS_CLIENTE as
    procedure inicializar;
    procedure
    insertar(nombre_prueba VARCHAR2, w_email VARCHAR2,w_dni VARCHAR2,w_telef NUMBER,
    w_movil NUMBER, w_fechalta DATE,salidaEsperada BOOLEAN);
    procedure 
    actualizar(nombre_prueba VARCHAR2,w_cod_cli number,w_email VARCHAR2,w_dni VARCHAR2,w_telef NUMBER,
    w_movil NUMBER, w_fechalta DATE,salidaEsperada BOOLEAN);
    procedure
    eliminar(nombre_prueba VARCHAR2,w_cod_cli number,salidaEsperada BOOLEAN);
end PRUEBAS_CLIENTE;

create or replace package PRUEBAS_CITAS as
    procedure inicializar;
    procedure
    insertar(nombre_prueba VARCHAR2,w_fecha DATE, w_hora number,w_id_clien number,w_id_conces number,salidaEsperada BOOLEAN);
    procedure
    actualizar(nombre_prueba VARCHAR2,w_cod_cit number,w_fecha DATE, w_hora number,w_id_clien number,w_id_conces number
    ,salidaEsperada BOOLEAN);
    procedure
    eliminar(nombre_prueba VARCHAR2,w_cod_cit number,salidaEsperada BOOLEAN);
end PRUEBAS_CITAS;


create or replace package PRUEBAS_CONCESIONARIO as
    procedure inicializar;
    procedure insertar(nombre_prueba VARCHAR2,w_nomb VARCHAR2, w_direc VARCHAR2,w_telef number
    , w_email VARCHAR2, w_numcitas number,salidaEsperada BOOLEAN);
    procedure actualizar(nombre_prueba VARCHAR2,w_cod_cons number,w_nomb VARCHAR2, w_direc VARCHAR2,w_telef number
    , w_email VARCHAR2, w_numcitas number,salidaEsperada BOOLEAN);
    procedure eliminar(nombre_prueba VARCHAR2,w_cod_cons number,salidaEsperada BOOLEAN);
end PRUEBAS_CONCESIONARIO;


create or replace package body PRUEBAS_CLIENTE as
-----------------Inicializar-----------------
    procedure inicializar as
    Begin
        delete from CITAS;
        delete from CLIENTES;
        delete from CONCESIONARIO;
      null;
    end inicializar;
    
---------------Insertar---------------------
    procedure insertar(nombre_prueba VARCHAR2,w_email VARCHAR2, w_dni VARCHAR2,w_nombre VARCHAR, w_telef number, w_movil number,w_fechAlta date,salidaEsperada BOOLEAN) as
    salida BOOLEAN := true;
    cliente clientes%ROWTYPE;
    w_cod_cli INTEGER;
    begin
         insertar_clientes(w_email,w_dni,w_nombre,w_telef,w_movil,w_fechAlta);
         
         w_cod_cli :=seq_cliente.curval;
         select * into CLIENTES from CLIENTES where id_cli= w_cod_cli;
         if(clientes.email<>w_email or clientes.dni <>w_dni or clientes.nombre <>w_nombre or clientes.telef<>w_telef or
         clientes.movil <>w_movil or clientes.FechAlta<>w_fechAlta) then
         salida := false;
         end if;
         commit work;
         
          EXCEPTION
          WHEN OTHERS THEN
          /*DBMS_OUTPUT.put_line(SQLERRM);*/
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          
          ROLLBACK;
    end insertar;
-----------------Actualizar--------------
    procedure actualizar (nombre_prueba VARCHAR2,w_cod_cli number,w_email VARCHAR2,w_dni VARCHAR2,w_telef NUMBER,
    w_movil NUMBER, w_fechalta DATE,salidaEsperada BOOLEAN) as
    salida BOOLEAN := true;
    clientes  clientes%rowtype;
    begin
        actualizar_clientes(w_cod_cli,w_email,w_dni,w_telef,w_movil,w_fechalta);
       
        select * into CLIENTES from CLIENTES where id_cli = w_cod_cli;
        if(clientes.email<>w_email or clientes.dni <>w_dni or clientes.nombre <>w_nombre or clientes.telef<>w_telef or
         clientes.movil <>w_movil or clientes.FechAlta<>w_fechAlta) then
         salida := false;
        end if;
        commit work;
        
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
      
      select count * into n_clientes from CLIENTES where id_cli=w_cod_cli;
      if(n_clientes <>0)then
      salida:= false;
      end if;
      commit work;
      
      
       EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
    END eliminar;   
end PRUEBAS_CLIENTE;

create or replace package body PRUEBAS_CONCESIONARIO as
-----------------Inicializar---------
    procedure inicializar as
    begin
          delete from CITAS;
          delete from CLIENTES;
          delete from CONCESIONARIO;
        null;
    end inicializar; 
------------------Insertar---------------
    procedure insertar (nombre_prueba VARCHAR2,w_cod_cons number,w_nomb VARCHAR2, w_direc VARCHAR2,w_telef number
    , w_email VARCHAR2, w_numcitas number,salidaEsperada BOOLEAN) as
    salida BOOLEAN:= true;
    cliente clientes%type;
    w_cod_con INTEGER;
    begin
          insertar_concesionarios(w_nomb,w_direc,w_telef,w_email,w_numcitas);
          
          w_cod_con := seq_concesionario.curval;
          
          select * into CONCESIONARIOS from CONCESIONARIOS where id_conces = w_cod_cons;
          if(concesionarios.nombre<>w_nomb or concesionarios.direccion <> w_direc or concesionarios.telef <> w_telef
          or concesionarios.email <> w_email or concesionarios.NoCitas <> w_numcitas) then
          salida := false;
          end if;
          commit work;
          
          EXCEPTION
          WHEN OTHERS THEN
          /*DBMS_OUTPUT.put_line(SQLERRM);*/
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          
          ROLLBACK;
    end insertar;
-------------------Actualizar-----------------
    procedure actualizar (nombre_prueba VARCHAR2,w_cod_con number,w_nomb VARCHAR2, w_direc VARCHAR2,w_telef number
    , w_email VARCHAR2, w_numcitas number,salidaEsperada BOOLEAN) as
    salida BOOLEAN:= true;
    cliente clientes%type;
    begin
          actualizar_concesionarios(w_cod_con,w_nomb,w_direc,w_telef,w_email,w_numcitas);          
         
          select *into CONCESIONARIOS from CONCESIONARIOS where id_conces = w_cod_con;
          if(concesionarios.nombre<>w_nomb or concesionarios.direccion <> w_direc or concesionarios.telef <> w_telef
          or concesionarios.email <> w_email or concesionarios.NoCitas <> w_numcitas) then
          salida := false;
          end if;
          commit work;
          
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
      eliminar_clientes(w_cod_con);
      
      select count * into n_concesionario from CONCESIONARIOS where id_conces=w_cod_con;
      if(n_concesionario <>0)then
      salida:= false;
      end if;
      commit work;
      
      
       EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
    END eliminar;   
end PRUEBAS_CONCESIONARIO;
