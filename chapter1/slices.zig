const expect = @import("std").testing.expect;

fn total(values: []const u8) usize {
    var count: u8 = 0;
    for (values) |v| count += v;
    return count;
}

test "slices" {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];
    try expect(total(slice) == 6);
}

test "slices type" {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];
    try expect(@TypeOf(slice) == *const [3]u8);
}

test "slices end" {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..];
    try expect(total(slice) == 15);
}
