@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view parent'
@Metadata.allowExtensions: true
define root view entity ZKK_TRAVEL_PROJ_PROCESSOR as projection on ZKK_TRAVEL_ROOT

{
    @ObjectModel.text.element: [ 'Description' ]
    key TravelId,
    @ObjectModel.text.element: [ 'AgencyName' ]
    @Consumption.valueHelpDefinition: [{ 
   // entity.name: '/DMO/I_Agency',
   //   entity.element: 'AgencyID'
        entity.name: 'ZKK_ES5_CUSTOM_ENTITY',
        entity.element: 'Agency_ID'
     }]
    AgencyId,
    @Semantics.text: true
    _Agency.Name as AgencyName,
    @ObjectModel.text.element: [ 'CustomerName' ]
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Customer',
        entity.element: 'CustomerID'
     }]
    CustomerId,
    @Semantics.text: true
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    @Semantics.text: true
    Description,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Overall_Status_VH',
        entity.element: 'OverallStatus'
     }]
    @ObjectModel.text.element: [ 'StatusText' ]
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    @Semantics.text: true
    StatusText,
    Criticality,
    /* Associations */
    _Agency,
    _Booking: redirected to composition child ZKK_BOOKING_PROJ_PROCESSOR,
    _Currency,
    _Customer,
    _OverallStatus,
   
   @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_KK_VE_CALC'
   @EndUserText.label: 'CO2 Tax'
   virtual CO2Tax: abap.int4,
   
   @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_KK_VE_CALC'
   @EndUserText.label: 'Week Day'
   virtual dayOffTheFlight: abap.char(9)
}


