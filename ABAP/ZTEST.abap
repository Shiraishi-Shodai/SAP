*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTEST.

*&---------------------------------------------------------------------*
*& 変数偏
*&---------------------------------------------------------------------*

DATA :
      VARI1 TYPE I VALUE 10,
      VARI2 TYPE D,
      VARI3 TYPE C LENGTH 10,
      VARI4 TYPE N LENGTH 10,
*     P型のLENGTHは扱えるバイト数(小数点を合わせて)
*     1桁の数字を4ビットで表すため、8バイトでは16桁扱える。ただし符号も含めてであるため、
*     数字として扱えるのは15桁まで
      VARI5 TYPE P LENGTH 8 DECIMALS 2,
      VARI6 TYPE P LENGTH 8 DECIMALS 2.
*
VARI2 = '20260911'.
VARI4 = '12345'.
VARI5 = '1234567890123.78'.
VARI6 = VARI5 * '2.0'.

WRITE:
  VARI2, VARI4, VARI5, VARI6.

*&---------------------------------------------------------------------*
*& 定数偏
*&---------------------------------------------------------------------*
*CONSTANTS :
*  C_TEXT TYPE STRING VALUE 'HELLO WORLD',
*  C_NUMBER TYPE I VALUE 12345.
*
*WRITE :/
*  C_TEXT, C_NUMBER.

*&---------------------------------------------------------------------*
*& 暗黙的な型変換
*&---------------------------------------------------------------------*
*DATA :
*      MY_INT TYPE I,
*      MY_PACK TYPE P LENGTH 3 DECIMALS 2,
*      MY_CHAR10 TYPE C LENGTH 10 VALUE 'ABCDEFGHIJ',
*      MY_CHAR4 TYPE C LENGTH 4,
*      MY_STRING TYPE STRING.
*
*MY_INT = '1234'.
*MY_PACK = '-123.12'.
*MY_CHAR4 = MY_CHAR10.
*MY_STRING =  'HELLO MY NAME IS SHOTA!  '.
*
*WRITE :
*  MY_INT,
*  / MY_PACK,
*  / MY_CHAR4,
*  / MY_STRING.

*&---------------------------------------------------------------------*
*& 変数のリセット
*&---------------------------------------------------------------------*
*DATA :
*      MY_VARI1 TYPE I,
*      MY_VARI2 TYPE I VALUE 1234,
*      MY_VARI3 TYPE STRING.
*
*MY_VARI1 = MY_VARI2.
*MY_VARI3 = 'HELLO WORLD!'.
*
*WRITE :
*  / MY_VARI1,
*  / MY_VARI2,
*  / MY_VARI3.
*
*
*CLEAR :
*  MY_VARI1,
*  MY_VARI2,
*  MY_VARI3.
*
*WRITE :
*  / MY_VARI1,
*  / MY_VARI2,
*  / MY_VARI3.
