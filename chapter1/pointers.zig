const expect = @import("std").testing.expect;

fn increment(num: *u8) void {
    num.* += 1;
}

test "pointers" {
    var x: u8 = 4;
    increment(&x);
    try expect(x == 5);
}

test "naughty pointer" {
    // var x: u16 = 0;
    // var y: *u8 = @intToPtr(*u8, x);
    // try expect(y.* == 0);
}

test "const pointer" {
    const x: u8 = 1;
    var y = &x;
    // y.* += 1;
    try expect(y.* == 1);
}

test "usize" {
    try expect(@sizeOf(usize) == @sizeOf(*u8));
    try expect(@sizeOf(isize) == @sizeOf(*u8));
}
