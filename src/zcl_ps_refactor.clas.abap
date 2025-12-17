CLASS zcl_ps_refactor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS calculate_loan
      IMPORTING
        iv_amount      TYPE f
        iv_customer_type TYPE string
      RETURNING
        VALUE(rv_rate) TYPE f.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_ps_refactor IMPLEMENTATION.

  METHOD calculate_loan.
    " TODO: Refactor this method to use Modern ABAP (7.50+)
    " Current State: Legacy, Nested IFs, Magic Numbers.

    DATA: lv_interest TYPE f.

    IF iv_amount > 100000.
      IF iv_customer_type = 'VIP'.
        MOVE 1.5 TO lv_interest.
      ELSE.
        MOVE 3.5 TO lv_interest.
      ENDIF.
    ELSE.
      IF iv_customer_type = 'VIP'.
        MOVE 2.0 TO lv_interest.
      ELSE.
        MOVE 5.0 TO lv_interest.
      ENDIF.
    ENDIF.

    rv_rate = lv_interest.

  ENDMETHOD.
ENDCLASS.
