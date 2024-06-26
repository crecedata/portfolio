-- 1. Calculate Total Sales by Property Type:
	SELECT Inmuebles, SUM(Ventas) AS Total_Ventas
	FROM inmobiliaria
	GROUP BY Inmuebles
	HAVING SUM(Ventas) > 1000

-- 2. Calculate Average Stock and Sales per Month:

SELECT 
    FORMAT(Fecha, 'yyyy-MM') AS Mes,
    AVG(Stock) AS Promedio_Stock,
    AVG(Ventas) AS Promedio_Ventas
FROM inmobiliaria
GROUP BY FORMAT(Fecha, 'yyyy-MM')
HAVING AVG(Ventas) > 500;

-- 3. Find the Month with the Highest Sales:
SELECT TOP 1
    FORMAT(Fecha, 'yyyy-MM') AS Mes,
    SUM(Ventas) AS Total_Ventas
FROM inmobiliaria
GROUP BY FORMAT(Fecha, 'yyyy-MM')
HAVING SUM(Ventas) > 1500
ORDER BY Total_Ventas DESC;

-- 4. Calculate the Sales to Stock Ratio by Property Type:

SELECT 
    Inmuebles,
    SUM(Ventas) / SUM(Stock) AS Ratio_Ventas_Stock
FROM inmobiliaria
GROUP BY Inmuebles
HAVING SUM(Stock) > 10000

-- 5. Monthly Trend of Sales for Each Property Type:

SELECT 
    FORMAT(Fecha, 'yyyy-MM') AS Mes,
    Inmuebles,
    SUM(Ventas) AS Total_Ventas
FROM inmobiliaria
GROUP BY FORMAT(Fecha, 'yyyy-MM'), Inmuebles
HAVING SUM(Ventas) > 300
ORDER BY Mes, Inmuebles;

-- 6 Identify Seasonal Trends:

SELECT 
    FORMAT(Fecha, 'yyyy-MM') AS Mes,
    Inmuebles,
    AVG(Ventas) AS Promedio_Ventas
FROM inmobiliaria
GROUP BY FORMAT(Fecha, 'yyyy-MM'), Inmuebles
HAVING AVG(Ventas) > 500
ORDER BY Mes, Inmuebles;

-- 7. Sales Performance Before and After a Specific Date:

SELECT 
    Inmuebles,
    SUM(CASE WHEN Fecha <= '2024-01-01' THEN Ventas ELSE 0 END) AS Ventas_Antes,
    SUM(CASE WHEN Fecha >= '2024-01-01' THEN Ventas ELSE 0 END) AS Ventas_Despues
FROM inmobiliaria
GROUP BY Inmuebles
HAVING SUM(Ventas) > 1000;


