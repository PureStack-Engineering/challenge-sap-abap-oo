CLASS zcl_ps_refactor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_invoice,
             id     TYPE c LENGTH 10,
             amount TYPE p LENGTH 10 DECIMALS 2,
             status TYPE c LENGTH 1, " 'P' Paid, 'O' Open
           END OF ty_invoice.
    TYPES tt_invoices TYPE STANDARD TABLE OF ty_invoice WITH EMPTY KEY.

    METHODS calculate_total
      IMPORTING
        it_invoices    TYPE tt_invoices
      RETURNING
        VALUE(rv_total) TYPE p.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_ps_refactor IMPLEMENTATION.

  METHOD calculate_total.
    " TODO: Refactor logic here using ABAP 7.40+ syntax (REDUCE, etc.)
    " The candidate must implement this method.
    " If they leave it empty, abaplint logic might pass depending on config,
    " but you want to check their code style manually or add a failing syntax rule.
    
    rv_total = 0.
  ENDMETHOD.

ENDCLASS.
