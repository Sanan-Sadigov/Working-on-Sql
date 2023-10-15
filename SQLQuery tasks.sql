--task1
--Hansı sifarislərdə max miqdarda məhsul sifariş edilmişdir?

Select
--Top 1 with ties
orderid, sum(qty) miqdar from Sales.orderdetails
group by orderid
order by miqdar Desc


--task2
--Max meblegde sifaris edilmis sifarisin hansi shipper companyname-ye aid oldugunu tapin.

Select Top 1  o.shipperid,companyname, od.orderid, Sum(Unitprice*qty) as mebleg
from sales.orders as O
left join sales.shippers as S
on o.shipperid=s.shipperid
left join sales.orderdetails as OD
on od.orderid=o.orderid
Group by o.shipperid,companyname, od.orderid
Order by mebleg Desc


--task3
--istehsali bitmis mehsullardan max gelir getiren mehsul hansi olmusdur?
--(discountinued-0(davam edir),1(bitmis))

Select Top 1 a.productname, sum(b.unitprice*qty) mebleg
from production.products a
inner join sales.orderdetails b
on a.productid=b.productid
where discontinued=1
group by a.productname
order by mebleg desc


--task4
--Tələb olunan vaxtdan gec catdirilan sifarislerden gelen umumi gelir ne qederdir?
--telebolunanvaxt(requireddate)/tamamlanma vaxti(shippeddate)

Select o.orderid, requireddate, shippeddate, Sum(unitprice*qty) as umumi_gelir
from sales.orders as O
left join sales.orderdetails as SO
on o.orderid=SO.orderid
where requireddate < shippeddate
Group by Requireddate, shippeddate, o.orderid
Order by umumi_gelir desc

--task5
--1970 və 1980 -ci illər arasında dogulanmayan iscilerin adlarini getirin

Select empid, firstname, YEAR(birthdate)
from hr.Employees
where --year(birthdate) <='1970' or year(birthdate) >'1980'

birthdate not between '19700101' and '19810101'

--task6
--Hansı customerlerin minimum sayda sifarişi olub?

Select c.custid, o.orderid, Count(qty) as minimum_sayda_sifaris
from sales.customers as c
Left join sales.orders as O
on c.custid=o.custid
Left join sales.orderdetails as D
on o.orderid=D.orderid
Group by c.custid, o.orderid
order by minimum_sayda_sifaris

--task7
--9 ildən çox iş təcrübəsi olan employee-ləri gətirin(hiredate-ise giris tarixi)

 Select firstname, Year(hiredate)
 from hr.employees
 where year(hiredate)>9
 ----bilmedim


 --task8
--Londonda yaşayan işçilərin adi və nə qədər sifariş verdiklərini çıxaran sorgunu yazin
Select e.empid, firstname, city, Count(qty) as amount
from hr.employees as E
left join sales.orders as O
on e.empid=O.empid
left join sales.orderdetails as D
on o.orderid=D.orderid
Where city ='London'
Group by E.empid, firstname, city



--task9
--10248 id-li sifarişdə max sayda sifariş verilən product-in adı nədir?

Select p.productid, productname,orderid, qty
from production.products as P
left join sales.orderdetails as D
on p.productid=D.productid
Where orderid='10248'

--task10
----Tamamlanmamış sifarislərin hansı ölkədən olan müştərilər tərəfindən verildiyini tapın
---tamamlanma vaxti(shippeddate)

Select c.custid, c.country, o.shippeddate,requireddate
from sales.customers as C
inner join sales.orders as O
on C.custid=o.custid
where o.shippeddate<>requireddate

------done------