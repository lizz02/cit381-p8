DROP PROCEDURE IF EXISTS sp_insert_item;

DELIMITER //
CREATE PROCEDURE `sp_insert_item`(user_id int, item_type_id int)
BEGIN
INSERT INTO `cit381-assign08-model`.`item` (`user_id`, `item_type_id`) VALUES (user_id, item_type_id);
END //
DELIMITER ;

CALL sp_insert_item(2, 5)