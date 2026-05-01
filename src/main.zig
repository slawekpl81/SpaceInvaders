const rl = @import("raylib");

const Rectangle=struct {
    x:i32,y:i32,width:i32,height:i32,


    pub inline fn intersect(self:Rectangle,other:Rectangle)bool{
        return self.x<other.x + other.width and
        self.x+self.width>other.x and
        self.y<other.y+other.height and self.y+self.height > other.y;
    }
};

pub fn main() anyerror!void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(45); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------
    var rect1:Rectangle=.{.x=50, .y=50,.width = 100,.height = 100};
    const rect2:Rectangle=.{.x=300, .y=70,.width = 100,.height = 100};
                         //--------------------------------------------------------------------------------------

    var temp:i32=0;

    // Main game loop
    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------
        // TODO: Update your variables here
        temp += 1;
        if (temp==20) {
            temp=0;
            rect1.x+=1;
        }
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.white);

        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .light_gray);
        //----------------------------------------------------------------------------------
        //
        if (rect1.intersect(rect2)) {
            rl.drawRectangle(rect1.x,rect1.y,rect1.width,rect1.height,.red);
            rl.drawRectangle(rect2.x,rect2.y,rect2.width,rect2.height,.blue);
        }else{
            rl.drawRectangle(rect1.x,rect1.y,rect1.width,rect1.height,.green);
            rl.drawRectangle(rect2.x,rect2.y,rect2.width,rect2.height,.green);}
    }
}
