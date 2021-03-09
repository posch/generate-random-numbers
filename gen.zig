const std = @import("std");

pub fn main() !void {
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.os.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const rand = &prng.random;
    const stdout = std.io.getStdOut().outStream();

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const allocator = &arena.allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    const n: u32 = try std.fmt.parseUnsigned(u32, args[1], 10);
    var i: u32 = 0;
    while (i < n) : (i += 1) {
        const s = rand.float(f64);
        try stdout.print("{d:.6}\n", .{s});
    }
}
