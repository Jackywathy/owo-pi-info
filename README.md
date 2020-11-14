# owo-pi-info
info repository for pi os

Research: 
https://jsandler18.github.io/tutorial/dev-env.html

https://en.wikipedia.org/wiki/L4_microkernel_family

## L4 Microkernels
- A concept is tolerated inside the (micro) kernel only if moving it outside the kernel would prevent the implementation of the system's required functionality
- basic mechanisms required like:
  - address spaces (page tables, memory protection, virtual memory)
  - threads and scheduling
  - inter process communication (IPC)
  - file system support (VFS)
  - any additional ones???

https://github.com/rust-embedded/rust-raspberrypi-OS-tutorials


rust options:
rustup toolchain add nightly-2020-10-04
rustup default nightly-2020-10-04
rustup component add llvm-tools-preview
rustup target add aarch64-unknown-none-softfloat
cargo install cargo-binutils



put platform agnostic code in the src/component.rs or src/component/aaaa.rs


Linking:
- a linker combines input files into a single output files
	- each input is in a format called a object file
	- output is an executable (but also an object)
- each section in an object file has a name and a size
	- most sections have a block of data (known as the contents)
	- section may be loadable (should be loaded when program is run)
	- a section with no contents may be allocatable, but not initalized
	- a section that is neither usually contains some sort of debug info
- in a linker script, . means the current address. You can assign the current address and assign things to the current address
- .text is where executable code goes
	.text : {*(.text)} 
		- *(.text) are the names of the input sections
		- * matches any file name
- .rodata is read only
- .data is global variables that are initalized at compile time
- .bss is where uninitalized global variables are placed
- ENTRY(symbol) is an elf feature that sets the program enty in the ELF header of your executable. this address can differ from the start 
