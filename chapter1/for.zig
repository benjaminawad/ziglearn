const expect = @import("std").testing.expect;

test "for" {
    const string = [_]u8{ 'a', 'b', 'c' };
    var lastChar: u8 = undefined;
    var lastIndex: usize = undefined;

    for (string) |character, index| {
        lastChar = character;
        lastIndex = index;
    }
    try expect(lastChar == 'c');
    try expect(lastIndex == 2);

    for (string) |character| {
        lastChar = character;
    }
    try expect(lastChar == 'c');

    for (string) |_, index| {
        lastIndex = index;
    }
    try expect(lastIndex == 2);

    for (string) |_| {}
}
