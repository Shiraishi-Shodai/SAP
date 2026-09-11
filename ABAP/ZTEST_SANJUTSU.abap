*&---------------------------------------------------------------------*
*& Report ZLEARN_SANJUTSU
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLEARN_SANJUTSU.

*&---------------------------------------------------------------------*
*& 算術
*&---------------------------------------------------------------------*
*DATA RESULT TYPE I.
*
*RESULT = 2 + 3.
*RESULT = 2 - 3.
*RESULT = 2 * 3.
*RESULT = 2 / 3.
*
**RESULT = SQRT( 2 ).
**RESULT = IPOW( BASE = 2 EXP = 3 ).
*
**RESULT = ( 8 * 7 - 6 ) / ( 5 + 4 ). "結果は6。割り算の結果、小数となった値は四捨五入される
*RESULT = 8 * 7 - 6 / 5 + 4.
*
*WRITE :
*  / '結果発表!!', RESULT.

*&---------------------------------------------------------------------*
*& 文字列処理
*&---------------------------------------------------------------------*
TYPES T_AMOUNT TYPE P LENGTH 8 DECIMALS 2.

DATA :
      AMOUNT  TYPE T_AMOUNT VALUE '3.30',
      AMOUNT1 TYPE T_AMOUNT VALUE '1.20',
      AMOUNT2 TYPE T_AMOUNT VALUE '2.10',
      AMOUNT3 TYPE STRING.

DATA :
      THE_DATE  TYPE D                     VALUE '19891109',
      MY_NUMBER TYPE P LENGTH 3 DECIMALS 2 VALUE '-273.15'.

DATA :
  PART1 TYPE STRING VALUE 'HELLO',
  PART2 TYPE STRING VALUE 'WORLD'.

* String Templates
**********************************************************************
*DATA(TEXT) = |HELLO WORLD|.
*DATA(TEXT) = |TOTAL: { AMOUNT } EUR|.
*DATA(TEXT) = |TOTAL: { AMOUNT1 + AMOUNT2 } EUR|.
*AMOUNT3 = TEXT.

* Format Options
**********************************************************************
"DATE
*DATA(TEXT) = |RAW DATE: { THE_DATE             }|.
*DATA(TEXT) = |ISO DATE: { THE_DATE DATE = ISO  }|.
*DATA(TEXT) = |USER DATE:{ THE_DATE DATE = USER }|.

"NUMBER
*DATA(TEXT) = |RAW NUMBER { MY_NUMBER                    }|.
*DATA(TEXT) = |USER FORMAT{ MY_NUMBER NUMBER = USER      }|.
*DATA(TEXT) = |SIGN RIGHT { MY_NUMBER SIGN = RIGHT       }|.
*DATA(TEXT) = |SCIENTIFIC { MY_NUMBER STYLE = SCIENTIFIC }|.

* String expression (concatenation Operator)
**********************************************************************
*DATA(TEXT) = PART1 && PART2.
*DATA(TEXT) = PART1 && | | && PART2.
DATA(TEXT) = |{ AMOUNT1 } + { AMOUNT2 }| &&
             | = | &&
             | { AMOUNT1 + AMOUNT2 }|.

WRITE :/ TEXT.