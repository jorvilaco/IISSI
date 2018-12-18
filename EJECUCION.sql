SET SERVEROUTPUT ON;

DECLARE
  cod_ft Integer;
  cod_fin Integer;
  cod_tpro INTEGER;
  cod_veh INTEGER;
  cod_pro INTEGER;
  cod_cli INTEGER;
  cod_conces INTEGER;
  cod_cit INTEGER;
  CR_LF CHAR(2) := CHR(13)||CHR(10); 
BEGIN



 /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA CONCESIONARIOS
  **********************************************************************/
  
  
  PRUEBAS_CONCESIONARIO.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de Concesionario (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-01/insert-"Concesionario= prueba"                   /Commit-->','Con1','calle2',756493499,'prueba2@prueba1',11,true);
  cod_conces := seq_concesionario.currval-1;
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-02/insert-"Concesionario= C1"                       /Commit-->','Con2','calle3',756493496,'prueba2@prueba2',10,true);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-03/insert-"Concesionario= C2"                       /Commit-->','Con3','calle4',756493497,'prueba3@rueba3',9,true);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-04/insert-"Concesionario= nombre null"              /Rollback-->',null,'calle3',756493496,'prueba2@prueba2',10,false);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-05/insert-"Concesionario= calle null"               /Rollback-->','Con3',null,756493496,'prueba2@prueba2',10,false);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-06/insert-"Concesionario= telef null"               /Rollback-->','Con3','calle3',null,'prueba2@prueba2',10,false);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-07/insert-"Concesionario= email null"               /Rollback-->','Con3','calle3',756493496,null,10,false);
  PRUEBAS_CONCESIONARIO.INSERTAR('Con-08/insert-"Concesionario= NoCitas null"             /Rollback-->','Con3','calle3',756493496,'prueba2@prueba2',null,false);
  PRUEBAS_CONCESIONARIO.ACTUALIZAR('Con-9/Update-"Concesionario= prueba"                  /Commit-->',cod_conces,'Con','calle',756493498,'prueba@prueba.com',10,true);
  PRUEBAS_CONCESIONARIO.ELIMINAR('Con-10/Delete-"Concesionario = prueba"                  /Commit-->',cod_conces,true);



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
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,true);
  cod_veh := seq_vehiculos.currval-1;
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-02/Insert-"Vehiculos=V1"                              /Commit  --> ','2356JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,true);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-03/Insert-"Vehiculos=V2"                              /Commit  --> ','2386JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Blanco','Retrovisor exterior ......',9040,1,null,null,true);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-04/Insert/"Vehiculos.MatriculoDuplicada=2356JBK"      /Rollback--> ','2356JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-05/Insert/"Vehiculos.Matricula=Null"                  /Rollback--> ',null,TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-06/Insert/"Vehiculos.fechaAlta=Null"                  /Rollback--> ','2357JBK',null, 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-07/Insert/"Vehiculos.Nombre=Null"                     /Rollback--> ','2358JBK',TO_DATE(SYSDATE), 
  null,'Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-08/Insert/"Vehiculos.Precio=Null"                     /Rollback--> ','2359JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',null,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-09/Insert/"Vehiculos.Disponible=Null"                 /Rollback--> ','2355JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,null,null,null,false);
  PRUEBAS_VEHICULOS.ACTUALIZAR('Veh-10/Update/"Vehiculos=2356JBM"                         /Commit  --> ',cod_veh,'2356JBM',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,true);
  PRUEBAS_VEHICULOS.ELIMINAR  ('Veh-11/Delete/"Vehiculos=Prueba"                          /Commit  --> ',cod_veh,true);
  
  
  
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROPIEDADES 
  **********************************************************************/
  
  PRUEBAS_PROPIEDADES.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de Propiedades (Código Prueba/Acción/Título Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"Propiedades=Morad"                      /Commit  --> ',2,'Morad',true);
  cod_pro := seq_propiedades.currval-1;
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"Propiedades=P1"                         /Commit  --> ',2,'Negro',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"Propiedades=P2"                         /Commit  --> ',2,'Blanco',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"Propiedades=P3"                         /Commit  --> ',3,'3 Puertas',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"Propiedades=P4"                         /Commit  --> ',4,'Si',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-02/Insert/"Propiedades=Null"                       /Rollback--> ',2,null,false);
  PRUEBAS_PROPIEDADES.ACTUALIZAR('Pro-03/Update/"Propiedades=Morado"                     /Commit  --> ',cod_pro,'Morado',true);
  PRUEBAS_PROPIEDADES.ACTUALIZAR('Pro-04/Update/"Propiedades=Null"                       /Rollback--> ',cod_pro,null,false);
  PRUEBAS_PROPIEDADES.ELIMINAR  ('Pro-05/Delete/"TipoPropiedades=Morado"                 /Commit  --> ',cod_pro,true);
  
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROPIEDADES-VEHICULOS 
  **********************************************************************/
  
  PRUEBAS_PROPIEDADESVEHICULOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de PropiedadesVehiculos (Código Prueba/Acción/Título Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-01/Insert-"PropiedadesVehiculos=PV1-4"                 /Commit  --> ',4,5,2,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-02/Insert-"PropiedadesVehiculos=PV1-1"                 /Commit  --> ',2,3,2,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-03/Insert-"PropiedadesVehiculos=PV2-2"                 /Commit  --> ',2,3,3,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-04/Insert-"PropiedadesVehiculos=PV1-3"                 /Commit  --> ',3,4,2,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-05/Insert-"PropiedadesVehiculos=PV2-3"                 /Commit  --> ',3,4,3,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-06/Insert-"PropiedadesVehiculos=PV2-4"                 /Commit  --> ',4,5,3,true);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-07/Insert/"PropiedadesVehiculos=Null"                  /Rollback--> ',2,5,null,false);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-07/Insert/"PropiedadesVehiculos=Duplicado-PV2-2"       /Rollback--> ',2,3,3,false);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-07/Insert/"PropiedadesVehiculos=Tigger-1.7"            /Rollback--> ',2,2,2,false);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-07/Insert/"PropiedadesVehiculos=Null"                  /Rollback--> ',2,null,2,false);
  PRUEBAS_PROPIEDADESVEHICULOS.INSERTAR  ('ProV-07/Insert/"PropiedadesVehiculos=Null"                  /Rollback--> ',null,2,2,false);
  PRUEBAS_PROPIEDADESVEHICULOS.ACTUALIZAR('ProV-08/Update/"PropiedadesVehiculos=PV1-2"                 /Commit  --> ',2,2,2,true);
  PRUEBAS_PROPIEDADESVEHICULOS.ACTUALIZAR('ProV-09/Update/"PropiedadesVehiculos=Null"                  /Rollback--> ',2,2,null,false);
  PRUEBAS_PROPIEDADESVEHICULOS.ACTUALIZAR('ProV-09/Update/"PropiedadesVehiculos=Null"                  /Rollback--> ',null,2,2,false);
  PRUEBAS_PROPIEDADESVEHICULOS.ACTUALIZAR('ProV-10/Update/Delete/"PropiedadesVehiculos=PV1-4"          /Commit  --> ',4,0,2,true);
  
  
  


  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA FINANCIACIONES
  **********************************************************************/
  
  
  PRUEBAS_FINACIACIONES.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de TipoPropiedades (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_FINACIACIONES.INSERTAR  ('Tfin-01/Insert-"Financiacion=Psa"                   /Commit  --> ','PSA 10 años',1000,true);
  cod_fin := seq_financiaciones.currval-1;
  PRUEBAS_FINACIACIONES.INSERTAR  ('Tfin-02/Insert-"Financiacion=F1"                    /Commit  --> ','PSA 3 años',1000,true);
  PRUEBAS_FINACIACIONES.INSERTAR  ('Tfin-01/Insert-"Financiacion=F2"                   /Commit  --> ','PSA 8 años',1000,true);
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
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-01/Insert-"Descuento=D0"                  /Commit  --> ',3,500,3,true);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-01/Insert-"Descuento=D1"                  /Commit  --> ',2,300,2,true);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-02/Insert-"Descuento=D2"                  /Commit  --> ',2,300,3,true);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-02/Insert-"Descuento=RN-1.10"             /Rollback--> ',3,1100,2,false);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-02/Insert-"Descuento=RN-1.10"             /Rollback--> ',3,940,3,false);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-03/Insert-"Descuento=D3"                  /Commit  --> ',3,300,2,true);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-07/Insert/"Descuento=Null"                /Rollback--> ',2,5,null,false);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-07/Insert/"Descuento=Null"                /Rollback--> ',2,null,2,false);
  PRUEBAS_DESCUENTOS.INSERTAR  ('Desc-07/Insert/"Descuento=Null"                /Rollback--> ',null,2,2,false);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-08/Update/"Descuento=D1-1 200"            /Commit  --> ',3,200,2,true);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-09/Update/"Descuento=RN-1.10"             /Rollback--> ',3,1100,2,false);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-09/Update/"Descuento=RN-1.10"             /Rollback--> ',2,950,3,false);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-09/Update/"Descuento=Null"                /Rollback--> ',2,2,null,false);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-09/Update/"Descuento=Null"                /Rollback--> ',null,2,2,false);
  PRUEBAS_DESCUENTOS.ACTUALIZAR('Desc-10/Delete/"Descuento=D1-4"                /Commit  --> ',3,0,3,true);
  
 
