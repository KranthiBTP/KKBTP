@EndUserText.label: 'Custom entity for ES5 API'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_KK_ES5AGENCY'
define custom entity ZKK_ES5_CUSTOM_ENTITY
{
  key Agency_Id : abap.char( 6 );
  Name : abap.char( 31 );
  Name_vc : rap_cp_odata_value_control;
  Street: abap.char( 30 );
  Street_vc: rap_cp_odata_value_control;
  PostalCode: abap.char( 10 );
  PostalCode_vc: rap_cp_odata_value_control;
  City: abap.char( 25 );
  City_vc: rap_cp_odata_value_control;
  Country: abap.char( 3 );
  Country_vc: rap_cp_odata_value_control;
  PhoneNumber: abap.char( 30 );
  PhoneNumber_vc: rap_cp_odata_value_control;
  WebAddress: abap.char( 255 );
  WebAddress_vc: rap_cp_odata_value_control;
  
  
}
