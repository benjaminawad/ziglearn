const std = @import("std");

const byte_value: u8 = 42;
const big_value = @as(u32, byte_value) * 10;

pub fn main() void {
    std.debug.print("Value of big_value: {d}!\n", .{big_value});
}
