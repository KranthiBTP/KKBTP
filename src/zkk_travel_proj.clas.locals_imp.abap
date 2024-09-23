CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS augment_create FOR MODIFY
      IMPORTING entities FOR CREATE Travel.

    METHODS precheck_create FOR PRECHECK
      IMPORTING entities FOR CREATE Travel.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD augment_create.

  data:travel_create type TABLE FOR create zkk_travel_root.

  travel_create = CORRESPONDING #( entities ).

  loop at travel_create ASSIGNING FIELD-SYMBOL(<travel>).

     <travel>-AgencyId = '70003'.
    <travel>-OverallStatus = 'O'.
    <travel>-%control-AgencyId = if_abap_behv=>mk-on.
    <travel>-%control-OverallStatus = if_abap_behv=>mk-on.

  ENDLOOP.

  MODIFY augmenting ENTITIES OF zkk_travel_root
  ENTITY travel
  create from travel_create.

  ENDMETHOD.

  METHOD precheck_create.
  ENDMETHOD.

ENDCLASS.
