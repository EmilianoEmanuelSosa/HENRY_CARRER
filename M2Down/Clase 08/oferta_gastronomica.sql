use test;

UPDATE oferta_gastronomica
SET barrio = 'Nuñez'
WHERE barrio = 'NuÃƒÂ±ez';

#Barrio con más pubs
SELECT categoria, barrio, count(*) as cantidad
from oferta_gastronomica
GROUP BY barrio, categoria
HAVING categoria = 'PUB'
ORDER BY cantidad desc;

#Locales por rubro
SELECT categoria, count(*) as cantidad
from oferta_gastronomica
GROUP BY categoria
ORDER BY cantidad desc;

#Resto por comuna
SELECT comuna, count(*) as cantidad
from oferta_gastronomica
GROUP BY comuna, categoria
HAVING categoria = 'RESTAURANTE'
ORDER BY cantidad desc;
