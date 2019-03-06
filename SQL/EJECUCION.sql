SET SERVEROUTPUT ON;


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
drop sequence seq_metavehiculos;
drop sequence seq_metatipos;
drop sequence seq_empleados;



--Creamos las secuencias
create sequence seq_fotoVehiculos  MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_fotoVehiculos.nextval from dual;
create sequence seq_tipovehiculos MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_tipovehiculos.nextval from dual;
create sequence seq_financiaciones MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_financiaciones.nextval from dual;
create sequence seq_vehiculos MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_vehiculos.nextval from dual;
create sequence seq_tipopropiedades  MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_tipopropiedades.nextval from dual;
create sequence seq_propiedades MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_propiedades.nextval from dual;
create sequence seq_cliente MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_cliente.nextval from dual;
create sequence seq_citas MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_citas.nextval from dual;
create sequence seq_concesionario MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_concesionario.nextval from dual;
create sequence seq_vehiculosvendidos;
create sequence seq_metavehiculos MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_metavehiculos.nextval from dual;
create sequence seq_metatipos MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_metatipos.nextval from dual;
create sequence seq_empleados MINVALUE 1 INCREMENT BY 1 START WITH 1;
select seq_empleados.nextval from dual;


DECLARE
  cod_ft Integer;
  cod_fin Integer;
  cod_tpro INTEGER;
  cod_veh INTEGER;
  cod_pro INTEGER;
  cod_cli INTEGER;
  cod_conces INTEGER;
  cod_cit INTEGER;
  prueba_conces Integer;
  prueba_conces2 Integer;
  cod_empleados Integer;
  cod_metaveh Integer;
  w_cod Integer;
  cod_metatip Integer;
  CR_LF CHAR(2) := CHR(13)||CHR(10); 
BEGIN

