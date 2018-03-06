DECLARE
	CURSOR num_cur IS
	SELECT * FROM RandomJunk FOR UPDATE;
BEGIN

	FOR v_junk IN num_cur 
	LOOP
		DECLARE 
		rand1 NUMBER(4) :=  CEIL(DBMS_RANDOM.VALUE(0,1000));
		rand2 NUMBER(4) :=  CEIL(DBMS_RANDOM.VALUE(0,1000));

		BEGIN
		DBMS_OUTPUT.PUT_LINE('Random1:'||rand1);
		DBMS_OUTPUT.PUT_LINE('Random2:'||rand2);
		DBMS_OUTPUT.PUT_LINE('NUMJUNK:'||v_junk.NUMJUNK);


		IF rand1 <= rand2 THEN
			IF v_junk.NUMJUNK BETWEEN rand1 AND rand2 THEN
				UPDATE RandomJunk 
				SET TEXTJUNK='UPDATED'
				WHERE CURRENT OF num_cur;
				DBMS_OUTPUT.PUT_LINE('UPDATED');
			END IF;
		ELSE
			IF v_junk.NUMJUNK BETWEEN rand2 AND rand1 THEN
				UPDATE RandomJunk 
				SET TEXTJUNK='UPDATED'
				WHERE CURRENT OF num_cur;
				DBMS_OUTPUT.PUT_LINE('UPDATED');
			END IF;

		END IF;
		END;

	END LOOP;
	COMMIT;
END;
/


DECLARE
	time number(10) := 'SELECT
EXTRACT(SECOND FROM SYSTIMESTAMP) 
- TRUNC(EXTRACT(SECOND FROM SYSTIMESTAMP))
FROM dual;
'

BEGIN
	IF time <= .2 THEN
		DBMS_OUTPUT.PUT_LINE('Dirty deeds done dirt cheap.');
	ELSIF time >.2 AND time <=.4 THEN
		-- DBMS_OUTPUT.PUT_LINE('John Wayne Gacy was a clown – that\'s freaky.');
	ELSIF time >.4 AND time <=.6 THEN
		DBMS_OUTPUT.PUT_LINE('Most XKCD cartoons are over my head.');
	ELSIF time >.6 AND time <=.8 THEN
		DBMS_OUTPUT.PUT_LINE('Most Garfield cartoons are over my head.'); 
	ELSIF time >.8 THEN
		DBMS_OUTPUT.PUT_LINE('How did Nicholas Cage ever become an action star?');
	ELSE
		DBMS_OUTPUT.PUT_LINE('I think I messed up one of my conditions.'); 
	END IF;

END;
/
