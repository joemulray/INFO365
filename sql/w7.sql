DECLARE
	amount NUMBER(9) := 0;
	counter NUMBER(6) := 0;
BEGIN
	<<not_enough>>
	DBMS_OUTPUT.PUT_LINE('Not yet - Counter: '||counter||' Total: '||amount);
	counter := counter + 1;
	amount := amount + (counter * counter + 1);
	IF amount > 1000 THEN
		GOTO got_enough;
	ELSE
		GOTO not_enough;
	END IF;
	<<got_enough>>
	DBMS_OUTPUT.PUT_LINE('Got enough - Counter: '||counter||' Total: '||amount);
 END;


DECLARE
	amount NUMBER(9) := 0;
	counter NUMBER(6) := 0;
BEGIN
	<<not_enough>>
	DBMS_OUTPUT.PUT_LINE('Not yet - Counter: '||counter||' Total: '||amount);
	counter := counter + 1;
	amount := amount + (counter * counter + 1);
	IF amount > 1000 THEN
		GOTO got_enough;
	ELSE
		GOTO not_enough;
	END IF;
	<<got_enough>>
	DBMS_OUTPUT.PUT_LINE('Got enough - Counter: '||counter||' Total: '||amount);
 END;


DECLARE
	amount NUMBER(9) := 0;
	counter NUMBER(6) := 0;
BEGIN
WHILE amount < 1000
LOOP
		DBMS_OUTPUT.PUT_LINE('Not yet - Counter: '||counter||' Total: '||amount);
		counter := counter + 1;
		amount := amount + (counter * counter + 1);

END LOOP;

DBMS_OUTPUT.PUT_LINE('Got enough - Counter: '||counter||' Total: '||amount);
END;