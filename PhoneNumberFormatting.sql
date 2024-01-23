CREATE FUNCTION FormatPhoneNumber(@input_number VARCHAR(20))
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @formatted_number VARCHAR(20);
   
    IF @input_number IS NULL OR @input_number = '' 
    BEGIN
        RETURN NULL;
    END

    SET @input_number = REPLACE(@input_number, '-', '');
    SET @input_number = REPLACE(@input_number, ' ', '');
    SET @input_number = REPLACE(@input_number, '(', '');
    SET @input_number = REPLACE(@input_number, ')', '');

    IF LEN(@input_number) < 9 
    BEGIN
        RETURN NULL;
    END

    SET @formatted_number = CONCAT('+994 (', SUBSTRING(@input_number, LEN(@input_number) - 9 + 1, 2), ') ',
                                   SUBSTRING(@input_number, LEN(@input_number) - 7 + 1, 3), ' ',
                                   SUBSTRING(@input_number, LEN(@input_number) - 4 + 1, 2), ' ',
                                   SUBSTRING(@input_number, LEN(@input_number) - 1 + 1, 2));
    RETURN @formatted_number;
END;