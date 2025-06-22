🧱 Grid Editor

Grid Editor is a simple HTML/JavaScript-based level editor designed for creating top-down grid-based maps with multiple layers. It supports exporting the level as Lua code for use in Roblox Forline games.


🧩 Features

    🔲 Top-down grid editing with 2D visualization.

    📐 Supports up to 100 layers on the Y-axis.

    🧱 Place models like Wall, Floor, Ramp, Door, Window, RampLeft, and RampBack.

    🔄 Rotate models with the Q key.

    👆 Click and hold to build, right-click and hold to remove.

    🗑️ Per-cell model removal using the right mouse button.

    📤 Export Lua build commands:

    Build("Wall$0$0", x, y, z)

    🖼️ Uses external image textures for models.

    ⚙️ Adjustable grid size and origin position (PosX, PosZ).

📦 Model Structure

    Model format: ModelName$Rotation$0

    Groups:

        Walls: Up to 4 models per cell with different rotations

        Floors: Only 1 model per cell

        Ramps: Only 1 model per cell

🚀 How to Use

    Open GridEditor.html in any modern browser OR open alexzavr.github.io/Fortline-Omega-Script/GridEditor.html

    Select the model, layer, and grid position.

    Click and drag to place models. Use right-click to delete.

    Use the Export Lua button to generate Roblox-compatible code.

    Use Roblox executor to execute code in Fortline 
