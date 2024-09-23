CLASS zcl_kk_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    INTERFACES if_oo_adt_classrun .

    class-methods add_numbers IMPORTING value(a) type i
                                        value(b) type i
                              EXPORTING
                                         value(result) type i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KK_AMDP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  zcl_kk_amdp=>add_numbers(
    EXPORTING
      a      = 10
      b      = 20
    IMPORTING
     result =  data(lv_res)
  ).

  out->write(
    EXPORTING
      data   =  | The result of AMDP is ---> { lv_res }|
  ).

  ENDMETHOD.


  METHOD add_numbers BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY.

  DECLARE X integer;
  DECLARE y integer;

  X := a;
  y := b;
  result := :x + :y;


  ENDMETHOD.
ENDCLASS.
