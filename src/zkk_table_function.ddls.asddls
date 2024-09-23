@EndUserText.label: 'Table func-total sales &customer rank'
define table function ZKK_TABLE_FUNCTION
with parameters 
@Environment.systemField: #CLIENT
p_clnt : abap.clnt
returns {
  client : abap.clnt;
  company_name: abap.char(256);
  total_sales: abap.curr(15,2);
  currency_code: abap.cuky(5);
  customer_rank: abap.int4;  
}

implemented by method zcl_kk_amdp=>GET_TOTAL_SALES;