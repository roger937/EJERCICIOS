--ejercicio 1: Dada la tabla de reseñas, escriba una consulta para recuperar todas las reseñas de 3 estrellas mediante la cláusula WHERE de SQL. Solo muestre las columnas user_id y stars.
SELECT user_id,stars FROM reviews WHERE stars = 3;


--ejercicio 2: Se le ha proporcionado una tabla de productos que contiene datos sobre diferentes productos de la nube de Microsoft Azure.Imprima todos los datos en todas las columnas.
SELECT * FROM products;


--ejercicio 3: Practiquemos el uso de AND junto con WHERE para filtrar las reseñas de Amazon en función de estas dos condiciones:
--el recuento inicial es mayor que 2 y menor o igual a 4
--la reseña debe provenir del usuario 123, 265 o 362
--Consejo profesional: intente codificar y ejecutar cada condición de filtrado, una a la vez. ¡Es muy fácil intentar codificar todo esto de una sola vez y arruinarlo todo!
SELECT * FROM reviews
WHERE stars > 2
AND stars <= 4
AND (user_id = 123 OR user_id = 265 OR user_id = 362);


--ejercicio 4: Practiquemos el uso de AND junto con WHERE para filtrar las reseñas de Amazon en función de estas dos condiciones:
--el recuento inicial es mayor que 2 y menor o igual a 4
--la reseña debe provenir del usuario 123, 265 o 362
--Consejo profesional: intente codificar y ejecutar cada condición de filtrado, una a la vez. ¡Es muy fácil intentar codificar todo esto de una sola vez y arruinarlo todo!
SELECT manufacturer, drug, units_sold
FROM pharmacy_sales
WHERE (manufacturer = 'Biogen' OR manufacturer = 'AbbVie' OR manufacturer = 'Eli Lilly')
AND units_sold BETWEEN 100000 AND 105000;


--ejercicio 5: Imagina que eres un analista de datos que trabaja en CVS Pharmacy y tienes acceso a los datos de ventas de la farmacia. Utiliza el comando IN SQL para buscar datos sobre medicamentos:
--que fueron fabricados por Roche, Bayer o AstraZeneca
--y no vendieron entre 55 000 y 550 000 unidades
--Muestra el nombre del fabricante, el nombre del medicamento y la cantidad de unidades vendidas para todos los medicamentos que coinciden con ese criterio.
--Sugerencia: ¡no te olvides del operador BETWEEN!
SELECT manufacturer, drug, units_sold FROM pharmacy_sales
WHERE manufacturer IN ('Roche', 'Bayer', 'AstraZeneca')
AND units_sold NOT BETWEEN 55000 AND 550000;


--ejercicio 6: Tiene una tabla de 1000 registros de clientes de una pequeña empresa con sede en Australia.
--Busque todos los clientes cuyo nombre comience con "F" y la última letra de su apellido sea "ck".
SELECT *
FROM customers
WHERE customer_name LIKE 'F%ck';


--ejercicio 7: Tiene una tabla de 1000 registros de clientes de una pequeña empresa con sede en Australia.
--Encuentre todos los clientes cuyo nombre tenga como segunda y tercera letra "e".
--Ejemplo: "Reece Smith"
SELECT *
FROM customers
WHERE customer_name LIKE '_ee%';


--ejercicio 8: Tiene una tabla de 1000 registros de clientes de una pequeña empresa con sede en Australia.
--Encuentre todos los clientes que tengan entre 18 y 22 años (inclusive), vivan en Victoria, Tasmania o Queensland, su género no sea "n/a" y su nombre comience con "A" o "B".
SELECT * FROM customers
WHERE age BETWEEN 18 AND 22
AND state IN ('Victoria', 'Tasmania', 'Queensland')
AND gender != 'n/a'
AND (customer_name LIKE 'A%' OR customer_name LIKE 'B%');


--ejercicio 9: **Mostrar el número de filas en la tabla pharmacy_sales.**
SELECT COUNT(*) FROM pharmacy_sales;



