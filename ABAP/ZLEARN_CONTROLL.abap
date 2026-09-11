*&---------------------------------------------------------------------*
*& Report ZLEARN_CONTROLL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLEARN_CONTROLL.

*&---------------------------------------------------------------------*
*& IF文
*&---------------------------------------------------------------------*
* Declarations
**********************************************************************
*DATA C_NUMBER TYPE I VALUE 0.
*DATA C_NUMBER TYPE I VALUE 1.
*DATA C_NUMBER TYPE I VALUE 2.
*DATA C_NUMBER TYPE I VALUE -1.
*DATA C_NUMBER TYPE I VALUE -2.

* Example 1: Simple IF ... ENDIF.
**********************************************************************

*IF C_NUMBER = 0.
*  WRITE |THE VALUE OF C_NUMBER EQUEALS ZERO : { C_NUMBER }|.
*ELSE.
*  WRITE |THE VALUE OF C_NUMBER NOT EQUEALS ZERO : { C_NUMBER }|.
*ENDIF.

* Example 2: Optional Branches ELSEIF and ELSE
**********************************************************************
*IF C_NUMBER = 0.
*  WRITE |THE VALUE OF C_NUMBER EQUEALS ZERO : { C_NUMBER }|.
*ELSEIF C_NUMBER > 0.
*  WRITE |THE VALUE OF C_NUMBER IS LARGE THAN ZERO : { C_NUMBER }|.
*ELSE.
*  WRITE |THE VALUE OF C_NUMBER IS LESS THAN ZERO : { C_NUMBER }|.
*ENDIF.

* Example 3: CASE ... ENDCASE
**********************************************************************
*CASE C_NUMBER.
*  WHEN 0.
*    WRITE / |THE VALUE OF C_NUMBER EQUEALS ZERO : { C_NUMBER }|.
*  WHEN 1.
*    WRITE / |THE VALUE OF C_NUMBER EQUEALS ONE  : { C_NUMBER }|.
*  WHEN 2.
*    WRITE / |THE VALUE OF C_NUMBER EQUEALS TWO  : { C_NUMBER }|.
*  WHEN OTHERS.
*    WRITE / |THE VALUE OF C_NUMBER EQUEAL NON OF THE ABOVE : { C_NUMBER }|.
*ENDCASE.

*&---------------------------------------------------------------------*
*& 例外処理
*&---------------------------------------------------------------------*
* Declarations
**********************************************************************
DATA RESULT  TYPE I.
DATA NUMBERS TYPE TABLE OF I.

* Preparation
**********************************************************************
APPEND 123 TO NUMBERS.

* Example 1: Conversion Error (no Number)
**********************************************************************
*CONSTANTS C_TEXT TYPE STRING VALUE 'ABC'.
*CONSTANTS C_TEXT TYPE STRING VALUE '123'.

*TRY.
*  RESULT = C_TEXT.
*  WRITE RESULT.
*
*  CATCH CX_SY_CONVERSION_NO_NUMBER.
*    WRITE |ERROR: { C_TEXT } IS NOT A NUMBER!|.
*ENDTRY.

* Example 2: Division by Zero
**********************************************************************
*CONSTANTS C_NUMBER TYPE I VALUE 0.
*CONSTANTS C_NUMBER TYPE I VALUE 7.

*TRY.
*  RESULT = 77 / C_NUMBER.
*  WRITE RESULT.
*  CATCH CX_SY_ZERODIVIDE.
*    WRITE |77 DIVIDED BY { C_NUMBER } EQUALS { RESULT }|.
*ENDTRY.

*&---------------------------------------------------------------------*
*& 繰り返し
*&---------------------------------------------------------------------*
* Declarations
**********************************************************************

    CONSTANTS c_number TYPE i VALUE 3.
*    CONSTANTS c_number TYPE i VALUE 5.
*    CONSTANTS c_number TYPE i VALUE 10.

    DATA number TYPE i.

* Example 1: DO ... ENDDO with TIMES
**********************************************************************
*DO C_NUMBER TIMES.
*  WRITE :/ C_NUMBER.
*ENDDO.

* Example 2: DO ... ENDDO with Abort Condition
**********************************************************************
NUMBER = C_NUMBER + 2.

DO.
  WRITE :/ |{ SY-INDEX }: VALUE OF NUMBER : { NUMBER } |.
  NUMBER = NUMBER - 1.

  IF NUMBER <= C_NUMBER.
    EXIT.
  ENDIF.
ENDDO.