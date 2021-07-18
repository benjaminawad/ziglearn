const expect = @import("std").testing.expect;

const Vec3 = struct {
    x: f32,
    y: f32 = 0,
    z: f32,
};

const Stuff = struct {
    x: i32,
    y: i32,

    fn swap(self: *Stuff) void {
        const tmp = self.x;
        self.x = self.y;
        self.y = tmp;
    }
};

test "struct usage" {
    const my_vector = Vec3{
        .x = 0,
        .y = 100,
        .z = 50,
    };
    try expect(my_vector.y == 100);
}

test "missing struct field" {
    const my_vector = Vec3{
        .x = 0,
        .z = 50,
    };
    try expect(my_vector.z == 50);
}

test "automatic dereference" {
    var thing = Stuff{ .x = 10, .y = 20 };
    thing.swap();
    try expect(thing.x == 20);
    try expect(thing.y == 10);
}
