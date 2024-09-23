@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales composite,cube view for sales data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.dataCategory: #CUBE
define view entity ZKK_SALES_CUBE as select from ZKK_I_SALES
association[1] to zkk_table_bpa as _BusinessPartner on 
$projection.Buyer = _BusinessPartner.bp_id
association[1] to zkk_db_product as _Product on
$projection.Product = _Product.product_id
{

key ZKK_I_SALES.OrderId,
key ZKK_I_SALES._items.item_id as ItemId,
ZKK_I_SALES.OrderNo,
ZKK_I_SALES.Buyer,
ZKK_I_SALES.CreatedBy,
ZKK_I_SALES.CreatedOn,
/* Associations */
ZKK_I_SALES._items.product as Product,
@DefaultAggregation: #SUM
@Semantics.amount.currencyCode: 'CurrencyCode'
ZKK_I_SALES._items.amount as GrossAmount,
ZKK_I_SALES._items.currency as CurrencyCode,
 @DefaultAggregation: #SUM
 @Semantics.quantity.unitOfMeasure: 'UnitOfMesaure'
ZKK_I_SALES._items.qty as Quantity,
ZKK_I_SALES._items.uom as UnitofMesaure,
_Product,
_BusinessPartner
}
