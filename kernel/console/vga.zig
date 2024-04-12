// function to write characters to the screen in vga textmode
pub fn writeCharacter(char: u8, fg: u8, bg: u8, x: u8, y: u8) void {
    // set the color byte up
    var color_byte: u8 = (bg << 4) | (fg & 0x0f);
    // set the memory location
    var memory_location: *u16 = @ptrFromInt(@as(u32, 0xb8000) + (@as(u16, y) * 160) + (x * 2));
    // set the character
    memory_location.* = (@as(u16, color_byte) << 8) | char;
}

// todo: vga framebuffer mode