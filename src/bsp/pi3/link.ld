// most of this script is taken from here
// https://jsandler18.github.io/explanations/linker_ld.html

ENTRY(_start)

SECTIONS
{
	. = 0x8000;
	.text: {*(.text)};
	. = ALIGN(4096); /* align to page size */
	.rodata: {*{.rodata}};
	.data: {*(.data))};
	.bss: {*(.bss)};
	. = ALIGN(4096);
}