/*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA TIPOVEHICULOS
  **********************************************************************/
 
  PRUEBAS_TIPOVEHICULOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de TIPOVEHICULOS (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_TIPOVEHICULOS.INSERTAR('Tveh-01/Insert-"Tipovehiculos=TVEH1"                           /Commit  --> ','Berlina','Un vehículo berlina es aquel que tiene...',8000,true);
  w_cod:= seq_tipovehiculos.currval-1;
  PRUEBAS_TIPOVEHICULOS.INSERTAR('Tveh-02/Insert-"Tipovehiculos=TVEH2"                           /Commit  -->' ,'Urbano', 'Un coche urbano es aquel que tiene...',20000,true);
  PRUEBAS_TIPOVEHICULOS.INSERTAR('Tveh-03/Insert-"Tipovehiculos=TVEH3"                           /Commit  -->' ,'Industrial', 'Un coche industrial es aquel que tiene...',30000,true);
  PRUEBAS_TIPOVEHICULOS.INSERTAR('Tveh-04/Insert-"Tipovehiculos= nombre null"                    /Rollback-->',null ,'Un vehículo industrial es aquel que tiene...',10500, false);
  PRUEBAS_TIPOVEHICULOS.INSERTAR('Tveh-05/Insert-"Tipovehiculos= decripcion null"                /Rollback-->' ,'Utilitario' , null,10500, false);
  PRUEBAS_TIPOVEHICULOS.INSERTAR('Tveh-06/Insert-"Tipovehiculos=maxima null"                     /Rollback  -->' ,'Utilitario', 'Un vehículo industrial es aquel que tiene...', null ,false);
  PRUEBAS_TIPOVEHICULOS.ACTUALIZAR('Tveh-07/Update-"Tipovehiculos=TVEH1"                         /Commit-->',w_cod,'Mixto','Un vehículo mixto es aquel que tiene...',7599,true);
  PRUEBAS_TIPOVEHICULOS.ELIMINAR('Tveh-08/Delete-"Tipovehiculos=TVEH1"                           /Commit-->',w_cod,true);

 /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA CONCESIONARIOS
  **********************************************************************/
  
  
   PRUEBAS_CONCESIONARIO.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de Concesionario (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-01/insert-"Concesionario= prueba"                   /Commit-->','Con1','calle2',756493499,'prueba2@prueba1',11,true);
  cod_conces := seq_concesionario.currval-1;
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-02/insert-"Concesionario= C1"                       /Commit-->','Viuda de Terry','calle Álava',967345678,'pruebacon@gmail.com',2,true);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-02/insert-"Concesionario= C2"                       /Commit-->','Prueba','Calle Prueba',967345678,'pruebacon@gmail.com',2,true);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-04/insert-"Concesionario= nombre null"              /Rollback-->',null,'calle3',756493496,'prueba2@prueba2',10,false);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-05/insert-"Concesionario= calle null"               /Rollback-->','Con3',null,756493496,'prueba2@prueba2',10,false);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-06/insert-"Concesionario= telef null"               /Rollback-->','Con3','calle3',null,'prueba2@prueba2',10,false);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-07/insert-"Concesionario= email null"               /Rollback-->','Con3','calle3',756493496,null,10,false);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-08/insert-"Concesionario= NoCitas null"             /Rollback-->','Con3','calle3',756493496,'prueba2@prueba2',null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-02/Insert-"Vehiculos=V1"                            /Commit  --> ','1356JBK',TO_DATE('2017-12-20', 'YYYY-MM-DD'),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,1,null,true);
  select id_conces into prueba_conces from vehiculos where matricula = '1356JBK';
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-01/Insert-"Empleados=E2"                              /Commit -->','Rosa Márquez','administrativo','rosmar','1904m', '48592056B', 1,true);
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-02/Insert-"Empleados=E3"                              /Commit -->','María Martínez ','vendedor','marimar','mmz1889', '01724748R', 1 ,true);
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-02/Insert-"Empleados=E3"                              /Commit -->','María Tom ','vendedor','mari','mmz18', '01724748V', 1 ,true);
  PRUEBAS_CONCESIONARIO.ACTUALIZAR('Con-9/Update-"Concesionario= prueba"                    /Commit-->',cod_conces,'Con','calle',756493498,'prueba@prueba.com',1,true);
  PRUEBAS_CONCESIONARIO.ELIMINAR('Con-10/Delete-"Concesionario = prueba"                  /Commit-->',cod_conces,true);
  select id_conces into prueba_conces2 from vehiculos where matricula = '1356JBK';
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Prueba sobre ID del concesionario al eliminar el concesionario el id_conces (Vehiculo) actualiza a null'||CR_LF);
  
  DBMS_OUTPUT.PUT_LINE(prueba_conces || '     - >  Valor del id:concesionario (1356JBK) despues de borrar el concesionario');
  DBMS_OUTPUT.PUT_LINE(prueba_conces2 || '      - >  Valor del id:concesionario (1356JBK) despues de borrar el concesionario');



  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA TIPOPROPIEDADES 
  **********************************************************************/
  
  PRUEBAS_TIPOPROPIEDADES.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de TipoPropiedades (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-01/Insert-"TipoPropiedades=Llanta"                /Commit  --> ','Llanta',true);
  cod_tpro := seq_tipopropiedades.currval-1;
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-02/Insert-"TipoPropiedades=T1"                    /Commit  --> ','Color Carrocería',true);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-03/Insert-"TipoPropiedades=T2"                    /Commit  --> ','Nº Puertas',true);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-04/Insert-"TipoPropiedades=T3"                    /Commit  --> ','Cámra Trasera',true);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-05/Insert/"TipoPropiedades=Null"                  /Rollback--> ',null,false);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-05/Insert/"TipoPropiedades=Null"                  /Rollback--> ',null,false);
  PRUEBAS_TIPOPROPIEDADES.ACTUALIZAR('Tpro-06/Update/"TipoPropiedades=Llantas"               /Commit  --> ',cod_tpro,'Llantas',true);
  PRUEBAS_TIPOPROPIEDADES.ACTUALIZAR('Tpro-07/Update/"TipoPropiedades=Null"                  /Rollback--> ',cod_tpro,null,false);
  PRUEBAS_TIPOPROPIEDADES.ELIMINAR  ('Tpro-08/Delete/"TipoPropiedades=Llantas"               /Commit  --> ',cod_tpro,true);
  
 


  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA VEHICULOS
  **********************************************************************/
  
  
  PRUEBAS_VEHICULOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de Vehiculos (CÓdigo Prueba/AcciÓn/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-01/Insert-"Vehiculos=Prueba"                          /Commit  --> ','2286JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,2,w_cod+1,true);
  cod_veh := seq_vehiculos.currval-1;
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-02/Insert-"Vehiculos=V1"                              /Commit  --> ','2356JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,2,w_cod+1,true);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-03/Insert-"Vehiculos=V2"                              /Commit  --> ','2386JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Blanco','Retrovisor exterior ......',9040,1,2,w_cod+2,true);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-03/Insert-"Trigger Vehiculo>3 asignado mismo conc"    /Rollback--> ','2386JBM',TO_DATE(SYSDATE),
  'Citroen C3 HDI Blanco','Retrovisor exterior ......',9040,1,2,w_cod+2,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-04/Insert/"Vehiculos.MatriculoDuplicada=2356JBK"      /Rollback--> ','2356JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,2,w_cod+1,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-05/Insert/"Vehiculos.Matricula=Null"                  /Rollback--> ',null,TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,2,w_cod+1,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-06/Insert/"Vehiculos.fechaAlta=Null"                  /Rollback--> ','2357JBK',null, 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,2,w_cod+1,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-07/Insert/"Vehiculos.Nombre=Null"                     /Rollback--> ','2358JBK',TO_DATE(SYSDATE), 
  null,'Retrovisor exterior ......',10040,1,2,w_cod,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-08/Insert/"Vehiculos.Precio=Null"                     /Rollback--> ','2359JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',null,1,2,w_cod+1,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-09/Insert/"Vehiculos.Disponible=Null"                 /Rollback--> ','2355JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,null,2,w_cod+1,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-09/Insert/"Trigger Precio Maximo>20000"               /Rollback--> ','2355JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',20100,1,2,w_cod+1,false);
  PRUEBAS_VEHICULOS.ACTUALIZAR('Veh-10/Update/"Vehiculos=2356JBM"                         /Commit  --> ',cod_veh,'2356JBM',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,3,w_cod+1,true);
  PRUEBAS_VEHICULOS.ELIMINAR  ('Veh-11/Delete/"Vehiculos=Prueba"                          /Commit  --> ',cod_veh,true);
  
  
  
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROPIEDADES 
  **********************************************************************/
  
  PRUEBAS_PROPIEDADES.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de Propiedades (Código Prueba/Acción/Título Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"Propiedades=Morad"                      /Commit  --> ',cod_tpro+1,'Morad',true);
  cod_pro := seq_propiedades.currval-1;
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"Propiedades=P1"                         /Commit  --> ',cod_tpro+1,'Negro',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"Propiedades=P2"                         /Commit  --> ',cod_tpro+1,'Blanco',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"Propiedades=P3"                         /Commit  --> ',cod_tpro+2,'3 Puertas',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"Propiedades=P4"                         /Commit  --> ',cod_tpro+3,'Si',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-02/Insert/"Propiedades=Null"                       /Rollback--> ',cod_tpro+1,null,false);
  PRUEBAS_PROPIEDADES.ACTUALIZAR('Pro-03/Update/"Propiedades=Morado"                     /Commit  --> ',cod_pro,'Morado',true);
  PRUEBAS_PROPIEDADES.ACTUALIZAR('Pro-04/Update/"Propiedades=Null"                       /Rollback--> ',cod_pro,null,false);
  PRUEBAS_PROPIEDADES.ELIMINAR  ('Pro-05/Delete/"TipoPropiedades=Morado"                 /Commit  --> ',cod_pro,true);
  
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROPIEDADES-VEHICULOS 
  **********************************************************************/
  
  PRUEBAS_PROPIEDADESVEHICULOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de PropiedadesVehiculos (Código Prueba/Acción/Título Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-01/Insert-"PropiedadesVehiculos=PV1-4"                 /Commit  --> ',cod_tpro+3,5,cod_veh+1,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-02/Insert-"PropiedadesVehiculos=PV1-1"                 /Commit  --> ',cod_tpro+1,3,cod_veh+1,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-03/Insert-"PropiedadesVehiculos=PV2-2"                 /Commit  --> ',cod_tpro+1,3,cod_veh+2,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-04/Insert-"PropiedadesVehiculos=PV1-3"                 /Commit  --> ',cod_tpro+2,4,cod_veh+1,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-05/Insert-"PropiedadesVehiculos=PV2-3"                 /Commit  --> ',cod_tpro+2,4,cod_veh+2,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-06/Insert-"PropiedadesVehiculos=PV2-4"                 /Commit  --> ',cod_tpro+3,5,cod_veh+2,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-07/Insert/"PropiedadesVehiculos=Null"                  /Rollback--> ',cod_tpro+1,5,null,false);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-07/Insert/"PropiedadesVehiculos=Duplicado-PV2-2"       /Rollback--> ',cod_tpro+1,3,cod_veh+2,false);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-07/Insert/"PropiedadesVehiculos=Tigger-1.7"            /Rollback--> ',cod_tpro+1,2,cod_veh+1,false);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-07/Insert/"PropiedadesVehiculos=Null"                  /Rollback--> ',cod_tpro+1,null,cod_veh+1,false);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-07/Insert/"PropiedadesVehiculos=Null"                  /Rollback--> ',null,2,cod_veh+1,false);
  PRUEBAS_PROPIEDADESVEHICULOS.ACTUALIZAR('ProV-08/Update/"PropiedadesVehiculos=PV1-2"                 /Commit  --> ',cod_tpro+1,2,cod_veh+1,true);
  PRUEBAS_PROPIEDADESVEHICULOS.ACTUALIZAR('ProV-09/Update/"PropiedadesVehiculos=Null"                  /Rollback--> ',cod_tpro+1,2,null,false);
  PRUEBAS_PROPIEDADESVEHICULOS.ACTUALIZAR('ProV-09/Update/"PropiedadesVehiculos=Null"                  /Rollback--> ',null,2,cod_veh+1,false);
  PRUEBAS_PROPIEDADESVEHICULOS.ACTUALIZAR('ProV-10/Update/Delete/"PropiedadesVehiculos=PV1-4"          /Commit  --> ',cod_tpro+3,0,cod_veh+1,true);
  
  
  


  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA FINANCIACIONES
  **********************************************************************/
  
  
  PRUEBAS_FINACIACIONES.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de TipoPropiedades (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_FINACIACIONES.INSERTAR  ('Tfin-01/Insert-"Financiacion=Psa"                   /Commit  --> ','PSA 10 años',1000,true);
  cod_fin := seq_financiaciones.currval-1;
  PRUEBAS_FINACIACIONES.INSERTAR  ('Tfin-02/Insert-"Financiacion=F1"                    /Commit  --> ','PSA 3 años',1000,true);
  PRUEBAS_FINACIACIONES.INSERTAR  ('Tfin-01/Insert-"Financiacion=F2"                    /Commit  --> ','PSA 8 años',1000,true);
  PRUEBAS_FINACIACIONES.INSERTAR  ('Tfin-05/Insert/"Financiacion=Null"                  /Rollback--> ',null,1000,false);
  PRUEBAS_FINACIACIONES.INSERTAR  ('Tfin-06/Insert/"Financiacion=Null"                  /Rollback--> ','PSA 5 años',null,false);
  PRUEBAS_FINACIACIONES.ACTUALIZAR('Tfin-07/Update/"Financiacion=PSA 5 años"            /Commit  --> ',cod_fin,'PSA 5 años',1000,true);
  PRUEBAS_FINACIACIONES.ACTUALIZAR('Tfin-08/Update/"Financiacion=Null"                  /Rollback--> ',cod_fin,null,1000,false);
  PRUEBAS_FINACIACIONES.ELIMINAR  ('Tfin-09/Delete/"Financiacion=PSA 5 años"            /Commit  --> ',cod_fin,true);
  
 
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROPIEDADES-VEHICULOS 
  **********************************************************************/
  
  PRUEBAS_DESCUENTOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de PropiedadesVehiculos (Código Prueba/Acción/Título Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-01/Insert-"Descuento=D0"                  /Commit  --> ',3,500,cod_veh+2,true);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-01/Insert-"Descuento=D1"                  /Commit  --> ',2,300,cod_veh+1,true);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-02/Insert-"Descuento=D2"                  /Commit  --> ',2,300,cod_veh+2,true);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-02/Insert-"Descuento=RN-1.10"             /Rollback--> ',3,1100,cod_veh+1,false);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-02/Insert-"Descuento=RN-1.10"             /Rollback--> ',3,940,cod_veh+2,false);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-03/Insert-"Descuento=D3"                  /Commit  --> ',3,300,cod_veh+1,true);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-07/Insert/"Descuento=Null"                /Rollback--> ',2,5,null,false);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-07/Insert/"Descuento=Null"                /Rollback--> ',2,null,cod_veh+1,false);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-07/Insert/"Descuento=Null"                /Rollback--> ',null,2,cod_veh+1,false);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-08/Update/"Descuento=D1-1 200"            /Commit  --> ',3,200,cod_veh+1,true);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-09/Update/"Descuento=RN-1.10"             /Rollback--> ',3,1100,cod_veh+1,false);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-09/Update/"Descuento=RN-1.10"             /Rollback--> ',2,950,cod_veh+2,false);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-09/Update/"Descuento=Null"                /Rollback--> ',2,2,null,false);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-09/Update/"Descuento=Null"                /Rollback--> ',null,2,cod_veh+1,false);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-10/Delete/"Descuento=D1-4"                /Commit  --> ',3,0,cod_veh+2,true);
  
 
