//@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking suppliementory'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
  //  serviceQuality: #X,
    //sizeCategory: #S,
    //dataClass: #MIXED
//}
define view entity ZKK_BOOK_SUPPL as select from /dmo/booksuppl_m

association to parent ZKK_BOOKING_ROOT as _Booking on
$projection.BookingId = _Booking.BookingId and
$projection.TravelId = _Booking.TravelId

association[1..1] to ZKK_TRAVEL_ROOT as _Travel on 
$projection.TravelId = _Travel.TravelId

association[1..1] to /DMO/I_Supplement as _product on
$projection.SupplementId = _product.SupplementID
association[0..1] to /DMO/I_SupplementText as _SupplementText on
$projection.SupplementId = _SupplementText.SupplementID


{
  
  key travel_id as TravelId,
  key booking_id as BookingId,
  key booking_supplement_id as BookingSupplementId,
  supplement_id as SupplementId,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  price as Price,
  currency_code as CurrencyCode,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  _Travel,
  _product,
  _SupplementText ,
  _Booking 
}