--ejercicio 10: Imagina que eres un analista de datos que trabaja en una farmacia CVS y tienes acceso a los datos de ventas de la farmacia.
--Genera el número total de medicamentos fabricados por Pfizer y las ventas totales de todos los medicamentos de Pfizer.
SELECT COUNT(*), SUM(total_sales)
FROM pharmacy_sales
WHERE manufacturer = 'Pfizer'


--ejercicio 11: Escriba una consulta SQL usando AVG para encontrar el precio de apertura promedio de las acciones de Google (cuyo símbolo bursátil es 'GOOG').
SELECT AVG(open)
FROM stock_prices
WHERE ticker='GOOG';


--ejercicio 12: Utilice el comando MIN de SQL en este ejercicio práctico para encontrar el precio más bajo de las acciones de Microsoft (MSFT) jamás abiertas.
SELECT MIN(open)
FROM stock_prices
WHERE ticker='MSFT';


--ejercicio 13: Utilice el comando MAX de SQL en este ejercicio práctico para encontrar el precio más alto de las acciones de Netflix (NFLX) jamás abiertas.
SELECT MAX(open)
FROM stock_prices
WHERE ticker='NFLX';


--ejercicio 14: Para cada acción de FAANG en el conjunto de datos stock_prices, escriba una consulta SQL para encontrar el precio más bajo al que se abrió cada acción. Asegúrese de ordenar también los resultados por precio, en orden descendente.
SELECT ticker, MIN(open)
FROM stock_prices
GROUP BY ticker
ORDER BY min DESC;


--ejercicio 15: Este ejercicio de GROUP BY de SQL utiliza datos reales de una pregunta de entrevista de SQL de LinkedIn que es un poco difícil de abordar en este momento, por lo que resolveremos una variante más fácil de la pregunta de la entrevista.
SELECT skill, COUNT(candidate_id) FROM candidates
GROUP BY skill
ORDER BY count DESC;


--ejercicio 16: Utilice los comandos HAVING y MIN de SQL para encontrar todas las acciones de FAANG cuyo precio de acción abierta siempre fue mayor a $100.
SELECT ticker, MIN(open)
FROM stock_prices
GROUP BY ticker
HAVING MIN(open) > 100;


--ejercicio 17: Dada una tabla de candidatos y sus habilidades técnicas, enumere los identificadores de los candidatos que tengan más de 2 habilidades técnicas.
--Suposición:
--No hay duplicados en la tabla de candidatos.
SELECT candidate_id FROM candidates
GROUP BY candidate_id
HAVING COUNT(candidate_id) > 2;


--ejercicio 18: Supongamos que se le proporciona una tabla que contiene datos sobre los clientes de Amazon y sus gastos en productos de diferentes categorías. Escriba una consulta utilizando COUNT DISTINCT para identificar la cantidad de productos únicos dentro de cada categoría de producto.
SELECT category, COUNT(DISTINCT product)
FROM product_spend
GROUP BY category;


--ejercicio 19: CVS Health está intentando comprender mejor las ventas de sus farmacias y qué tan bien se venden los distintos productos. Cada medicamento solo puede ser producido por un fabricante.
--Redacte una consulta para encontrar los 3 medicamentos más rentables vendidos y cuántas ganancias obtuvieron. Suponga que no hay vínculos en las ganancias. Muestre el resultado desde la ganancia total más alta hasta la más baja.
--Definición:
--cogs significa Costo de los bienes vendidos, que es el costo directo asociado con la producción del medicamento.
--Ganancia total = Ventas totales - Costo de los bienes vendidos
--Si le gusta esta pregunta, ¡pruebe Pharmacy Analytics (Parte 2)!
SELECT
  drug,
  total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;



--ejercicio 20: Su equipo en JPMorgan Chase se está preparando para lanzar una nueva tarjeta de crédito y, para obtener más información, está analizando cuántas tarjetas de crédito se emitieron cada mes.
--Redacte una consulta que muestre el nombre de cada tarjeta de crédito y la diferencia en la cantidad de tarjetas emitidas entre el mes con la mayor cantidad de tarjetas emitidas y el mes con la menor cantidad de tarjetas emitidas. Organice los resultados en función de la mayor disparidad.
SELECT 
  card_name, 
  MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;


