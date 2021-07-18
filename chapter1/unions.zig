const expect = @import("std").testing.expect;

const Payload = union {
    int: i64,
    float: f32,
    bool: bool,
};

const Tag = enum { a, b, c };
const Tagged = union(Tag) {
    a: i32,
    b: f32,
    c: bool,
};

// inferred union
const Tagged2 = union(enum) {
    a: u8,
    b: f32,
    c: bool,
    none, // equivalent to none: void
};

test "simple union" {
    const payload = Payload{
        .int = 1234,
    };
    try expect(payload.int == 1234);
}

test "switch on tagged union" {
    var value = Tagged{ .b = 1.5 };
    switch (value) {
        .a => |*byte| byte.* += 1,
        .b => |*float| float.* *= 2,
        .c => |*b| b.* = !b.*,
    }
    try expect(value.b == 3);
}
