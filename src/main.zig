const microzig = @import("microzig");
const hw = microzig.core.experimental;
pub fn main() !void {
    const led = hw.gpio.Gpio(hw.Pin("PB5"), .{
        .mode = .output,
        .initial_state = .low,
    });
    led.init();

    while (true) {
        busyloop();
        led.toggle();
    }
}

fn busyloop() void {
    const limit = 1_000_000;

    var i: u24 = 0;
    while (i < limit) : (i += 1) {
        asm volatile ("nop");
        // @import("std").mem.doNotOptimizeAway(i);
    }
}
