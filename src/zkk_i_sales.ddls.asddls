@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales fact data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZKK_I_SALES as select from zkk_db_sales_hdr  as hdr
association[1..*] to zkk_db_so_item as _items on
$projection.OrderId = _items.order_id
{
    key hdr.order_id as OrderId,
    hdr.order_no as OrderNo,
    hdr.buyer as Buyer,
    hdr.created_by as CreatedBy,
    hdr.created_on as CreatedOn,
    _items    
}
