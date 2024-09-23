@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales analtyical view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.query: true
define view entity ZC_KK_SALES_ANA as select from ZKK_SALES_CUBE
{   
    @AnalyticsDetails.query.axis: #ROWS
    key _BusinessPartner.company_name,
    @AnalyticsDetails.query.axis: #ROWS
    key _BusinessPartner.country,
    @Aggregation.default: #SUM
    @Semantics.amount.currencyCode: 'CurrencyCode'
    @AnalyticsDetails.query.axis: #COLUMNS
    GrossAmount,
    @AnalyticsDetails.query.axis: #ROWS
    @Consumption.filter.selectionType: #SINGLE
    CurrencyCode,
    @Semantics.quantity.unitOfMeasure: 'UnitofMesaure'
    @AnalyticsDetails.query.axis: #COLUMNS
    Quantity,
    @AnalyticsDetails.query.axis: #ROWS
    UnitofMesaure
   
}