--ejercicio 21: Muestra las acciones que tuvieron "meses de grandes movimientos" y cuántos de esos meses tuvieron. Ordena tus resultados desde las acciones con más, hasta las que tuvieron menos, "meses de grandes movimientos".
--¿Qué es un mes de grandes movimientos?
--Un "mes de grandes movimientos" es cuando una acción cierra con un alza o una baja de más del 10 % en comparación con el precio al que abrió.
--Por ejemplo, cuando llegó el COVID y el comercio electrónico se convirtió en la nueva normalidad, las acciones de Amazon en abril de 2020 tuvieron un mes de grandes movimientos porque el precio se disparó de $96,65 por acción en la apertura a $123,70 al cierre, ¡un aumento del 28 %!
--ticker date open close percent_change
--AMZN 01/04/2020 00:00:00 96,65 123,70 28,0
--NFLX 01/04/2022 00:00:00 376,80 190,36 -49,5
--Las acciones de Netflix tuvieron un mes de gran movimiento en abril de 2022 en la dirección opuesta. Ese mes, Netflix informó que la compañía perdió 200.000 suscriptores en el primer trimestre y esperaba perder otros dos millones de suscriptores en el segundo trimestre. En abril de 2022, las acciones de Netflix abrieron ese mes a 376,80 dólares por acción, pero cerraron a 190,36 dólares, lo que representa una pérdida del 49,5 %. ¡Vaya!
SELECT ticker, COUNT(ticker)
FROM stock_prices
WHERE (close - open)/open > 0.10 OR (close - open)/open < -0.10
GROUP BY ticker
ORDER BY count DESC;


--ejercicio 22: Imagina que eres un analista de datos que trabaja en la farmacia CVS y tienes acceso a los datos de ventas de la farmacia.
--Para todos los medicamentos de Merck, genera el nombre del medicamento y el costo unitario de cada uno, redondeado al dólar más cercano. Ordénalo desde el medicamento más barato hasta el más caro.
--Sugerencia: el costo unitario se define como las ventas totales divididas por las unidades vendidas.
SELECT drug, CEIL(total_sales / units_sold) AS unit_cost
FROM pharmacy_sales
WHERE manufacturer = 'Merck'
ORDER BY unit_cost;


--ejercicio 23: Tesla está investigando cuellos de botella en la producción y necesita su ayuda para extraer los datos relevantes. Escriba una consulta para determinar qué piezas han comenzado el proceso de ensamblaje pero aún no están terminadas.
--Suposiciones:
--La tabla parts_assembly contiene todas las piezas que se encuentran actualmente en producción, cada una en distintas etapas del proceso de ensamblaje.
--Una pieza inacabada es aquella que carece de una fecha de finalización.
--Esta pregunta es sencilla, así que abordémosla con simplicidad tanto en el pensamiento como en la solución.
--A partir del 11 de abril de 2023, se actualizaron el enunciado del problema y las suposiciones para mejorar la claridad.
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;


--ejercicio 24: Explora el conjunto de datos de Marvel Avengers y escribe una consulta para categorizar a los superhéroes según sus me gusta promedio de la siguiente manera:
--Super me gusta: los superhéroes con un recuento de me gusta promedio mayor o igual a 15 000.
--Buenos me gusta: los superhéroes con un recuento de me gusta promedio entre 5000 y 14 999 (inclusive).
--Poco me gusta: los superhéroes con un recuento de me gusta promedio menor a 5000.
--Muestra el nombre del actor y el personaje, la plataforma, el promedio de me gusta y la categoría de me gusta correspondiente. Ordena los resultados por promedio de me gusta.
SELECT
  actor,
  character,
  platform,
  avg_likes,
  CASE 
    WHEN avg_likes >= 15000 THEN 'Super Likes'
    WHEN avg_likes BETWEEN 5000 AND 14999 THEN 'Good Likes'
    ELSE 'Low Likes'
  END AS likes_category
