const std = @import("std");
const ray = @cImport({
    @cInclude("raylib.h");
});

pub fn main() void {
    const screen_width = 800;
    const screen_height = 400;
    ray.InitWindow(screen_width, screen_height, "raylib core example");
    defer ray.CloseWindow();
    ray.SetTargetFPS(60);
    while (!ray.WindowShouldClose()) {
        ray.BeginDrawing();
        defer ray.EndDrawing();
        ray.ClearBackground(ray.RAYWHITE);
        ray.DrawText("Hello, World!", 190, 200, 20, ray.LIGHTGRAY);
    }
}
