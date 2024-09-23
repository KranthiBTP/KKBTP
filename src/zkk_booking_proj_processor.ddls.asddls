@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZKK_BOOKING_PROJ_PROCESSOR as projection on ZKK_BOOKING_ROOT
//{
//    key TravelId,
//    key BookingId,
//    BookingDate,
//    CustomerId,
//    CarrierId,
//    ConnectionId,
//    FlightDate,
//    @Semantics.amount.currencyCode: 'CurrencyCode'
//    FlightPrice,
//    CurrencyCode,
//    BookingStatus,
//     @Semantics.systemDateTime.lastChangedAt: true
//    LastChangedAt,
//    /* Associations */
//    _BookingStatus,
//    _BookingSupplement:redirected to composition child ZKK_BOOKSUPPL_PROJ,
//    _Carrier,
//    _Connection,
//    _Customer,
//    _Travel : redirected to parent ZKK_TRAVEL_PROJ_PROCESSOR
//}


{
    key TravelId,
    key BookingId,
    BookingDate,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Customer',
        entity.element: 'CustomerID'
     }]
    CustomerId,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Carrier',
        entity.element: 'AirlineID'
     }]
    CarrierId,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Connection',
        entity.element: 'ConnectionID',
        additionalBinding: [
                            { localElement: 'CarrierId',
                              element: 'AirlineID' }
                           ]
     }]
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Booking_Status_VH',
        entity.element: 'BookingStatus'
     }]
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingStatus,
    _BookingSupplement: redirected to composition child ZKK_BOOKSUPPL_PROJ,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZKK_TRAVEL_PROJ_PROCESSOR
}
