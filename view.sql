CREATE VIEW `vw_getQuantityAvalible` AS
SELECT it.type_name,
(it.max_item - COUNT(item_type_id)) AS 'quantity_avalible', max_item
FROM item i
INNER JOIN user u ON i.user_id = u.user_id
RIGHT JOIN item_type it ON i.item_type_id = it.type_id
GROUP BY type_name
