const Window = opaque {
    fn show(self: *Window) void {
        show_window(self);
    }
};
const Button = opaque {};

extern fn show_window(*Window) callconv(.C) void;
extern fn show_button(*Button) callconv(.C) void;

test "opaque" {
    var main_window: *Window = undefined;
    show_window(main_window);
    main_window.show();

    var ok_button: *Button = undefined;
    // show_window(ok_button); // Fails!
    show_button(ok_button);
}
