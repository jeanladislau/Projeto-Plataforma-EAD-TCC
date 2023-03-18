CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `prod_school`.`view_credenciais` AS
    SELECT 
        CONCAT(SUBSTR(`usu`.`Nome_Comp`, 1, 1),
                SUBSTRING_INDEX(`usu`.`Nome_Comp`, ' ', -(1))) AS `USUARIO`,
        DATE_FORMAT(`usu`.`Dt_Nasc`, '%d%m%Y') AS `SENHA`
    FROM
        `prod_school`.`tblusu` `usu`