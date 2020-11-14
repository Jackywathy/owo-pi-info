// #![crate_type="staticlib"]
#![no_main]
#![no_std]
#![feature(asm)]

use core::panic::PanicInfo;

/// owo


/// ! return = doesnt return
#[inline(always)]
// #[link_name="_start"]
#[export_name="_start"]
fn wait_forever() -> ! {
	unsafe {
		loop {
			asm!(
				"wfe",
				options(nomem, nostack, preserves_flags))
		}
	}
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    // do absolutely nothing
    loop {}
}