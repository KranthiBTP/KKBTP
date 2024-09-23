CLASS zcl_global_localtypes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  data:itab type TABLE of string.

    INTERFACES if_oo_adt_classrun .

  METHODS reach_to_mars.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GLOBAL_LOCALTYPES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.


  METHOD reach_to_mars.
  DATA lv_text type string.

  Data(lo_earth) = NEW ZCL_EARTH( ).
  DATA(lo_planet1) = NEW ZCL_PLANET1( ).
  DATA(lo_mars) = NEW ZCL_MARS( ).

  lv_text = lo_earth->start_engine(  ).
  APPEND lv_text to itab.
  lv_text = lo_earth->leave_orbit( ).
  APPEND lv_text to itab.

  lv_text = lo_planet1->enter_orbit(  ).


  ENDMETHOD.
ENDCLASS.
