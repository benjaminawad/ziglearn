const expect = @import("std").testing.expect;

test "for" {
    const string = [_]u8{ 'a', 'b', 'c' };
    var last_char: u8 = undefined;
    var last_index: usize = undefined;

    for (string) |character, index| {
        last_char = character;
        last_index = index;
    }
    try expect(last_char == 'c');
    try expect(last_index == 2);

    for (string) |character| {
        last_char = character;
    }
    try expect(last_char == 'c');

    for (string) |_, index| {
        last_index = index;
    }
    try expect(last_index == 2);

    for (string) |_| {}
}
