ENTRY(_start)
PHDRS {
  entry PT_LOAD;
  ssbl PT_LOAD;
  text PT_LOAD;
  rodata PT_LOAD;
  data PT_LOAD;
}

MEMORY {
  mrom  (r x) : ORIGIN = 0x20000000, LENGTH = 4K
  flash (r x) : ORIGIN = 0x30000000, LENGTH = 16M
  sram  (rwx) : ORIGIN = 0x0f000000, LENGTH = 8K
  psram (rwx) : ORIGIN = 0x80000000, LENGTH = 4M
  /* sdram (rwx) : ORIGIN = 0xa0000000, LENGTH = 64M */
}

SECTIONS {
  . = ORIGIN(flash);

  /* entry段：VMA和LMA都在flash */
  .entry : {
    /* *(.entry) */
    *(entry)
  } > flash AT> flash : entry

  _flash_offset = .;

  /* SSBL段：VMA在SRAM，LMA在flash（紧接着.entry） */
  .ssbl : AT(_flash_offset) {
    _ssbl_vma = .;
    *(.ssbl)
    _ssbl_vma_end = .;
  } > sram : ssbl

  _ssbl_lma = LOADADDR(.ssbl);
  ssbl_length = _ssbl_vma_end - _ssbl_vma;
  _flash_offset = _flash_offset + ssbl_length;

  /* .text段：VMA在psram，LMA在flash（紧接着.ssbl） */
  .text : AT(_flash_offset) {
    _text_vma = .;
    *(.text*)
    _text_vma_end = .;
  } > psram : text

  etext = .;
  _etext = .;

  _text_lma = LOADADDR(.text);
  text_length = _text_vma_end - _text_vma;
  _flash_offset = _flash_offset + text_length;

  /* .rodata段：VMA和LMA都在flash（XIP模式，不需要复制） */
  .rodata _flash_offset : AT(_flash_offset) {
    _rodata_vma = .;
    *(.srodata*)
    *(.rodata*)
    _rodata_vma_end = .;
  } : rodata

  _rodata_lma = LOADADDR(.rodata);
  rodata_length = _rodata_vma_end - _rodata_vma;
  _flash_offset = _flash_offset + rodata_length;


  /* .data段：VMA在psram，LMA在flash（紧接着.data.extra） */
  .data : AT(_flash_offset) {
    _data_vma = .;
    *(.sdata*)
    *(.data*)
    __fsymtab_start = .;
    KEEP(*(FSymTab))
    __fsymtab_end = .;
    . = ALIGN(8);
    __vsymtab_start = .;
    KEEP(*(VSymTab))
    __vsymtab_end = .;
    . = ALIGN(8);
    __rt_init_start = .;
    KEEP(*(SORT(.rti_fn*)))
    __rt_init_end = .;
    . = ALIGN(8);
    __rt_utest_tc_tab_start = .;
    KEEP(*(UtestTcTab))
    __rt_utest_tc_tab_end = .;
    . = ALIGN(8);
    __am_apps_data_start = .;
    *(__am_apps.data*)
    *(__am_apps.sdata*)
    __am_apps_data_end = .;
    . = ALIGN(8);
    _data_vma_end = .;
  } > psram : data

  _data_lma = LOADADDR(.data);
  data_length = _data_vma_end - _data_vma;
    edata = .;
  _data = .;

  .bss : {
	_bss_start = .;
    *(.bss*)
    *(.sbss*)
    *(.scommon)
    . = ALIGN(8);
    __am_apps_bss_start = .;
    *(__am_apps.bss*)
    *(__am_apps.sbss*)
    *(__am_apps.scommon*)
    __am_apps_bss_end = .;
    . = ALIGN(8);
  } > psram

  _bss_end = .;

  _stack_bottom = 0x80400000; /* PSRAM_END */
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
