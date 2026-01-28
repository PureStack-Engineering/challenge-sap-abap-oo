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
