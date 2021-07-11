const std = @import("std");

const byteValue: u8 = 42;
const bigValue = @as(u32, byteValue) * 10;

pub fn main() void {
    std.debug.print("Value of bigValue: {d}!\n", .{bigValue});
}
