/************************************************************************
                        PROCEDURE
*************************************************************************/


create or replace procedure /*nombre procedure   insertar_descuento  */
    (/*entrada de datos*   id_fin in descuentos.nombre%type  */)is
    begin 
    
    delete from /*tabla descuento  */ where /*condición cod_pro = id_pro */;
    commit work;
    end /*nombre procedure insertar_descuento  */;
    /