/*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA FINANCIACION 
  **********************************************************************/
  
  PRUEBAS_FOTOVEHICULOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de TipoPropiedades (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-01/Insert-"FotoVehiculo=Ft0"                /Commit  --> ',2,4,true);
  cod_ft := seq_fotovehiculos.currval-1;
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-01/Insert-"FotoVehiculo=Ft1"                /Commit  --> ',2,1,true);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-01/Insert-"FotoVehiculo=Ft2"                /Commit  --> ',2,2,true);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-01/Insert-"FotoVehiculo=Ft3"                /Commit  --> ',3,1,true);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-01/Insert-"FotoVehiculo=Ft4"                /Commit  --> ',3,2,true);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-05/Insert/"FotoVehiculo=Null"               /Rollback--> ',2,null,false);
  PRUEBAS_FOTOVEHICULOS.INSERTAR  ('FotV-05/Insert/"FotoVehiculo=Null"               /Rollback--> ',null,2,false);
  PRUEBAS_FOTOVEHICULOS.ACTUALIZAR('FotV-06/Update/"FotoVehiculo=Posicion 3"         /Commit  --> ',cod_ft,3,true);
  PRUEBAS_FOTOVEHICULOS.ACTUALIZAR('FotV-07/Update/"FotoVehiculo=Null"               /Rollback--> ',cod_ft,null,false);
  PRUEBAS_FOTOVEHICULOS.ELIMINAR  ('FotV-08/Delete/"FotoVehiculo=Ft0"                /Commit  --> ',cod_ft,true);
  
 
  
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA CLIENTES
  **********************************************************************/
  
  PRUEBAS_CLIENTE.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de CLIENTES (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_CLIENTE.INSERTAR  ('Cli-01/Insert-"Clientes=Prueba"                           /Commit  --> ','nanana@batman.com','66606660w',
  'Juan',666666666,999999999,TO_DATE('12/12/2012'),true);
  COD_CLI := seq_cliente.currval-1;
  PRUEBAS_CLIENTE.INSERTAR('Cli-02/Insert-"Clientes = C2"                               /Commit -->','nonono@batman.com','66606660T',
  'Ju@n',666606666,999909999,TO_DATE('12/3/2012'),true);
  PRUEBAS_CLIENTE.INSERTAR('Cli-03/Insert-"Clientes = C3"                               /Commit -->','nununu@batman.com','66608660T',
  'Ju@n',666606666,999909999,TO_DATE('12/3/2012'),true);
  PRUEBAS_CLIENTE.INSERTAR('Cli-04/Insert-"Clientes= email duplicado"                   /Rollback-->','nonono@batman.com','66606760T','Ju@n',
  666606666,999909999,TO_DATE('12/2/2012'),false);
  PRUEBAS_CLIENTE.INSERTAR('Cli-05/insert-"Clientes= dni duplicado"                     /Rollback-->','nonono@tman.com','66606660T','Ju@n',
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
  PRUEBAS_CLIENTE.ACTUALIZAR('Cli-012/Update-"Clientes= Cliente 1"                       /Commit-->',cod_cli,'naasdasdasdnana@btman.com','68607660w',
  'Juan',666666666,999999999,TO_DATE('12/12/2012'),true);
  PRUEBAS_CLIENTE.ELIMINAR('Cli-013/Delete-"Clientes= Cliente 1"                         /Commit-->',cod_cli,true);
  
  
 
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA CITAS
  **********************************************************************/
  
  PRUEBAS_CITAS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de Citas (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_CITAS.INSERTAR('Cit-01/insert-"Cita = prueba"                                 /Commit-->',TO_DATE('12/12/2020'),12,2,3,true);
  cod_cit := seq_citas.currval-1;
  PRUEBAS_CITAS.INSERTAR('Cit-02/insert-"Cita = C1"                                     /Commit-->',TO_DATE('12/12/2018'),10,2,3,true);
  PRUEBAS_CITAS.INSERTAR('Cit-03/insert-"Cita= fecha null"                              /Rollback-->',null,10,null,null,false);
  PRUEBAS_CITAS.INSERTAR('Cit-04/insert-"Cita= Hora null"                               /Rollback-->',TO_DATE('12/12/2020'),null,null,null,false);
  PRUEBAS_CITAS.INSERTAR('Cit-04/insert-"Cita= Hora diferente de 10,12,16,18"           /Rollback-->',TO_DATE('12/12/2020'),11,null,null,false);
  PRUEBAS_CITAS.ACTUALIZAR('Cit-04/update-"Cita=prueba actualizar"                      /Commit-->',cod_cit,TO_DATE('12/12/2002'),10,2,3,true);
  PRUEBAS_CITAS.ELIMINAR('Cit-05/Delete-"Cita=prueba delete"                            /Commit-->', cod_cit,true);
  
  
   
  
  
  
  END;
  /
   select obtener_veh_vend_fechas(TO_DATE('2017-12-20 19:28:24', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2018-12-20 19:28:24', 'YYYY-MM-DD HH24:MI:SS'))
  from dual;
  
  /* RF-4.7:Información número de vehículos en concesionario */
  select obtener_veh_estancados(TO_DATE('2019-12-20 19:28:24', 'YYYY-MM-DD HH24:MI:SS'))
  from dual;
