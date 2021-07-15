const expect = @import("std").testing.expect;

const FileOpenError = error{ AccessDenied, OutOfMemory, FileNotFound };
const AllocationError = error{OutOfMemory};
const A = error{ NotDir, PathNotFound };
const B = error{ OutOfMemory, PathNotFound };
const C = A || B;

var problems: u32 = 98;

fn failFnCounter() error{Oops}!void {
    errdefer problems += 1;
    try failingFunction();
}

fn failingFunction() error{Oops}!void {
    return error.Oops;
}

fn failFn() error{Oops}!i32 {
    try failingFunction();
    return 12;
}

fn createFile() !void {
    return error.AccessDenied;
}

test "coerce error from a subset to a superset" {
    const err: FileOpenError = AllocationError.OutOfMemory;
    try expect(err == FileOpenError.OutOfMemory);
}

test "error union" {
    const maybe_error: AllocationError!u16 = 10;
    const no_error = maybe_error catch 0;

    try expect(@TypeOf(no_error) == u16);
    try expect(no_error == 10);
}

test "failing function" {
    failingFunction() catch |err| {
        try expect(err == error.Oops);
        return;
    };
}

test "try" {
    var v = failFn() catch |err| {
        try expect(err == error.Oops);
        return;
    };
    try expect(v == 12); // is never reached
}

test "errdefer" {
    failFnCounter() catch |err| {
        try expect(err == error.Oops);
        try expect(problems == 99);
        return;
    };
}

test "inferred error set" {
    // type coercion successfully takes place
    // const x: error{AccessDenied}!void = createFile();
}
