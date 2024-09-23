CLASS zcl_kk_ve_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

"   INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KK_VE_CALC IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

  Check not it_original_data is INITIAL.
  data: lt_calc_data type STANDARD TABLE OF zkk_travel_proj_processor with default key,
        lv_rate type p decimals 2 value '0.025'.

        lt_calc_data = CORRESPONDING #( it_original_data ).

        loop at lt_calc_data ASSIGNING FIELD-SYMBOL(<fs_calc>).
        <fs_calc>-CO2Tax = <fs_calc>-TotalPrice * lv_rate.

       cl_scal_utils=>date_compute_day(
         EXPORTING
           iv_date           =  <fs_calc>-BeginDate
        IMPORTING
*           ev_weekday_number =
           ev_weekday_name   = Data(lv_day)
       ).
        <fs_calc>-dayOffTheFlight = lv_day.

        ENDLOOP.

        ct_calculated_data = CORRESPONDING #( lt_calc_data ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
