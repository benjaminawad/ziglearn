const expect = @import("std").testing.expect;

fn asciitoUpper(x: u8) u8 {
    return switch (x) {
        'a'...'z' => x + 'A' - 'a',
        'A'...'Z' => x,
        else => unreachable,
    };
}

test "unreachable" {
    // const x: i32 = 1;
    // const y: u32 = if (x == 5) 5 else unreachable;
    // try expect(y == 5);
}

test "unreachable switch" {
    try expect(asciitoUpper('a') == 'A');
    try expect(asciitoUpper('A') == 'A');
}
