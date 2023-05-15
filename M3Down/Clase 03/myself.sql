use adventureworks;
SELECT 
    Ano,
    MetodoEnvio,
    ROUND(Cantidad/SUM(Cantidad) OVER(PARTITION BY Ano)*100,2) PorcentajeTotalAno
FROM (select
        YEAR(h.OrderDate) As Ano,
        e.Name AS MetodoEnvio,
        SUM(d.OrderQty) as Cantidad
    FROM salesorderdetail d
    JOIN salesorderheader h 
        USING (SalesOrderID)
    JOIN shipmethod e 
        USING(ShipMethodID)salesorderheader
    GROUP BY YEAR(h.OrderDate),e.Name
    ORDER BY YEAR(h.OrderDate),e.Name
    )as v;
