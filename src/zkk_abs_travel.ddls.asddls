@EndUserText.label: 'Abstract entity for bookind data event'
define abstract entity ZKK_ABS_TRAVEL
  {

  travel_id   : /dmo/travel_id ;
  booking_id  : /dmo/booking_id ;
  booking_date    : /dmo/booking_date;
  customer_id     : /dmo/customer_id;
  carrier_id      : /dmo/carrier_id;
  connection_id   : /dmo/connection_id;
  flight_date     : /dmo/flight_date;
  @Semantics.amount.currencyCode : 'currency_code'
  flight_price    : /dmo/flight_price;
  @Semantics.currencyCode: true
  currency_code   : /dmo/currency_code;

}
