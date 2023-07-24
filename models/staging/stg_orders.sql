select 
---from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.SHPIMODE,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordersellingprice,
o.ordercostprice,
--from raw customer
c.customerid,
c.customername,
c.segment,
c.country,
-- from raw products
p.productid,
p.category,
p.productname,
p.subcategory

from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerid=c.customerid
left join {{ ref('raw_products') }} as p
on o.productid=p.productid