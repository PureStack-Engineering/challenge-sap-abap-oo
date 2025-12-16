CLASS zcl_ps_refactor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    " 🚨 BAD PRACTICE: Public attribute, no strict typing, poor naming
    DATA: mv_result TYPE f.

    " 🚨 BAD PRACTICE: One giant method to rule them all
    METHODS: calculate_loan
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
    " 🍝 LEGACY SPAGHETTI CODE START
    " The candidate must refactor this into Clean ABAP

    DATA: lv_score TYPE i.

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
        rv_rate = 5.0. " High interest
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

" 🧪 TEST CLASSES (The Safety Net)
" The candidate must NOT break these tests while refactoring.

CLASS ltcl_refactor_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: mo_cut TYPE REF TO zcl_ps_refactor.

    METHODS: setup.
    METHODS: calculate_vip_high_amount FOR TESTING.
    METHODS: calculate_employee FOR TESTING.
    METHODS: calculate_standard_low_amount FOR TESTING.
ENDCLASS.

CLASS ltcl_refactor_test IMPLEMENTATION.

  METHOD setup.
    CREATE OBJECT mo_cut.
  ENDMETHOD.

  METHOD calculate_vip_high_amount.
    DATA(lv_rate) = mo_cut->calculate_loan(
      iv_customer = 'VIP'
      iv_amount   = 200000
      iv_years    = 5 ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_rate
      exp = '3.5'
      msg = 'VIP with high amount should get 3.5%' ).
  ENDMETHOD.

  METHOD calculate_employee.
    DATA(lv_rate) = mo_cut->calculate_loan(
      iv_customer = 'EMPLOYEE'
      iv_amount   = 50000
      iv_years    = 20 ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_rate
      exp = '0.5'
      msg = 'Employees always get 0.5%' ).
  ENDMETHOD.

  METHOD calculate_standard_low_amount.
    DATA(lv_rate) = mo_cut->calculate_loan(
      iv_customer = 'STANDARD'
      iv_amount   = 1000
      iv_years    = 2 ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_rate
      exp = '1.5'
      msg = 'Standard low amount short term should be 1.5%' ).
  ENDMETHOD.

ENDCLASS.
