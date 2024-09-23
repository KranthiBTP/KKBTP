@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for booking supplement'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZKK_BOOKSUPPL_PROJ as projection on ZKK_BOOK_SUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    // @Semantics.amount.currencyCode: 'CurrencyCode'
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking : redirected to parent ZKK_BOOKING_PROJ_PROCESSOR,
   // _product,
   // _SupplementText,
     _Travel : redirected to ZKK_TRAVEL_PROJ_PROCESSOR
}
