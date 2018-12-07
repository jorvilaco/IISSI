SET SERVEROUTPUT ON;

DECLARE
  cod_tpro INTEGER;
  cod_veh INTEGER;
  CR_LF CHAR(2) := CHR(13)||CHR(10); 
BEGIN

  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA TIPOPROPIEDADES 
  **********************************************************************/
  PRUEBAS_TIPOPROPIEDADES.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de TipoPropiedades (Código Prueba/Acción/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-01/Insert-"TipoPropiedades=Llanta"                /Commit  --> ','Llanta',true);
  cod_tpro := seq_tipopropiedades.currval;
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-01/Insert-"TipoPropiedades=T1"                    /Commit  --> ','Color Carrocería',true);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-01/Insert-"TipoPropiedades=T2"                    /Commit  --> ','Nº Puertas',true);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-01/Insert-"TipoPropiedades=T3"                    /Commit  --> ','Cámra Trasera',true);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-02/Insert/"TipoPropiedades=Null"                  /Rollback--> ',null,false);
  PRUEBAS_TIPOPROPIEDADES.ACTUALIZAR('Tpro-03/Update/"TipoPropiedades=Llantas"               /Commit  --> ',cod_tpro,'Llantas',true);
  PRUEBAS_TIPOPROPIEDADES.ACTUALIZAR('Tpro-04/Update/"TipoPropiedades=Null"                  /Rollback--> ',cod_tpro,null,false);
  PRUEBAS_TIPOPROPIEDADES.ELIMINAR  ('Tpro-05/Delete/"TipoPropiedades=Llantas"               /Commit  --> ',cod_tpro,true);
 

  
  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA VEHICULOS
  **********************************************************************/
  
  
  PRUEBAS_VEHICULOS.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de Vehiculos (CÓdigo Prueba/AcciÓn/T�tulo Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_VEHICULOS.INSERTAR  ('Tpro-01/Insert-"Vehiculos=Prueba"                           /Commit  --> ','2286JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,true);
  cod_veh := seq_vehiculos.currval;
  PRUEBAS_VEHICULOS.INSERTAR  ('Tpro-01/Insert-"Vehiculos=V1"                               /Commit  --> ','2356JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,true);
  PRUEBAS_VEHICULOS.INSERTAR  ('Tpro-01/Insert-"Vehiculos=V2"                               /Commit  --> ','2386JBK',TO_DATE(SYSDATE),
  'Citroen C3 HDI Blanco','Retrovisor exterior ......',9040,1,null,null,true);
  PRUEBAS_VEHICULOS.INSERTAR  ('Tpro-02/Insert/"Vehiculos.MatriculoDuplicada=2356JBK"       /Rollback--> ','2356JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Tpro-02/Insert/"Vehiculos.Matricula=Null"                   /Rollback--> ',null,TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Tpro-02/Insert/"Vehiculos.fechaAlta=Null"                   /Rollback--> ','2356JBK',null, 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Tpro-02/Insert/"Vehiculos.Nombre=Null"                      /Rollback--> ','2356JBK',TO_DATE(SYSDATE), 
  null,'Retrovisor exterior ......',10040,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Tpro-02/Insert/"Vehiculos.Precio=Null"                      /Rollback--> ','2356JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',null,1,null,null,false);
  PRUEBAS_VEHICULOS.INSERTAR  ('Tpro-02/Insert/"Vehiculos.Disponible=Null"                  /Rollback--> ','2356JBK',TO_DATE(SYSDATE), 
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,null,null,null,false);
  PRUEBAS_VEHICULOS.ACTUALIZAR('Tpro-03/Update/"Vehiculos=2356JBM"                          /Commit  --> ',cod_veh,'2356JBM',TO_DATE(SYSDATE),
  'Citroen C3 HDI Negro','Retrovisor exterior ......',10040,1,null,null,true);
  --eliminar_vehiculos(cod_veh);
  PRUEBAS_VEHICULOS.ELIMINAR  ('Tpro-05/Delete/"Vehiculos=Prueba"                           /Commit  --> ',cod_veh,true);
  
  
  END;