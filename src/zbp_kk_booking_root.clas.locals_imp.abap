CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS earlynumbering_cba_Bookingsupp FOR NUMBERING
      IMPORTING entities FOR CREATE Booking\_Bookingsupplement.
    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateTotalPrice.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD earlynumbering_cba_Bookingsupp.

  data max_booking_suppl_id type /dmo/booking_supplement_id.

    ""Step 1: get all the travel requests and their booking data
    read ENTITIES OF zkk_travel_root in local mode
        ENTITY booking by \_BookingSupplement
        from CORRESPONDING #( entities )
        link data(booking_supplements).

*    ""Loop at unique travel ids
*    loop at entities ASSIGNING FIELD-SYMBOL(<booking_group>) GROUP BY <booking_group>-%tky.
*    ""Step 2: get the highest booking supplement number which is already there
*        loop at booking_supplements into data(ls_booking) using key entity
*            where source-TravelId = <booking_group>-TravelId and
*                  source-BookingId = <booking_group>-BookingId.
*                if max_booking_suppl_id < ls_booking-target-BookingId.
*                    max_booking_suppl_id = ls_booking-target-BookingId.
*                ENDIF.
*        ENDLOOP.
*    ""Step 3: get the asigned booking supplement numbers for incoming request
*        loop at entities into data(ls_entity) using key entity
*            where TravelId = <booking_group>-TravelId and
*                  BookingId = <booking_group>-BookingId.
*                loop at ls_entity-%target into data(ls_target).
*                    if max_booking_suppl_id < ls_target-BookingId.
*                        max_booking_suppl_id = ls_target-BookingId.
*                    ENDIF.
*                ENDLOOP.
*        ENDLOOP.
*    ""Step 4: loop over all the entities of travel with same travel id
*        loop at entities ASSIGNING FIELD-SYMBOL(<booking>)
*            USING KEY entity where TravelId = <booking_group>-TravelId and
*                                   BookingId = <booking_group>-BookingId..
*    ""Step 5: assign new booking IDs to the booking entity inside each travel
*            LOOP at <booking>-%target ASSIGNING FIELD-SYMBOL(<bookingsuppl_wo_numbers>).
*                append CORRESPONDING #( <bookingsuppl_wo_numbers> ) to mapped-booksuppl
*                ASSIGNING FIELD-SYMBOL(<mapped_bookingsuppl>).
*                if <mapped_bookingsuppl>-BookingSupplementId is INITIAL.
*                    max_booking_suppl_id += 1.
*                    <mapped_bookingsuppl>-BookingSupplementId = max_booking_suppl_id.
*                ENDIF.
*            ENDLOOP.
*        ENDLOOP.
*    ENDLOOP.


""Try with Reduce

Loop at entities ASSIGNING FIELD-SYMBOL(<booking_group2>) GROUP BY <booking_group2>-%key.

max_booking_suppl_id = REDUCE #( INIT max = CONV /dmo/booking_supplement_id( '0' )

                                         for booksuppl in booking_supplements
                                              where (  source-TravelId = <booking_group2>-TravelId
                                                 and   source-BookingId = <booking_group2>-BookingId )
                                  NEXT max = COND /dmo/booking_supplement_id(  when booksuppl-target-BookingSupplementId > max
                                                                                then booksuppl-target-BookingSupplementId
                                                                                else max )
                              ).

  max_booking_suppl_id = REDUCE #( INIT max = max_booking_suppl_id

                                   FOR entity in entities
                                                          where (  TravelId = <booking_group2>-TravelId
                                                          and Bookingid = <booking_group2>-BookingId )
                                   FOR target in entity-%target
                                   NEXT max = COND /dmo/booking_supplement_id(  when  target-BookingSupplementId > max
                                                                                  then target-BookingSupplementId
                                                                                  else max )
                                ).



ENDLOOP.

loop at entities ASSIGNING FIELD-SYMBOL(<booking2>)
            USING KEY entity where TravelId = <booking_group2>-TravelId and
                                   BookingId = <booking_group2>-BookingId..


 LOOP at <booking2>-%target ASSIGNING FIELD-SYMBOL(<bookingsuppl_wo_numbers2>).
                append CORRESPONDING #( <bookingsuppl_wo_numbers2> ) to mapped-booksuppl
                ASSIGNING FIELD-SYMBOL(<mapped_bookingsuppl2>).
                if <mapped_bookingsuppl2>-BookingSupplementId is INITIAL.
                    max_booking_suppl_id += 1.
                    <mapped_bookingsuppl2>-%is_draft = <bookingsuppl_wo_numbers2>-%is_draft.
                    <mapped_bookingsuppl2>-BookingSupplementId = max_booking_suppl_id.
                ENDIF.
 ENDLOOP.

ENDLOOP.

ENDMETHOD.

  METHOD calculateTotalPrice.
  DATA travel_ids type STANDARD TABLE OF ZKK_TRAVEL_PROJ_PROCESSOR with UNIQUE HASHED KEY key COMPONENTS travelid.
  travel_ids = CORRESPONDING #( keys discarding duplicates mapping travelid = TravelId ).

   MODIFY entities of ZKK_TRAVEL_ROOT in local mode
        ENTITY travel
            execute reCalcTotalPrice
            FROM CORRESPONDING #( travel_ids ).

  ENDMETHOD.

ENDCLASS.
