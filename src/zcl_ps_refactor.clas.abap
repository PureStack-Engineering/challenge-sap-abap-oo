CLASS zcl_ps_refactor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA mv_result TYPE f.

    METHODS calculate_loan
      IMPORTING
        iv_customer TYPE string
        iv_amount   TYPE f
        iv_years    TYPE i
      RETURNING
        VALUE(rv_rate) TYPE f.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_ps_refactor IMPLEMENTATION.

  METHOD calculate_loan.
    DATA lv_score TYPE i.

    " Logic for VIP Customers
    IF iv_customer = 'VIP'.
      lv_score = 10.
    ELSEIF iv_customer = 'STANDARD'.
      lv_score = 5.
    ELSE.
      lv_score = 1.
    ENDIF.

    " Logic for High Risk
    IF iv_amount > 100000.
      IF lv_score < 5.
        rv_rate = 5.0.
      ELSE.
        rv_rate = 3.5.
      ENDIF.
    ELSE.
      " Low amount logic
      IF iv_years > 10.
         rv_rate = 2.5.
      ELSE.
         rv_rate = 1.5.
      ENDIF.
    ENDIF.

    " Weird business exception
    IF iv_customer = 'EMPLOYEE'.
       rv_rate = 0.5.
    ENDIF.

    mv_result = rv_rate.

  ENDMETHOD.
ENDCLASS.
