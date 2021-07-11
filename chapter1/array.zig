const std = @import("std");

pub fn main() void {
    const a = [5]u8{'H', 'e', 'l', 'l', 'o',};
    const b = [_]u8{'w', 'o', 'r', 'l', 'd',};
    const length = array.len;
    std.debug.print("{s}, {s}!\n", .{a, b});
}
