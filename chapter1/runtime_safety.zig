const std = @import("std");

test "out of bounds" {
    // const a = [3]u8{1, 2, 3};
    // var index: u8 = 5;
    // _ = a[index];
}

test "runtime safety disabled" {
    @setRuntimeSafety(false);
    const a = [3]u8{ 1, 2, 3 };
    var index: u8 = 5;
    const y = a[index];
    std.debug.print("Value of y: {d}\n", .{y});
}