FROM marvel_avengers
ORDER BY avg_likes DESC;


--ejercicio 25: Esta es la misma pregunta que el problema n.° 3 del capítulo SQL de Ace the Data Science Interview. 
--Suponga que le dan la tabla sobre la audiencia de los usuarios categorizada por tipo de dispositivo, donde los tres tipos son computadora portátil, tableta y teléfono. 
--Escriba una consulta que calcule la audiencia total de computadoras portátiles y dispositivos móviles, donde móvil se define como la suma de la audiencia de tabletas y teléfonos. Genere la audiencia total de computadoras portátiles como laptop_reviews y la audiencia total de dispositivos móviles como mobile_views. 
--A partir del 15 de abril de 2023, la solución se ha actualizado con un enfoque más conciso y fácil de entender.
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;


--ejercicio 26: Supongamos que le han proporcionado las tablas que contienen información sobre los usuarios de Robinhood y las transacciones bursátiles que realizaron.
--Use una operación JOIN para generar toda la información de la tabla de transacciones unida a la tabla de usuarios.
SELECT *
FROM trades
INNER JOIN users
  ON trades.user_id = users.user_id;


--ejercicio 27: ¡Esta es la misma pregunta que el problema n.° 2 del capítulo SQL de Ace the Data Science Interview!
--Suponga que le proporcionan las tablas que contienen las órdenes de comercio completadas y los detalles de los usuarios en un sistema de comercio Robinhood.
--Escriba una consulta para recuperar las tres ciudades principales que tienen la mayor cantidad de órdenes de comercio completadas enumeradas en orden descendente. Imprima el nombre de la ciudad y la cantidad correspondiente de órdenes de comercio completadas.
SELECT 
  users.city, 
  COUNT(trades.order_id) AS total_orders 
FROM trades 
INNER JOIN users 
  ON trades.user_id = users.user_id 
WHERE trades.status = 'Completed' 
GROUP BY users.city 
ORDER BY total_orders DESC
LIMIT 3;


--ejercicio 28: Supongamos que se le proporcionan dos tablas que contienen datos sobre las páginas de Facebook y sus respectivos "Me gusta" (como en "Me gusta una página de Facebook").
--Escriba una consulta para devolver los identificadores de las páginas de Facebook que tienen cero "Me gusta". El resultado debe ordenarse en orden ascendente según los identificadores de las páginas.
SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id);


--ejercicio 29: Dada una tabla de publicaciones de Facebook, para cada usuario que publicó al menos dos veces en 2021, escribe una consulta para encontrar la cantidad de días entre la primera publicación del año y la última publicación del año de cada usuario en el año 2021. Genera el usuario y la cantidad de días entre la primera y la última publicación de cada usuario.
--P.d.: Si has leído la entrevista Ace the Data Science y te gustó, ¿consideras escribirnos una reseña?
SELECT 
	user_id, 
    MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021 
GROUP BY user_id
HAVING COUNT(post_id)>1;



--ejercicio 30: Supongamos que se le proporcionan tablas con información sobre los registros y confirmaciones de usuarios de TikTok a través de correo electrónico y mensajes de texto. Los nuevos usuarios de TikTok se registran con sus direcciones de correo electrónico y, al registrarse, cada usuario recibe un mensaje de texto de confirmación para activar su cuenta.
--Escriba una consulta para mostrar los ID de usuario de aquellos que no confirmaron su registro el primer día, pero sí lo hicieron el segundo día.
--Definición:
--action_date hace referencia a la fecha en la que los usuarios activaron sus cuentas y confirmaron su registro a través de mensajes de texto.
SELECT DISTINCT user_id
FROM emails 
INNER JOIN texts
  ON emails.email_id = texts.email_id
WHERE texts.action_date = emails.signup_date + INTERVAL '1 day'
  AND texts.signup_action = 'Confirmed';


--ejercicio 31: 