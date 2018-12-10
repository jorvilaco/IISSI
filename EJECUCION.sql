SET SERVEROUTPUT ON;

DECLARE
  cod_tpro INTEGER;
  cod_veh INTEGER;
  cod_pro INTEGER;
  CR_LF CHAR(2) := CHR(13)||CHR(10); 
BEGIN

  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA TIPOPROPIEDADES 
  **********************************************************************/
  
  PRUEBAS_TIPOPROPIEDADES.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de TipoPropiedades (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-01/Insert-"TipoPropiedades=Llanta"                /Commit  --> ','Llanta',true);
  cod_tpro := seq_tipopropiedades.currval;
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-02/Insert-"TipoPropiedades=T1"                    /Commit  --> ','Color Carrocería',true);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-03/Insert-"TipoPropiedades=T2"                    /Commit  --> ','Nº Puertas',true);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-04/Insert-"TipoPropiedades=T3"                    /Commit  --> ','Cámra Trasera',true);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-05/Insert/"TipoPropiedades=Null"                  /Rollback--> ',null,false);
  PRUEBAS_TIPOPROPIEDADES.ACTUALIZAR('Tpro-06/Update/"TipoPropiedades=Llantas"               /Commit  --> ',cod_tpro,'Llantas',true);
  PRUEBAS_TIPOPROPIEDADES.ACTUALIZAR('Tpro-07/Update/"TipoPropiedades=Null"                  /Rollback--> ',cod_tpro,null,false);
  PRUEBAS_TIPOPROPIEDADES.ELIMINAR  ('Tpro-08/Delete/"TipoPropiedades=Llantas"               /Commit  --> ',cod_tpro,true);
 

  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA VEHICULOS
  **********************************************************************/
  
  
  PRUEBAS_VEHICULOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de Vehiculos (CÓdigo Prueba/AcciÓn/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-01/Insert-"Vehiculos=Prueba"                           /Commit  --> ','2286JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,true);
  cod_veh := seq_vehiculos.currval;
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-02/Insert-"Vehiculos=V1"                               /Commit  --> ','2356JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,true);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-03/Insert-"Vehiculos=V2"                               /Commit  --> ','2386JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Blanco','Retrovisor exterior ......',9040,1,null,null,true);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-04/Insert/"Vehiculos.MatriculoDuplicada=2356JBK"       /Rollback--> ','2356JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-05/Insert/"Vehiculos.Matricula=Null"                   /Rollback--> ',null,TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-06/Insert/"Vehiculos.fechaAlta=Null"                   /Rollback--> ','2356JBK',null, 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-07/Insert/"Vehiculos.Nombre=Null"                      /Rollback--> ','2356JBK',TO_DATE(SYSDATE), 
  null,'Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-08/Insert/"Vehiculos.Precio=Null"                      /Rollback--> ','2356JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',null,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Veh-09/Insert/"Vehiculos.Disponible=Null"                  /Rollback--> ','2356JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,null,null,null,false);
  PRUEBAS_VEHICULOS.ACTUALIZAR('Veh-10/Update/"Vehiculos=2356JBM"                          /Commit  --> ',cod_veh,'2356JBM',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,true);
  --eliminar_vehiculos(cod_veh);
  PRUEBAS_VEHICULOS.ELIMINAR  ('Veh-11/Delete/"Vehiculos=Prueba"                           /Commit  --> ',cod_veh,true);
  
  
  
  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROPIEDADES 
  **********************************************************************/
  
  PRUEBAS_PROPIEDADES.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de Propiedades (Código Prueba/Acción/Título Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"TipoPropiedades=Morad"                 /Commit  --> ',2,'Morad',true);
  cod_pro := seq_propiedades.currval;
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"TipoPropiedades=P1"                    /Commit  --> ',2,'Negro',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"TipoPropiedades=P2"                    /Commit  --> ',2,'Blanco',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"TipoPropiedades=P3"                    /Commit  --> ',3,'3 Puertas',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-01/Insert-"TipoPropiedades=P4"                    /Commit  --> ',4,'Si',true);
  PRUEBAS_PROPIEDADES.INSERTAR  ('Pro-02/Insert/"TipoPropiedades=Null"                  /Rollback--> ',2,null,false);
  PRUEBAS_PROPIEDADES.ACTUALIZAR('Pro-03/Update/"TipoPropiedades=Morado"                /Commit  --> ',cod_pro,'Morado',true);
  PRUEBAS_PROPIEDADES.ACTUALIZAR('Pro-04/Update/"TipoPropiedades=Null"                  /Rollback--> ',cod_pro,null,false);
  PRUEBAS_PROPIEDADES.ELIMINAR  ('Pro-05/Delete/"TipoPropiedades=Morado"                /Commit  --> ',cod_pro,true);
  
  
  END;