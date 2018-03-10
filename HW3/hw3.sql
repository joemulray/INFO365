DECLARE
	CURSOR num_cur IS
	SELECT * FROM RandomJunk FOR UPDATE;

	TYPE prod_varray IS VARRAY(200) OF RandomJunk%ROWTYPE;
  	varray_prod PROD_VARRAY := prod_varray();

	rand1 NUMBER;
	rand2 NUMBER;

BEGIN

	FOR v_junk IN num_cur 
	LOOP
		-- Update the random values each loop iteration
		rand1:=  CEIL(DBMS_RANDOM.VALUE(0,1000));
		rand2 :=  CEIL(DBMS_RANDOM.VALUE(0,1000));

		IF rand1 <= rand2 THEN
			IF v_junk.NUMJUNK BETWEEN rand1 AND rand2 THEN
				UPDATE RandomJunk 
				SET TEXTJUNK='UPDATED'
				WHERE CURRENT OF num_cur;

			ELSE
				varray_prod.EXTEND;
				varray_prod(varray_prod.count) := v_junk;

			END IF;
		ELSE
			IF v_junk.NUMJUNK BETWEEN rand2 AND rand1 THEN
				UPDATE RandomJunk 
				SET TEXTJUNK='UPDATED'
				WHERE CURRENT OF num_cur;

			ELSE
				varray_prod.EXTEND;
				varray_prod(varray_prod.count) := v_junk;
			END IF;

		END IF;

	END LOOP;
	COMMIT;


	FOR i in varray_prod.FIRST .. varray_prod.LAST LOOP
		DBMS_OUTPUT.PUT_LINE(i || ' : ' || varray_prod(i).TEXTJUNK);
	END LOOP;

END;
/


set serveroutput on size 1000000;

DECLARE
	time number;

BEGIN
	SELECT
	EXTRACT(SECOND FROM SYSTIMESTAMP) 
	- TRUNC(EXTRACT(SECOND FROM SYSTIMESTAMP)) INTO time
	FROM dual;

	DBMS_OUTPUT.PUT_LINE('Time: ' || time);

	IF time <= .2 THEN
		DBMS_OUTPUT.PUT_LINE('Dirty deeds done dirt cheap.');
	ELSIF time >.2 AND time <=.4 THEN
		DBMS_OUTPUT.PUT_LINE('John Wayne Gacy was a clown - that''s freaky.');
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



DECLARE
	CURSOR prod_cur IS
	SELECT * FROM Products
	ORDER BY PRODUCTID DESC;

	previous Products%ROWTYPE;

BEGIN
	FOR v_prod IN prod_cur
	LOOP

	IF v_prod.PRODNAME LIKE '%Mega%' AND previous.PRODNAME LIKE '%Glider%' THEN
		DBMS_OUTPUT.PUT_LINE('PRODUCTID:' || v_prod.PRODUCTID || '     PRODNAME:' || v_prod.PRODNAME);

	ELSE
		DBMS_OUTPUT.PUT_LINE('NO MATCH FOR PRODUCT');

	-- Set record to previous value for comparison on next product
	previous := v_prod;

	END IF;
	
	END LOOP;
END;
/


