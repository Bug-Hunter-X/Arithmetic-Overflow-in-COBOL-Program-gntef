01  WS-DATA-RECORD. 
    05  WS-CUSTOMER-ID     PIC 9(5). 
    05  WS-CUSTOMER-NAME   PIC X(30). 
    05  WS-CUSTOMER-BALANCE PIC 9(7)V99. 

PROCEDURE DIVISION.
    ... 
    READ CUSTOMER-FILE INTO WS-DATA-RECORD AT END MOVE 1 TO WS-EOF.
    ... 
    IF WS-EOF = 1 THEN
       DISPLAY "End of file reached."
       STOP RUN
    END-IF
    ... 
    ADD WS-CUSTOMER-BALANCE TO WS-TOTAL-BALANCE ON SIZE ERROR DISPLAY "Arithmetic overflow error" STOP RUN.
    ...