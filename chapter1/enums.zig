const expect = @import("std").testing.expect;

const Direction = enum {
    north,
    south,
    east,
    west,
};

const Value = enum(u2) {
    zero,
    one,
    two,
};

const Value2 = enum(u32) { hundred = 100, thousand = 1000, million = 1000000, next };

const Suit = enum {
    clubs,
    spades,
    diamonds,
    hearts,

    pub fn isClubs(self: Suit) bool {
        return self == Suit.clubs;
    }
};

const Mode = enum {
    var count: u8 = 0;
    on,
    off,
};

test "enum ordinal values" {
    try expect(@enumToInt(Value.zero) == 0);
    try expect(@enumToInt(Value.one) == 1);
    try expect(@enumToInt(Value.two) == 2);
}

test "set enum ordinal value" {
    try expect(@enumToInt(Value2.hundred) == 100);
    try expect(@enumToInt(Value2.thousand) == 1000);
    try expect(@enumToInt(Value2.million) == 1000000);
    try expect(@enumToInt(Value2.next) == 1000001);
}

test "enum method" {
    try expect(Suit.clubs.isClubs() != Suit.isClubs(.spades));
}

test "hmm" {
    Mode.count += 1;
    try expect(Mode.count == 1);
}
