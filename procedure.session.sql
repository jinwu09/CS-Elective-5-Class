CALL addEmployee(4,
"Albert",
"Bautista",
"Santos",
"",
"meow",
"meow",
1,
"meow",
"meow",
"meow",
"meow@gmail.com",
0,
0,
"2002.01.01",
"Jinwusan",
"meow",
0,
1.11,
1.11,
1.11,
1.11)
--@block
CREATE  
DEFINER = 'payrolluser'@'localhost'
PROCEDURE addEmployee(
    IN var_empcode VARCHAR(10), 
    IN var_fname VARCHAR(50), 
    IN var_mname VARCHAR(50), 
    IN var_lname VARCHAR(50), 
    IN var_extname VARCHAR(4), 
    IN var_region TEXT, 
    IN var_province TEXT, 
    IN var_citynum TEXT, 
    IN var_brgy INT(11), 
    IN var_house TEXT, 
    IN var_position VARCHAR(50), 
    IN var_email VARCHAR(100), 
    IN var_civil TINYINT(1), 
    IN var_sex TINYINT(1), 
    IN var_bdate DATE,
    IN var_username VARCHAR(10), 
    IN var_password VARCHAR(50), 
    IN var_role TINYINT(1),
    IN var_basicpay DECIMAL(9,2), 
    IN var_sssded DECIMAL(9,2),
    IN var_phded DECIMAL(9,2),
    IN var_wtaxded DECIMAL(9,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLWARNING
    BEGIN
        ROLLBACK;
    END;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO `tbl_employees`(`fld_empcode`, `fld_fname`, `fld_mname`, `fld_lname`, `fld_extname`, `fld_region`, `fld_province`, `fld_citynum`, `fld_brgy`, `fld_house`, `fld_position`, `fld_email`, `fld_civil`, `fld_sex`, `fld_bdate`) VALUES (var_empcode, var_fname, var_mname, var_lname, var_extname, var_region, var_province, var_citynum, var_brgy, var_house, var_position, var_email, var_civil, var_sex, var_bdate);

    INSERT INTO `tbl_accounts`(`fld_empcode`, `fld_username`, `fld_password`, `fld_role`) VALUES (var_empcode, var_username, var_password, var_role);

    INSERT INTO `tbl_payinfo`(`fld_empcode`, `fld_basicpay`, `fld_sssded`, `fld_phded`, `fld_wtaxded`) VALUES (var_empcode, var_basicpay, var_sssded, var_phded, var_wtaxded);
    COMMIT;
END;

--@block 
CREATE  
DEFINER = 'payrolluser'@'localhost'
PROCEDURE addPayroll(
    IN var_ot VARCHAR(10),
    IN var_netpay DECIMAL(9,2),
    IN var_grosspay DECIMAL(9,2),
    IN var_startperiod DATE,
    IN var_endperiod DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLWARNING
    BEGIN
        ROLLBACK;
    END;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO `tbl_payroll`(`fld_empcode`, `fld_ot`, `fld_netpay`, `fld_grosspay`, `fld_startperiod`, `fld_endperiod`) VALUES (var_empcode, var_ot, var_netpay, var_grosspay, var_startperiod, var_endperiod);
    
    COMMIT;
END;

--@block
CREATE  
DEFINER = 'payrolluser'@'localhost'
PROCEDURE changePassword(
    IN var_username VARCHAR(50),
    IN var_password VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLWARNING
    BEGIN
        ROLLBACK;
    END;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    UPDATE `tbl_accounts` SET `fld_password`=var_password WHERE fld_username = var_username;

    COMMIT;
END;

--@block
CREATE  
DEFINER = 'payrolluser'@'localhost'
PROCEDURE updateEmployeeInfo(
    IN var_empcode VARCHAR(10),
    IN var_fname VARCHAR(50),
    IN var_mname VARCHAR(50),
    IN var_lname VARCHAR(50),
    IN var_extname VARCHAR(4),
    IN var_region TEXT,
    IN var_province TEXT,
    IN var_citynum TEXT,
    IN var_brgy INT(11),
    IN var_house TEXT,
    IN var_position VARCHAR(50),
    IN var_email VARCHAR(100),
    IN var_civil TINYINT(1),
    IN var_sex TINYINT(1),
    IN var_bdate DATE

)
BEGIN
    DECLARE EXIT HANDLER FOR SQLWARNING
    BEGIN
        ROLLBACK;
    END;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    UPDATE `tbl_employees` SET `fld_fname`=var_fname,`fld_mname`=var_mname,`fld_lname`=var_lname,`fld_extname`=var_extname,`fld_region`=var_region,`fld_province`=var_province,`fld_citynum`=var_citynum,`fld_brgy`=var_brgy,`fld_house`=var_house,`fld_position`=var_position,`fld_email`=var_email,`fld_civil`=var_civil,`fld_sex`=var_sex,`fld_bdate`=var_bdate WHERE fld_empcode=var_empcode;

    COMMIT;
END;

--@block
CREATE  
DEFINER = 'payrolluser'@'localhost'
PROCEDURE updatePayInfo(
    IN var_empcode VARCHAR(10),
    IN var_basicpay DECIMAL(9,2),
    IN var_sssded DECIMAL(9,2),
    IN var_phded DECIMAL(9,2),
    IN var_wtaxded DECIMAL(9,2)
)

BEGIN
    DECLARE EXIT HANDLER FOR SQLWARNING
    BEGIN
        ROLLBACK;
    END;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    UPDATE `tbl_payinfo` SET `fld_basicpay`=var_basicpay,`fld_sssded`=var_sssded,`fld_phded`=var_phded,`fld_wtaxded`=var_wtaxded WHERE fld_empcode = fld_empcode;

    COMMIT;
END;


--@block
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `authLogin`(IN `var_username` VARCHAR(50))
SELECT * FROM tbl_accounts WHERE fld_username = var_username$$
DELIMITER ;
--@block
DELIMITER $$
CREATE DEFINER=`payrolluser`@`localhost` PROCEDURE getEmployees()
SELECT 
	tbl_employees.*,
    tbl_payinfo.*
from tbl_employees 
INNER JOIN tbl_payinfo USING (fld_empcode)$$
DELIMITER ;