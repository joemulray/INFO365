select * from Products_Store1
 join on 
 Products_Store1.ProductId = Products_Store2.ProductId;


 select * from Products_Store1 1, Products_Store2 2
 where 1.Product_Id = 2.Product_Id

 select Distinct O.ProductId, O.Name
 from Products_Store1 O, Products_Store2 T
 where T.ProductId <> O.ProductId


 SELECT Distinct One.ProductId,
 One.Name
 FROM Products_Store1 One
 INNER JOIN Products_Store2 Two
 on One.ProductId = Two.ProductId
 INNER JOIN Products_Store3 Three
 on Three.ProductId = Two.ProductId;


SELECT P1.ProductId, P1.Name,
P2.ProductId, P2.Name
FROM Products_Store1 P1, 
Products_Store2 P2
WHERE P1.ProductId <> P2.ProductId


SELECT * FROM Products_Store1
WHERE Products_Store1.ProductId
NOT IN
(SELECT ProductId FROM Products_Store2)


SELECT * FROM Products_Store2
WHERE Products_Store2.ProductId
NOT IN
(SELECT ProductId FROM Products_Store1)



SELECT P1.ProductId, P2.ProductId
from Products_Store1 P1
FULL OUTER JOIN 
	Products_Store2 P2
on P1.ProductId = P2.ProductId 
WHERE P1.ProductId IS NULL
OR P2.ProductId IS NULL


SELECT ProductId 
FROM Products_Store1
UNION 
SELECT ProductId FROM Products_Store2

SELECT Distinct Products_Store1.ProductId, Products_Store2.ProductId,
	Products_Store3.ProductId
	FROM Products_Store1
	FULL OUTER JOIN Products_Store2
	ON Products_Store1.ProductId = Products_Store2.ProductId
	FULL OUTER JOIN Products_Store3
	ON Products_Store3.ProductId = Products_Store2.ProductId 
	OR Products_Store3.ProductId = Products_Store1.ProductId
WHERE (Products_Store1.ProductId IS NULL AND Products_Store2.ProductId IS NULL)
OR (Products_Store1.ProductId IS NULL AND Products_Store3.ProductId IS NULL)
OR (Products_Store3.ProductId IS NULL AND Products_Store2.ProductId IS NULL)


SELECT P1.ProductId,
 P1.Name
 FROM Products_Store1 P1
 INNER JOIN Products_Store2 P2
 on P1.ProductId = P2.ProductId
 INNER JOIN Products_Store3 P3
 on P3.ProductId = P2.ProductId;



SELECT P1.ProductId, P2.ProductId,
	P3.ProductId
	FROM Products_Store1 P1
	FULL OUTER JOIN Products_Store2 P2
	ON P1.ProductId = P2.ProductId
	FULL OUTER JOIN Products_Store3 P3
	ON P3.ProductId = P2.ProductId 
	OR P3.ProductId = P1.ProductId
WHERE (P1.ProductId IS NULL AND P2.ProductId IS NULL)
OR (P1.ProductId IS NULL AND P3.ProductId IS NULL)
OR (P3.ProductId IS NULL AND P2.ProductId IS NULL)

