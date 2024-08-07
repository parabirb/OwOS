// deps
const vga = @import("vga.zig");

// cursor struct
const Cursor = packed struct {
    x: u8,
    y: u8
};
var cursor = Cursor {
    .x = 0,
    .y = 0
};

// char map for hex
const char_map = [_]u8{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

// scroll function
fn scroll() void {
    // for each row
    for (1..25) |row| {
        // get the row before
        const lastRow: u32 = 0xb8000 + (row - 1) * 160;
        // get this row
        const thisRow: u32 = lastRow + 160;
        // for each byte of this row, replace the last row's byte with the new one
        for (0..160) |byte| {
            @as(*u8, @ptrFromInt(lastRow + byte)).* = @as(*u8, @ptrFromInt(thisRow + byte)).*;
            // if we're in the last row, clear the corresponding byte as well
            if (row == 24) @as(*u8, @ptrFromInt(thisRow + byte)).* = 0;
        }
    }
}

// put char
pub fn putChar(char: u8, fg: u8, bg: u8) void {
    // if the character's a newline or if we're about to go past the column limit
    if ((char == '\n') or (cursor.x == 79)) {
        // set the cursor's x to zero
        cursor.x = 0;
        // scroll if we're at the row limit
        if (cursor.y == 24) {
            scroll();
        }
        // otherwise, just increment the y
        else {
            cursor.y += 1;
        }
        // return if the character's just a newline
        if (char == '\n') return;
    }
    // write the character
    vga.writeCharacter(char, fg, bg, cursor.x, cursor.y);
    // increment the cursor
    cursor.x += 1;
}

// put string
pub fn putString(string: []const u8, fg: u8, bg: u8) void {
    for (0..string.len) |i| {
        putChar(string[i], fg, bg);
    }
}

// gay put string
pub fn putStringGay(string: []const u8) void {
    for (0..string.len) |i| {
        putChar(string[i], @truncate(i % 7 + 9), 0x0);
    }
}

// put u32
pub fn putU32(int: u32) void {
    // put the hex string first
    putString("0x", 0xf, 0x0);
    // then for each letter
    for (0..8) |i| {
        putChar(char_map[(int >> @truncate((7 - i) * 4)) & 0xf], 0xf, 0x0);
    }
}

// put u16
pub fn putU16(int: u16) void {
    // put the hex string first
    putString("0x", 0xf, 0x0);
    // then for each letter
    for (0..4) |i| {
        putChar(char_map[(int >> @truncate((3 - i) * 4)) & 0xf], 0xf, 0x0);
    }
}

// pub u8
pub fn putU8(int: u16) void {
    // put the hex string first
    putString("0x", 0xf, 0x0);
    // then for each letter
    for (0..2) |i| {
        putChar(char_map[(int >> @truncate((1 - i) * 4)) & 0xf], 0xf, 0x0);
    }
}