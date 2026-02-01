ENTRY(_start)
PHDRS { text PT_LOAD; data PT_LOAD; }

MEMORY {
  mrom  (r x) : ORIGIN = 0x20000000, LENGTH = 4K
  flash (r x) : ORIGIN = 0x30000000, LENGTH = 16M
  sram  (rwx) : ORIGIN = 0x0f000000, LENGTH = 8K
  /* psram (rwx) : ORIGIN = 0x80000000, LENGTH = 4M
  sdram (rwx) : ORIGIN = 0xa0000000, LENGTH = 64M */
}

SECTIONS {
  /* _pmem_start and _entry_offset are defined in LDFLAGS */
  /* . = _pmem_start + _entry_offset; */
  . = ORIGIN(flash);

  .text : {
    *(entry)
    *(.text*)
  } > flash AT> flash : text

  etext = .;
  _etext = .;

  .rodata : {
    *(.rodata*)
  } > flash AT> flash

  .data : {
    _data_vma = .;           /* VMA起始地址(在sram中) */
    *(.sdata*)
    *(.data*)
  } > sram AT> flash : data

  _data_lma = LOADADDR(.data); /* LMA起始地址(在flash中) */
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
  end = .;
  _end = .;

  /* _heap_start = ALIGN(0x100);
  . = 0x0f000000 + 0x2000; 
  _stack_pointer = .;  
  end = .;
  _end = .;
  _stack_top = _stack_pointer - 0x800;   
  _heap_end = _stack_top; */


}
