ENTRY(_start)
PHDRS { text PT_LOAD; data PT_LOAD; }

MEMORY {
  sram  (rwx) : ORIGIN = 0x0f000000, LENGTH = 8K
}

SECTIONS {
  /* Link everything to SRAM */
  . = ORIGIN(sram);

  .text : {
    *(entry)
    *(.text*)
  } > sram AT> sram : text

  etext = .;
  _etext = .;

  .rodata : {
    *(.rodata*)
  } > sram AT> sram

  .data : {
    _data_vma = .;
    *(.sdata*)
    *(.data*)
  } > sram AT> sram : data

  _data_lma = LOADADDR(.data);
  edata = .;
  _data = .;
  data_lenth = edata - _data_vma;

  .bss : {
    _bss_start = .;
    *(.bss*)
    *(.sbss*)
    *(.scommon)
  } > sram

  _bss_end = .;

  _stack_bottom = 0x0f002000; /* SRAM_END */
  _stack_pointer = _stack_bottom;
  _stack_top = _stack_bottom - 0x800;

  _heap_start = _bss_end;
  _heap_end = _stack_top;
}