/*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA FINANCIACION 
  **********************************************************************/
  
  PRUEBAS_FOTOVEHICULOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de TipoPropiedades (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-01/Insert-"FotoVehiculo=Ft0"                /Commit  --> ',cod_veh+1,4,true);
  cod_ft := seq_fotovehiculos.currval-1;
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-01/Insert-"FotoVehiculo=Ft1"                /Commit  --> ',cod_veh+1,1,true);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-01/Insert-"FotoVehiculo=Ft2"                /Commit  --> ',cod_veh+1,2,true);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-01/Insert-"FotoVehiculo=Ft3"                /Commit  --> ',cod_veh+2,1,true);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-01/Insert-"FotoVehiculo=Ft4"                /Commit  --> ',cod_veh+2,2,true);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-05/Insert/"FotoVehiculo=Null"               /Rollback--> ',cod_veh+2,null,false);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-05/Insert/"FotoVehiculo=Null"               /Rollback--> ',null,2,false);
  PRUEBAS_FOTOVEHICULOS.ACTUALIZAR('FotV-06/Update/"FotoVehiculo=Posicion 3"         /Commit  --> ',cod_ft,3,true);
  PRUEBAS_FOTOVEHICULOS.ACTUALIZAR('FotV-07/Update/"FotoVehiculo=Null"               /Rollback--> ',cod_ft,null,false);
  PRUEBAS_FOTOVEHICULOS.ELIMINAR  ('FotV-08/Delete/"FotoVehiculo=Ft0"                /Commit  --> ',cod_ft,true);
  
 
  
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA CLIENTES
  **********************************************************************/
  
 PRUEBAS_CLIENTE.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de CLIENTES (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_CLIENTE.INSERTAR  ('Cli-01/Insert-"Clientes=Prueba"                           /Commit  --> ','pruebain@gmail.com','66606660w',
  'Juan',999999999,666666666,TO_DATE('12/12/2012'),true);
  COD_CLI := seq_cliente.currval-1;
  PRUEBAS_CLIENTE.INSERTAR('Cli-02/Insert-"Clientes = C2"                               /Commit -->','prueba@gmail.com','23456789Z',
  'Roberto',986346798,686346798,TO_DATE('26/4/1998'),true);
  PRUEBAS_CLIENTE.INSERTAR('Cli-04/Insert-"Clientes= email duplicado"                   /Rollback-->','prueba@gmail.com','66606760T','Ju@n',
  666606666,999909999,TO_DATE('12/2/2012'),false);
  PRUEBAS_CLIENTE.INSERTAR('Cli-05/insert-"Clientes= dni duplicado"                     /Rollback-->','nonono@tman.com','23456789Z','Ju@n',
  666606666,999909999,TO_DATE('12/2/2012'),false);
   PRUEBAS_CLIENTE.INSERTAR('Cli-06/insert-"Clientes= email null"                       /Rollback-->',null,'66609660T','Ju@n',
  666606666,999909999,TO_DATE('12/2/2012'),false);
  PRUEBAS_CLIENTE.INSERTAR('Cli-07/insert-"Clientes= dni null"                          /Rollback-->','no@tman.com',null,'Ju@n',
  666606666,999909999,TO_DATE('12/2/2012'),false);
  PRUEBAS_CLIENTE.INSERTAR('Cli-08/insert-"Clientes= nombre null"                       /Rollback-->','no1@tman.com','12345678W',null,
  666606666,999909999,TO_DATE('12/2/2012'),false);
  PRUEBAS_CLIENTE.INSERTAR('Cli-09/insert-"Clientes= movil null"                        /Rollback-->','no2@tman.com','12345671W','joan',
  null,999909999,TO_DATE('12/2/2012'),false);
  PRUEBAS_CLIENTE.INSERTAR('Cli-010/insert-"Clientes= telef null"                        /Rollback-->','no3@tman.com','12345672W','joan',
  675644327,null,TO_DATE('12/2/2012'),false); 
  PRUEBAS_CLIENTE.INSERTAR('Cli-011/insert-"Clientes= fecha null"                        /Rollback-->','no4@tman.com','12345673W','joan',
  675644327,999909999,null,false);
  PRUEBAS_CLIENTE.ACTUALIZAR('Cli-012/Update-"Clientes= Cliente 1"                       /Commit-->',cod_cli,'actualizacion@btman.com','68607660w',
  'Juan',666666666,999999999,TO_DATE('12/12/2012'),true);
  PRUEBAS_CLIENTE.ELIMINAR('Cli-013/Delete-"Clientes= Cliente 1"                         /Commit-->',cod_cli,true);
  
  
 
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA CITAS
  **********************************************************************/
  
  PRUEBAS_CITAS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de Citas (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_CITAS.INSERTAR('Cit-01/insert-"Cita = prueba"                                 /Commit-->',TO_DATE('9/1/2019'),12,2,2,true);
  cod_cit := seq_citas.currval-1;
  PRUEBAS_CITAS.INSERTAR('Cit-02/insert-"Cita = C1"                                     /Commit-->',TO_DATE('26/11/2018'),16,2,2,true);
  PRUEBAS_CITAS.INSERTAR('Cit-03/insert-"Cita= fecha null"                              /Rollback-->',null,10,null,null,false);
  PRUEBAS_CITAS.INSERTAR('Cit-04/insert-"Cita= Hora null"                               /Rollback-->',TO_DATE('12/12/2020'),null,null,null,false);
  PRUEBAS_CITAS.INSERTAR('Cit-04/insert-"Cita= Hora diferente de 10,12,16,18"           /Rollback-->',TO_DATE('12/12/2020'),11,null,null,false);
  PRUEBAS_CITAS.ACTUALIZAR('Cit-04/update-"Cita=prueba actualizar"                      /Commit-->',cod_cit,TO_DATE('12/12/2002'),10,2,2,true);
  PRUEBAS_CITAS.ELIMINAR('Cit-05/Delete-"Cita=prueba delete"                            /Commit-->', cod_cit,true);
 
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA EMPLEADOS
  **********************************************************************/
 
  PRUEBAS_EMPLEADOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de EMPLEADOS (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-01/Insert-"Empleados=E1"                              /Commit  --> ','Manuel Marín','Administrativo ','manumr','manu100385', '32096400Y', 2 ,true);
  cod_empleados:= seq_empleados.currval-1;
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-01/Insert-"Empleados=E2"                              /Commit -->','Rosa Márquez','Jefa de Marketing ','rosmar','1904m', '48592056B', 2 ,true);
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-02/Insert-"Empleados=E3"                              /Commit -->','María Martínez ','Jefa de Ventas ','marimar','mmz1889', '01724748R', 2 ,true);
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-03/Insert-"Empleados= nombre null"                    /Rollback-->',null,'Jefa de Ventas ','marimar','mmz1889', '01724748R', 2 ,false);
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-04/Insert-"Empleados= rol null"                       /Rollback-->','María Martínez ',null,'marimar','mmz1889', '01724748R', 2 ,false);
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-05/Insert-"Empleados= usuario null"                   /Rollback-->','María Martínez ','Jefa de Ventas ',null,'mmz1889', '01724748R', 2 ,false);
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-06/Insert-"Empleados= contraseña null"                /Rollback-->','María Martínez ','Jefa de Ventas ','marimar',null, '01724748R', 2 ,false);
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-07/Insert-"Empleados= dni null"                       /Rollback-->','María Martínez ','Jefa de Ventas ','marimar','mmz1889', null, 2 ,false);
  PRUEBAS_EMPLEADOS.INSERTAR('Emp-08/Insert-"Empleados= id_conces null"                 /Rollback-->','María Martínez ','Jefa de Ventas ','marimar','mmz1889', '01724748R', null ,false);
  PRUEBAS_EMPLEADOS.ACTUALIZAR('Emp-09/Update-"Empleados=E1"                            /Commit-->',cod_empleados,'Manuel Marín','Jefe de Administración ','manumr','manu100385', '32096400Y',true);
  PRUEBAS_EMPLEADOS.ELIMINAR('Emp-10/Delete-"Empleados=E1"                              /Commit-->',cod_empleados,true);
  
  
   /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA METAVEHICULOS
  **********************************************************************/
 
   PRUEBAS_METAVEHICULOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de METAVEHICULOS (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_METAVEHICULOS.INSERTAR  ('MeT-01/Insert-"Metavehiculos=M1"                              /Commit  --> ','citroën en  sevilla','citroen c3 ocasion en sevilla ','ocasionurl', 3,true);
  cod_metaveh:= seq_metavehiculos.currval-1;
  PRUEBAS_METAVEHICULOS.INSERTAR('MeT-02/Insert-"Metavehiculos = M2"                              /Commit -->','citroën  ocasion  de 2018 en  sevilla terry ocasion  ','citroen c3 ocasion  ','ocasiojbvnurl',4,true);
  PRUEBAS_METAVEHICULOS.INSERTAR('MeT-03/Insert-"Metavehiculos = Id vehículo duplicado"           /Commit -->','honda  ocasion en  sevilla  ','honda civic ocasion en conceionario terryocasion  ','ocasioncivicurl',3,false);
  PRUEBAS_METAVEHICULOS.INSERTAR('MeT-04/Insert-"Metavehiculos= metatitulo null"                  /Rollback-->',null ,'honda civic ocasion en conceionario terryocasion ','ocasioncivicurl',4,false);
  PRUEBAS_METAVEHICULOS.INSERTAR('MeT-05/Insert-"Metavehiculos= metadescripcion null"             /Rollback-->','honda  ocasion en  ttesevilla' ,null ,'ocasionerecivicurl',4 ,false);
  PRUEBAS_METAVEHICULOS.INSERTAR('MeT-05/Insert-"Metavehiculos= urlamigable null"                 /Rollback-->','honda  ocasion en  ttesevilla' ,'honda civic ojghghfdvdcasion en conceionario terryocasion' , null,4,false);
  PRUEBAS_METAVEHICULOS.ACTUALIZAR('MeT-05/Update-"Metavehiculos=M4"                              /Commit-->',cod_metaveh,'citroën en  sevilla','citroen c3 ocasion en sevilla ','ocasionurl',true);
  PRUEBAS_METAVEHICULOS.ELIMINAR('MeT-06/Delete-"Metavehiculos=M4"                                /Commit-->',cod_metaveh,true);
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA METATIPOS
  **********************************************************************/
 
  PRUEBAS_METATIPOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de METATIPOS (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_METATIPOS.INSERTAR  ('MeT-01/Insert-"Metatipos=MET1"                              /Commit  --> ','Venta de vehículos urbanos en  sevilla','Venta de los mejores vehículos de ocasión urbanos en Sevilla ','vehiculos-ocasion-urbanos', 2 ,true);
  cod_metatip:= seq_metatipos.currval-1;
  PRUEBAS_METATIPOS.INSERTAR('MeT-02/Insert-"Metatipos = MET2"                              /Commit -->','Venta de vehículos industriales ','Tu vehículo industrial al mejor precio en terry ocasion  ','vehiculos-ocasion-industriales',3,true);
  PRUEBAS_METATIPOS.INSERTAR('MeT-03/Insert-"Metatipos = MET3"                              /Commit -->','Venta de Monovolumen en Sevilla ','Gran variadad de vehículos Monovolumen en Terry Ocasión  ','vehiculos-ocasion-monovolumen',3,false);
  PRUEBAS_METATIPOS.INSERTAR('MeT-04/Insert-"Metatipos= metatitulo null"                    /Rollback-->',null ,'Venta de los mejores vehículos de ocasión urbanos en Sevilla ','vehiculos-ocasion-urbanos', 4 ,false);
  PRUEBAS_METATIPOS.INSERTAR('MeT-05/Insert-"Metatipos= metadescripcion null"               /Rollback-->','Venta de vehículos urbanos en  sevilla' ,null ,'vehiculos-ocasion-urbanos',5 ,false);
  PRUEBAS_METATIPOS.INSERTAR('MeT-05/Insert-"Metatipos= urlamigable null"                   /Rollback-->','Venta de vehículos urbanos en  sevilla' ,'Venta de los mejores vehículos de ocasión urbanos en Sevilla' , null, 6, false);
  PRUEBAS_METATIPOS.ACTUALIZAR('MeT-05/Update-"Metatipos=MET1"                              /Commit-->',cod_metatip,'Monovolumen en Sevilla','Monovolumen al mejor precio en Terry Ocasión tu concesionario de confianza ','vehiculos-ocasion-monovolumen',true);
  PRUEBAS_METATIPOS.ELIMINAR('MeT-06/Delete-"Metatipos=MET1"                                /Commit-->',cod_metatip,true);
  END;
  /
   
  
  --Prueba Muestra los coches vendidos entre el 20 de Diciembre de 2017 y 20 de Enero de 2019 Devuelve(ID:1 e ID:2)
  
  select obtener_veh_vend_fechas(TO_DATE('2017-12-20', 'YYYY-MM-DD'),TO_DATE('2019-12-20', 'YYYY-MM-DD'))
  from dual;
  
  /* RF-4.7:Información número de vehículos en concesionario */
  select obtener_veh_estancados(TO_DATE('2019-12-20 19:28:24', 'YYYY-MM-DD HH24:MI:SS'))
  from dual;
                                        
  select obtener_num_veh_en_cons(2) from dual;
