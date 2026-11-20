*&---------------------------------------------------------------------*
*& Report ZLEARN_DB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLEARN_DB.

* Declarations
**********************************************************************

"  Internal tables
*DATA NUMBERS TYPE TABLE OF I.
*
*"Table type (local)
*TYPES TT_STRING TYPE TABLE OF STRING.
*DATA TEXT1       TYPE TT_STRING.
*
*" Table type (global)
*DATA TEXT2 TYPE STRING_TABLE.
*
*" WORK AREA
*DATA NUMBER TYPE I VALUE 1234.
*DATA TEXT   TYPE STRING.

* Example 1: APPEND
**********************************************************************
*APPEND 4711       TO NUMBERS.
*APPEND NUMBER     TO NUMBERS.
*APPEND NUMBER * 2 TO NUMBERS.

*LOOP AT NUMBERS INTO DATA(WA_NUMBER).
*  WRITE :/ WA_NUMBER.
*ENDLOOP.


* Example 2: CLEAR
**********************************************************************
*CLEAR NUMBERS.
*
*LOOP AT NUMBERS INTO DATA(WA_NUMBER).
*  WRITE :/ WA_NUMBER.
*ENDLOOP.

* Example 3: table expression
**********************************************************************
*APPEND 4711       TO NUMBERS.
*APPEND NUMBER     TO NUMBERS.
*APPEND NUMBER * 2 TO NUMBERS.
*
*TRY.
*  NUMBER = NUMBERS[ 3 ].
*
*  WRITE NUMBER.
*
*  CATCH CX_SY_ITAB_LINE_NOT_FOUND.
*    WRITE : | EXCEPTION !!|.
*ENDTRY.

* Example 5: Inline declaration in LOOP ... ENDLOOP
**********************************************************************
*LOOP AT NUMBERS INTO DATA(NUMBER_LINE).
*  WRITE :/ |CURRENT NUMBER IS { NUMBER_LINE } |.
*ENDLOOP.


* Example 6: フィボナッチ
**********************************************************************
CONSTANTS :
  MAX_COUNT TYPE I VALUE 10.

DATA :
  IT_NUMBERS TYPE STANDARD TABLE OF I.

DO MAX_COUNT TIMES.
  CASE SY-INDEX.
    WHEN 1.
      APPEND 0 TO IT_NUMBERS.
    WHEN 2.
      APPEND 1 TO IT_NUMBERS.
    WHEN OTHERS.
      APPEND IT_NUMBERS[ SY-INDEX - 2 ]
           + IT_NUMBERS[ SY-INDEX - 1 ]
          TO IT_NUMBERS.
  ENDCASE.

  WRITE : / |CURRENT INDEX IS  { SY-INDEX } | &&
            |SEA YOU LATER|.
ENDDO.

* LOOPでは、SY-INDEXはカウントされない.
*WRITE | HELLO { SY-INDEX }, { SY-SUBRC }|.

*CLEAR IT_NUMBERS.

LOOP AT IT_NUMBERS INTO DATA(WA_NUMBER).
  WRITE :/  |INDEX = { SY-TABIX } |,
            |VALUE = { WA_NUMBER }|.
ENDLOOP.


*WRITE | HELLO { SY-INDEX }, { SY-SUBRC }|.