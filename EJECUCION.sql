SET SERVEROUTPUT ON;

DECLARE
  cod_tpro INTEGER;
  CR_LF CHAR(2) := CHR(13)||CHR(10); 
BEGIN

  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA TIPOPROPIEDADES 
  **********************************************************************/
  PRUEBAS_TIPOPROPIEDADES.INICIALIZAR;
  DBMS_OUTPUT.PUT_LINE(CR_LF||'Pruebas sobre tabla de TipoPropiedades (Código Prueba/Acción/Título Prueba/Punto de Sincronismo esperado-->Resultado!)'||CR_LF);
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-01/Insert-"TipoPropiedades=Llanta"                         /Commit  --> ','Llanta',true);
  cod_tpro := seq_tipopropiedades.currval;
  PRUEBAS_TIPOPROPIEDADES.INSERTAR  ('Tpro-02/Insert/"TipoPropiedades=Null"                              /Rollback--> ',null,false);
  PRUEBAS_TIPOPROPIEDADES.ACTUALIZAR('Tpro-03/Update/"TipoPropiedades=Llantas"                        /Commit  --> ',cod_tpro,'Llantas',true);
  PRUEBAS_TIPOPROPIEDADES.ACTUALIZAR('Tpro-04/Update/"TipoPropiedades=Null"                              /Rollback--> ',cod_tpro,null,false);
  PRUEBAS_TIPOPROPIEDADES.ELIMINAR  ('Tpro-05/Delete/"TipoPropiedades=Llantas"                        /Commit  --> ',cod_tpro,true);
  insertar_tipo_propiedades('Puertas');
  insertar_tipo_propiedades('Color');
  insertar_tipo_propiedades('Combustible');
  insertar_tipo_propiedades('Etiqueta Eficiencia');
  
  END;