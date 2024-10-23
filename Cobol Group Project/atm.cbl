
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. ATM.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFO
           ASSIGN TO "C:\OPENCOBOL\TEXTFILE\ATM2.txt"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS ACC-NUM.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
       FD INFO.
       01  INFO-RECORD.
           05 ACC-NUM PIC Z9(5).
           05 USER_NAME PIC X(9).
           05 AGE PIC 9(2).
           05 BALANCE PIC S9(7).
           05 PASSWORD PIC Z9(3).
      *-----------------------
       WORKING-STORAGE SECTION.
       01  WS-EOF PIC X(1) VALUE 'Y'.
       01  WS-KEY PIC 9(5).
       01  WS-KEY1 PIC Z9(5).
       01  WS-CTR PIC 9 VALUE 3.
       01  WS-SUM PIC 9(7).
       01  WS-AMOUNT PIC 9(7).
       01  WS-AMOUNT1 PIC Z9(7).
       01  WS-CHOICE PIC 9.
       01  WS-CHOICE1 PIC 9.
       01  WS-EXISTS PIC X.
       01  WS-EXISTS1 PIC X(10).
       01  WS-CT PIC 9 VALUE 0.
       01  BORDER-X PIC 999.
       01  BORDER-Y PIC 999.
       01  BALANCE1 PIC Z9(7).
       01  KYS PIC Z9.
       01  PASSWORD1 PIC 9(4).
       01  RND PIC 9(6).
       01 TM-DATE.
           05 CurrentDate    PIC X(16).
           05 FormattedDate  PIC X(10).
           05 FormattedTime  PIC X(10).
           05  CURRENT-TIME PIC X(8).
           05  HH PIC 99.
           05  D-N PIC XX.

      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
       StartPara.

           OPEN I-O INFO.

           PERFORM MENU1-PROCEDURE UNTIL WS-CHOICE1 = 3

           CLOSE INFO.

       EndPara.

           DISPLAY SPACES ERASE SCREEN
           BACKGROUND-COLOR 7.
           DISPLAY "THANK YOU FOR USING RICKTASTIC ATM MACHINE" AT 1539
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           CLOSE INFO.
           STOP RUN.

       MENU1-PROCEDURE.
           DISPLAY SPACES ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1

      *>      PERFORM NOTE
           MOVE 'N' TO WS-EXISTS
           DISPLAY "===================" AT 0851
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "AEDESYL ATM" AT 0955
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 1051
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "1 - SIGN IN" AT 1454
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "2 - SIGN UP" AT 1554
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "0 - EXIT"    AT 1654
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "ENTER CHOICE: " AT 1754
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT WS-CHOICE1   AT 1768
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           EVALUATE WS-CHOICE1
                   WHEN 1 PERFORM SIGN-IN
                   WHEN 2 PERFORM SIGN-UP
                   WHEN 0 MOVE 3 TO WS-CHOICE1
                   DISPLAY SPACE ERASE SCREEN
                       PERFORM BORDER
                       PERFORM BORDER1
                       DISPLAY "DO YOU WANT TO CONTINUE?(Y/N) " AT 1547
                       FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                       ACCEPT WS-EXISTS AT 1577
                       FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                       IF 'Y' = WS-EXISTS
                           PERFORM EndPara
                       ELSE
                           PERFORM MENU1-PROCEDURE
           END-EVALUATE.


       MENU2-PROCEDURE.
               DISPLAY SPACES ERASE SCREEN
               BACKGROUND-COLOR 7
               PERFORM BORDER
               PERFORM BORDER1
      *>          PERFORM NOTE.
               MOVE 'N' TO WS-EXISTS
               DISPLAY "===================" AT 0851
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "AEDESYL ATM" AT 0955
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "===================" AT 1051
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "1 - DEPOSIT" AT 1253
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "2 - WITHDRAW" AT 1353
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "3 - CHECK BALANCE" AT 1453
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "4 - TRANSFER" AT 1553
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "5 - UPDATE ACCOUNT" AT 1653
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "6 - DELETE ACCOUNT" AT 1753
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "0 - EXIT" AT 1853
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "ENTER CHOICE: " AT 1953
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT WS-CHOICE AT 1967
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               EVALUATE WS-CHOICE
                   WHEN 1 PERFORM DEP-PROCEDURE
                   WHEN 2 PERFORM WITH-PROCEDURE
                   WHEN 3 PERFORM BAL-PROCEDURE
                   WHEN 4 PERFORM TRANSFER-PROCEDURE
                   WHEN 5 PERFORM UPDT-RECORD
                   WHEN 6 PERFORM DEL-RECORD
                   WHEN 0 MOVE 7 TO WS-CHOICE
                       DISPLAY SPACE ERASE SCREEN
                       PERFORM BORDER
                       PERFORM BORDER1
                       DISPLAY "DO YOU WANT TO CONTINUE?(Y/N) " AT 1547
                       FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                       ACCEPT WS-EXISTS AT 1577
                       FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                       IF 'Y' = WS-EXISTS
                           PERFORM EndPara
                       ELSE
                           PERFORM MENU2-PROCEDURE
               END-EVALUATE.

      *>  NOTE.
      *>      DISPLAY"NOTE:" AT 2757
      *>      FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
      *>      DISPLAY"Protect your Personal Identification Number." AT 2839
      *>      FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
      *>      DISPLAY "Memorize your PIN and Account Number. " AT 2942
      *>      FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7.

       WELCOME.
           DISPLAY SPACE ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           DISPLAY "WELCOME TO AEDESYL BANK USERS!!!" AT 1543
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT KYS AT 0202
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7.


       SIGN-IN.
           DISPLAY SPACE ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           MOVE 1 TO WS-CHOICE
           MOVE "Y" TO WS-EXISTS
           DISPLAY "===================" AT 0851
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "AEDESYL ATM" AT 0955
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 1051
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "ACCOUNT NUMBER: " AT 1449
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT WS-KEY1 AT 1465
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           MOVE WS-KEY1 TO ACC-NUM

           READ INFO
               INVALID KEY MOVE "N" TO WS-EXISTS
               IF WS-EXISTS = "N"
                   DISPLAY "ACCOUNT NUMBER DOESN'T EXIST." AT 1747
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT KYS AT 0202
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ADD 1 TO WS-CT
                   PERFORM SIGN-IN UNTIL WS-CT = 3
                   PERFORM EXITING
                   PERFORM EndPara

               END-IF
      *>          NOT INVALID KEY DISPLAY PASSWORD AT 1254
           END-READ.
               PERFORM PASSWORD-CHECK
           PERFORM WELCOME
           PERFORM MENU2-PROCEDURE UNTIL WS-CHOICE = 7.

       PASSWORD-CHECK.
           DISPLAY "ENTER PIN: " AT 1552
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT PASSWORD1 AT 1563
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

           READ INFO

           IF PASSWORD1 IS NOT EQUAL TO PASSWORD
               DISPLAY SPACE ERASE SCREEN
               PERFORM BORDER
               PERFORM BORDER1
               SUBTRACT 1 FROM WS-CTR
               DISPLAY "WRONG PIN REMAINING ATTEMPTS: " AT 1544
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               WS-CTR AT 1575
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT KYS AT 0202
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

               PERFORM SIGN-IN UNTIL WS-CTR = 0
               PERFORM EXITING
               PERFORM EndPara
           END-IF.


       PASSWORD-CHECK1.
           DISPLAY "ENTER PIN: " AT 1752
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT PASSWORD1 AT 1763
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

           READ INFO

           IF PASSWORD1 IS NOT EQUAL TO PASSWORD
               SUBTRACT 1 FROM WS-CTR
               DISPLAY "WRONG PIN REMAINING ATTEMPTS: " AT 1844
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               WS-CTR AT 1874
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT KYS AT 0202
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

               PERFORM PASSWORD-CHECK1 UNTIL WS-CTR = 0
               PERFORM EXITING
               PERFORM EndPara
           END-IF.

       SIGN-UP.
           DISPLAY SPACES ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           ACCEPT RND FROM TIME
           COMPUTE WS-KEY1 = 999999 * RND
           DISPLAY "===================" AT 0851
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "AEDESYL ATM" AT 0955
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 1051
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7


               DISPLAY "ENTER PIN: " AT 1347
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT PASSWORD1 AT 1369
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               IF PASSWORD1 < 999
                   DISPLAY "INVALID. PIN MUST BE 4 DIGITS" AT 1545
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT KYS AT 0202
                  FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                  PERFORM SIGN-UP
               END-IF

           DISPLAY "ENTER USERNAME: " AT 1547
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT USER_NAME AT 1569
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

           DISPLAY "ENTER AGE: " AT 1747
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT AGE AT 1769
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

           DISPLAY "ENTER INITIAL DEPOSIT" AT 1947
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT BALANCE1 AT 1969
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           MOVE BALANCE1 TO BALANCE
           MOVE WS-KEY1 TO ACC-NUM
                MOVE PASSWORD1 TO PASSWORD

                WRITE INFO-RECORD
                   NOT INVALID KEY
                   DISPLAY "SIGN UP SUCCESSFULLY" AT 2150
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                  DISPLAY "YOUR ACCOUNT NUMBER IS " AT 2245
                  FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                  WS-KEY1 AT 2268 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                  ACCEPT KYS AT 0202
                  FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                END-WRITE

           PERFORM MENU1-PROCEDURE.

       DEP-PROCEDURE.
           DISPLAY SPACES ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           MOVE 'N' TO WS-EXISTS
           DISPLAY "ENTER 0 TO EXIT" AT 2352
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 0851
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "AEDESYL ATM" AT 0955
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 1051
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "ENTER AMOUNT: " AT 1452
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT WS-AMOUNT1 AT 1466
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           MOVE WS-AMOUNT1 TO WS-AMOUNT
           IF WS-AMOUNT = 0

              DISPLAY SPACE ERASE SCREEN
              PERFORM BORDER
              PERFORM BORDER1
              DISPLAY "DO YOU WANT TO CONTINUE?(Y/N):" AT 1546
              FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
              ACCEPT WS-EXISTS AT 1576
              FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

              IF WS-EXISTS = 'Y'
                  PERFORM MENU2-PROCEDURE
              ELSE
                  PERFORM DEP-PROCEDURE
              END-IF
           END-IF

           DISPLAY SPACE ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           DISPLAY "ARE YOU SURE WANT DEPOSIT " AT 1447
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           WS-AMOUNT1 AT 1553 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           "?(Y/N):" AT 1561 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT WS-EXISTS AT 1568
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           PERFORM PASSWORD-CHECK1
           MOVE BALANCE TO BALANCE1


           IF 'Y' = WS-EXISTS
               ADD WS-AMOUNT TO BALANCE
               REWRITE INFO-RECORD
               INVALID KEY DISPLAY "INVALID KEY!" AT 1554
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               END-REWRITE

               DISPLAY SPACE ERASE SCREEN
               PERFORM BORDER
               PERFORM BORDER1
               DISPLAY "NEW BALANCE: " AT 1550 FOREGROUND-COLOR 0
               BACKGROUND-COLOUR 7
               BALANCE AT 1562 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT KYS AT 0202
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               PERFORM RECEIPT
           ELSE
               PERFORM DEP-PROCEDURE

           END-IF.


       WITH-PROCEDURE.
           DISPLAY SPACES ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           MOVE 'N' TO WS-EXISTS
           DISPLAY "ENTER 0 TO EXIT" AT 2352
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 0851
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "AEDESYL ATM" AT 0955
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 1051
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "ENTER AMOUNT: " AT 1452
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT WS-AMOUNT1 AT 1466
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           MOVE WS-AMOUNT1 TO WS-AMOUNT
           IF WS-AMOUNT = 0
               DISPLAY SPACE ERASE SCREEN
               PERFORM BORDER
               PERFORM BORDER1
               DISPLAY "DO YOU WANT TO CONTINUE?(Y/N):" AT 1546
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT WS-EXISTS AT 1576
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               IF WS-EXISTS = 'Y'
                  PERFORM MENU2-PROCEDURE
               ELSE
                  PERFORM WITH-PROCEDURE
               END-IF
           END-IF

           DISPLAY SPACE ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           DISPLAY "DO YOU WANT TO WITHDRAW  " AT 1449
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           WS-AMOUNT1 AT 1553 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           "?(Y/N):" AT 1561 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT WS-EXISTS AT 1568
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           PERFORM PASSWORD-CHECK1

           MOVE BALANCE TO BALANCE1

           IF WS-EXISTS = 'Y'

            COMPUTE BALANCE = BALANCE - WS-AMOUNT
            IF BALANCE < 0
                DISPLAY SPACE ERASE SCREEN
               PERFORM BORDER
               PERFORM BORDER1
                DISPLAY "INSUFFICIENT BALANCE" AT 1451
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                DISPLAY "REMAINING BALANCE: " AT 1547
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                BALANCE1 AT 1566
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                DISPLAY "PLEASE TRY AGAIN" AT 1652
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                ACCEPT KYS AT 0202
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                PERFORM WITH-PROCEDURE
            END-IF




           REWRITE INFO-RECORD

           DISPLAY SPACE ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           DISPLAY "NEW BALANCE: " AT 1550 FOREGROUND-COLOR 0
           BACKGROUND-COLOUR 7
           BALANCE AT 1562 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT KYS AT 0202
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           PERFORM RECEIPT
           ELSE
               PERFORM WITH-PROCEDURE
           END-IF.


       BAL-PROCEDURE.
           DISPLAY SPACES ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           MOVE 'N' TO WS-EXISTS1
           DISPLAY "DO YOU WANT TO PRINT RECEIPT OR SHOW IN SCREEN?"
           AT 1537 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "(SHOW/PRINT): " AT  1651
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT WS-EXISTS1 AT 1665
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           READ INFO
           MOVE BALANCE TO BALANCE1

           IF 'SHOW' = WS-EXISTS1
               DISPLAY SPACES ERASE SCREEN
               PERFORM BORDER
               PERFORM BORDER1
               DISPLAY "===================" AT 0851
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "AEDESYL ATM" AT 0955
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "===================" AT 1051
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "ID NUMBER: " AT 1250 FOREGROUND-COLOR 0
               BACKGROUND-COLOUR 7 ACC-NUM AT 1264
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "NAME: " AT 1450 FOREGROUND-COLOR 0
               BACKGROUND-COLOUR 7 USER_NAME AT 1464
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "AGE: " AT 1650 FOREGROUND-COLOR 0
               BACKGROUND-COLOUR 7 AGE AT 1664
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               DISPLAY "BALANCE: " AT 1850 FOREGROUND-COLOR 0
               BACKGROUND-COLOUR 7 BALANCE AT 1864
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT KYS AT 0202
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                DISPLAY SPACE ERASE SCREEN
                   PERFORM BORDER
                   PERFORM BORDER1
                  DISPLAY "DO YOU WANT TO DO ANOTHER TRANSACTION?(Y/N):"
                   AT 1538 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT WS-EXISTS AT 1582
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   IF WS-EXISTS = 'Y'
                       PERFORM MENU2-PROCEDURE
                   ELSE
                       PERFORM EndPara
                   END-IF

           ELSE IF 'PRINT' = WS-EXISTS1
                DISPLAY SPACE ERASE SCREEN
                   PERFORM BORDER
                   PERFORM RECEIPT-BORDER
                   PERFORM TIME-DATE
                   MOVE 0 TO WS-AMOUNT
                 DISPLAY "AEDESYL BANK" AT 1055
                 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                 DISPLAY "DATE " AT 1247 FOREGROUND-COLOR 0
                 BACKGROUND-COLOR 7
                 DISPLAY "TIME " AT 1347 FOREGROUND-COLOR 0
                 BACKGROUND-COLOR 7

                 DISPLAY "ID NUMBER" AT 1647
                 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                 ACC-NUM AT 1667 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                 DISPLAY "CUSTOMER NAME " AT 1747
                 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                 USER_NAME AT 1767
                 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                DISPLAY "BALANCE " AT 1847
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                BALANCE1 AT 1866 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                DISPLAY "TRANSACTION " AT 1947
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7 WS-AMOUNT AT 1967
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                DISPLAY "---------------------------" AT 2047
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                DISPLAY "NEW BALANCE " AT 2147
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7 BALANCE AT 2167
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT KYS AT 0202
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                   DISPLAY SPACE ERASE SCREEN
                   PERFORM BORDER
                   PERFORM BORDER1
                  DISPLAY "DO YOU WANT TO DO ANOTHER TRANSACTION?(Y/N):"
                   AT 1538 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT WS-EXISTS AT 1582
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   IF WS-EXISTS = 'Y'
                       PERFORM MENU2-PROCEDURE
                   ELSE
                       PERFORM EndPara
                   END-IF
           END-IF.




       TRANSFER-PROCEDURE.
           DISPLAY SPACES ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           MOVE 0 TO ACC-NUM
           MOVE 'N' TO WS-EXISTS

           DISPLAY "ENTER 0 TO EXIT" AT 2352
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 0851
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "AEDESYL ATM" AT 0955
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 1051
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

           DISPLAY "ENTER THE ACCOUNT NUMBER: " AT 1445
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT ACC-NUM AT 1471
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           MOVE ACC-NUM TO WS-KEY

           IF WS-KEY = 0
               DISPLAY SPACE ERASE SCREEN
               PERFORM BORDER
               PERFORM BORDER1
               DISPLAY "DO YOU WANT TO CONTINUE?(Y/N):" AT 1546
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT WS-EXISTS AT 1576
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               IF WS-EXISTS = 'Y'
                  PERFORM MENU2-PROCEDURE
               ELSE
                  PERFORM TRANSFER-PROCEDURE
               END-IF
           END-IF
           READ INFO
               INVALID KEY DISPLAY "ID NUMBER DOESN'T EXISTS" AT 1648
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT KYS AT 0202
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ADD 1 TO WS-CT
                   PERFORM TRANSFER-PROCEDURE UNTIL WS-CT = 3
                   PERFORM EXITING
                   PERFORM EndPara

               NOT INVALID KEY

               DISPLAY "ENTER AMOUNT: " AT 1554
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT WS-AMOUNT1 AT 1568
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               MOVE WS-AMOUNT1 TO WS-AMOUNT
               IF WS-AMOUNT = 0
                   DISPLAY SPACE ERASE SCREEN
                   PERFORM BORDER
                   PERFORM BORDER1
                   DISPLAY "DO YOU WANT TO CONTINUE?(Y/N):" AT 1546
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT WS-EXISTS AT 1576
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   IF WS-EXISTS = 'Y'
                      PERFORM MENU2-PROCEDURE
                   ELSE
                      PERFORM TRANSFER-PROCEDURE
                   END-IF
               END-IF

               DISPLAY SPACE ERASE SCREEN
               PERFORM BORDER
               PERFORM BORDER1
               DISPLAY "ARE YOU SURE WANT TRANSFER " AT 1547
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               WS-AMOUNT1 AT 1653 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               "?(Y/N):" AT 1661 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT WS-EXISTS AT 1668
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               PERFORM PASSWORD-CHECK1

               IF WS-EXISTS = 'Y'
                   ADD WS-AMOUNT TO BALANCE
                   REWRITE INFO-RECORD
                   MOVE 0 TO ACC-NUM



                   MOVE WS-KEY1 TO ACC-NUM
               READ INFO
                   NOT INVALID KEY
                   MOVE BALANCE TO BALANCE1
                   DISPLAY SPACE ERASE SCREEN
                   PERFORM BORDER
                   PERFORM BORDER1
               SUBTRACT WS-AMOUNT FROM BALANCE

               IF BALANCE < 0
                DISPLAY SPACE ERASE SCREEN
               PERFORM BORDER
               PERFORM BORDER1
                DISPLAY "INSUFFICIENT BALANCE" AT 1451
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                DISPLAY "REMAINING BALANCE: " AT 1547
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                BALANCE1 AT 1566
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                DISPLAY "PLEASE TRY AGAIN" AT 1652
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                ACCEPT KYS AT 0202
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                PERFORM TRANSFER-PROCEDURE
            END-IF
               DISPLAY WS-AMOUNT AT 1545
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               "DEDUCTED TO YOUR ACCOUNT" AT 1553
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT KYS AT 0202
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

               REWRITE INFO-RECORD
               DISPLAY "NEW BALANCE: " AT 1650
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               BALANCE AT 1664 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT KYS AT 0202
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               PERFORM RECEIPT

           ELSE
               PERFORM TRANSFER-PROCEDURE
           END-IF.

       UPDT-RECORD.
           DISPLAY SPACES ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           MOVE 0 TO ACC-NUM
           MOVE "Y" TO WS-EXISTS.
           DISPLAY "ENTER 0 TO EXIT" AT 2352
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

           DISPLAY "===================" AT 0851
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "AEDESYL ATM" AT 0955
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 1051
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

           DISPLAY "ENTER YOUR ACCOUNT NUMBER TO UPDATE: " AT 1439
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT ACC-NUM AT 1476
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           MOVE ACC-NUM TO WS-KEY

           IF WS-KEY = 0

              DISPLAY SPACE ERASE SCREEN
              PERFORM BORDER
              PERFORM BORDER1
              DISPLAY "DO YOU WANT TO CONTINUE?(Y/N):" AT 1546
              FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
              ACCEPT WS-EXISTS AT 1576
              FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

              IF WS-EXISTS = 'Y'
                  PERFORM MENU2-PROCEDURE
              ELSE
                  PERFORM UPDT-RECORD
              END-IF
           END-IF

               READ INFO
                   INVALID KEY MOVE "N" TO WS-EXISTS
               CLOSE INFO.

               IF WS-EXISTS = "N"
                   DISPLAY SPACES ERASE SCREEN
                   PERFORM BORDER
                   PERFORM BORDER1
                   DISPLAY "ACCOUNT DOES NOT EXISTS." AT 1449
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT KYS AT 0202
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   PERFORM UPDT-RECORD
               ELSE
                   DISPLAY SPACES ERASE SCREEN
                   PERFORM BORDER
                   PERFORM BORDER1
                   DISPLAY "===================" AT 0851
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   DISPLAY "AEDESYL ATM" AT 0955
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   DISPLAY "===================" AT 1051
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                   DISPLAY "ENTER NEW PIN NUMBER: " AT 1547
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT PASSWORD1 AT 1569
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   MOVE PASSWORD1 TO PASSWORD
                   DISPLAY "ENTER NEW USERNAME: " AT 1647
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT USER_NAME AT 1669
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   DISPLAY "ENTER NEW AGE: " AT 1747
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT AGE AT 1769
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               END-IF

           REWRITE INFO-RECORD
               INVALID KEY DISPLAY "ACCOUNT NOT UPDATED" AT 1854
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           END-REWRITE



           PERFORM MENU2-PROCEDURE UNTIL WS-CHOICE = 7.

       DEL-RECORD.
           DISPLAY SPACES ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           DISPLAY "ENTER 0 TO EXIT" AT 2352
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

           DISPLAY "===================" AT 0851
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "AEDESYL ATM" AT 0955
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "===================" AT 1051
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

           DISPLAY "ENTER ACCOUNT NUMBER TO DELETE: " AT 1444
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT WS-KEY1 AT 1476
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           MOVE WS-KEY1 TO ACC-NUM
           MOVE WS-KEY1 TO WS-KEY

           IF WS-KEY = 0

              DISPLAY SPACE ERASE SCREEN
              PERFORM BORDER
              PERFORM BORDER1
              DISPLAY "DO YOU WANT TO CONTINUE?(Y/N):" AT 1546
              FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
              ACCEPT WS-EXISTS AT 1576
              FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

              IF WS-EXISTS = 'Y'
                  PERFORM MENU2-PROCEDURE
              ELSE
                  PERFORM DEL-RECORD
              END-IF
           END-IF

           DELETE INFO
               INVALID KEY DISPLAY "PIN DOES NOT EXIST" AT 1551
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               NOT INVALID KEY
               DISPLAY SPACE ERASE SCREEN
               PERFORM BORDER
               PERFORM BORDER1
               DISPLAY "DELETE SUCCESSFUL" AT 1552
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               ACCEPT KYS AT 0202
               FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           END-DELETE

           PERFORM MENU1-PROCEDURE.

       EXITING.
           DISPLAY SPACES ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           DISPLAY "TOO MANY ATTEMPTS!" AT 1451
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   DISPLAY "EXITING!!!" AT 1556
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT KYS AT 0202
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7.

       RECEIPT.
           DISPLAY SPACE ERASE SCREEN
           PERFORM BORDER
           PERFORM BORDER1
           MOVE 'N' TO WS-EXISTS
           DISPLAY "DO YOU WANT A RECEIPT?(Y/N):" AT 1546
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ACCEPT WS-EXISTS AT 1574
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
               IF WS-EXISTS = 'Y'
                   DISPLAY SPACE ERASE SCREEN
                   PERFORM BORDER
                   PERFORM RECEIPT-BORDER
                   PERFORM TIME-DATE
                 DISPLAY "AEDESYL BANK" AT 1055
                 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                 DISPLAY "DATE " AT 1247 FOREGROUND-COLOR 0
                 BACKGROUND-COLOR 7
                 DISPLAY "TIME " AT 1347 FOREGROUND-COLOR 0
                 BACKGROUND-COLOR 7

                 DISPLAY "ID NUMBER" AT 1647
                 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                 ACC-NUM AT 1667 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                 DISPLAY "CUSTOMER NAME " AT 1747
                 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                USER_NAME AT 1767 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                DISPLAY "BALANCE " AT 1847
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                BALANCE1 AT 1866 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                DISPLAY "TRANSACTION " AT 1947
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7 WS-AMOUNT AT 1967
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                DISPLAY "---------------------------" AT 2047
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                DISPLAY "NEW BALANCE " AT 2147
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7 BALANCE AT 2167
                FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT KYS AT 0202
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7

                   DISPLAY SPACE ERASE SCREEN
                   PERFORM BORDER
                   PERFORM BORDER1
                  DISPLAY "DO YOU WANT TO DO ANOTHER TRANSACTION?(Y/N):"
                   AT 1538 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT WS-EXISTS AT 1582
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   IF WS-EXISTS = 'Y'
                       PERFORM MENU2-PROCEDURE
                   ELSE
                       PERFORM EndPara
                   END-IF

               ELSE
                   DISPLAY SPACE ERASE SCREEN
                   PERFORM BORDER
                   PERFORM BORDER1
                  DISPLAY "DO YOU WANT TO DO ANOTHER TRANSACTION?(Y/N):"
                   AT 1538 FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   ACCEPT WS-EXISTS AT 1582
                   FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
                   IF WS-EXISTS = 'Y'
                       PERFORM MENU2-PROCEDURE
                   ELSE
                       PERFORM EndPara
                   END-IF
               END-IF



           STOP RUN.

       TIME-DATE.
           MOVE FUNCTION CURRENT-DATE TO CurrentDate.
           ACCEPT CURRENT-TIME FROM TIME.
           MOVE CurrentDate(1:4) TO FormattedDate(1:4).
           MOVE "/" TO FormattedDate(5:1).
           MOVE CurrentDate(5:2) TO FormattedDate(6:2).
           MOVE "/" TO FormattedDate(8:1).
           MOVE CurrentDate(7:2) TO FormattedDate(9:2).

           DISPLAY FormattedDate AT 1263 FOREGROUND-COLOR 0
           BACKGROUND-COLOR 7

           MOVE CURRENT-TIME(1:2) TO HH
           MOVE ":" TO FormattedTime(1:1)
           MOVE CURRENT-TIME(3:2) TO FormattedTime(2:2)
      *>      MOVE ":" TO FormattedTime(4:1)
      *>      MOVE CURRENT-TIME(5:2) TO FormattedTime(5:2)
      *>      IF NOT USING SECONDS FOR DISPLAYING CURRENT TIME
           IF HH IS NUMERIC AND HH > 12
               SUBTRACT 12 FROM HH
               MOVE 'PM' TO  D-N
           ELSE
               MOVE 'AM' TO D-N
           END-IF.

            DISPLAY HH AT 1363 FOREGROUND-COLOR 0
           BACKGROUND-COLOR 7 FormattedTime AT 1365
           FOREGROUND-COLOR 0 BACKGROUND-COLOR 7
           D-N AT 1369 FOREGROUND-COLOR 0
           BACKGROUND-COLOR 7.

       BORDER.
           DISPLAY SPACE BACKGROUND-COLOR 7
           SET BORDER-X TO 2
           PERFORM 119 TIMES
           DISPLAY "*" LINE 1 POSITION BORDER-X
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "*" LINE 30 POSITION BORDER-X
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ADD 1 TO BORDER-X
           END-PERFORM.

           SET BORDER-Y TO 1
           PERFORM 30 TIMES
           DISPLAY "*" LINE BORDER-Y POSITION 1
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "*" LINE BORDER-Y POSITION 120
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ADD 1 TO BORDER-Y
           END-PERFORM.

       BORDER1.
           SET BORDER-X TO 30
           PERFORM UNTIL BORDER-X > 91
           DISPLAY "=" LINE 6 POSITION BORDER-X
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "=" LINE 24 POSITION BORDER-X
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ADD 1 TO BORDER-X
           END-PERFORM

           SET BORDER-Y TO 7
           PERFORM UNTIL BORDER-Y = 24
           DISPLAY "||" LINE BORDER-Y POSITION 30
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "||" LINE BORDER-Y POSITION 90
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ADD 1 TO BORDER-Y
           END-PERFORM.

       RECEIPT-BORDER.

           SET BORDER-X TO 45
           PERFORM UNTIL BORDER-X > 76
           DISPLAY "*" LINE 8 POSITION BORDER-X
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "*" LINE 23 POSITION BORDER-X
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ADD 1 TO BORDER-X
           END-PERFORM

           SET BORDER-Y TO 8
           PERFORM UNTIL BORDER-Y = 23
           DISPLAY "*" LINE BORDER-Y POSITION 45
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           DISPLAY "*" LINE BORDER-Y POSITION 76
           FOREGROUND-COLOR 0 BACKGROUND-COLOUR 7
           ADD 1 TO BORDER-Y
           END-PERFORM.
