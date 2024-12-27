01  WS-DATA-RECORD. 
    05  WS-CUSTOMER-ID     PIC 9(5). 
    05  WS-CUSTOMER-NAME   PIC X(30). 
    05  WS-CUSTOMER-BALANCE PIC 9(7)V99. 

01  WS-TOTAL-BALANCE      PIC 9(8)V99 VALUE ZEROS. 
01  WS-OVERFLOW-FLAG      PIC 9 VALUE 0.

PROCEDURE DIVISION.
    ... 
    READ CUSTOMER-FILE INTO WS-DATA-RECORD AT END MOVE 1 TO WS-EOF.
    ...
    IF WS-EOF = 1 THEN
       DISPLAY "End of file reached."
       STOP RUN
    END-IF
    ...
    ADD WS-CUSTOMER-BALANCE TO WS-TOTAL-BALANCE ON SIZE ERROR MOVE 1 TO WS-OVERFLOW-FLAG.
    IF WS-OVERFLOW-FLAG = 1 THEN
        DISPLAY "Arithmetic overflow detected. Total balance may be inaccurate."
    END-IF
    ...