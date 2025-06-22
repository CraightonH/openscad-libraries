include <../dependencies/BOSL2/std.scad>


module block(dimensions=[31.5, 31.5, 19.1], wall_thickness=1.3, 
            peg_height=4.5, peg_diameter=9.3, peg_spacing=15.75,
            underside_tube_diameter = 13.1, underside_spine_length = 2,
            underside_spine_thickness = 1, underside_spine_distance_from_center = 8) {
    peg_or = peg_diameter / 2;
    underside_tube_or = underside_tube_diameter / 2;

    // 4 outer walls 
    rect_tube(size=[dimensions[0], dimensions[1]], wall=wall_thickness, height=dimensions[2]) {
        // top
        attach(TOP, BOTTOM)
            cuboid([dimensions[0], dimensions[1], wall_thickness]) {
                // pegs
                // TODO: Change CENTER to BOTTOM when inner spines are built
                color("green")
                    attach(TOP, BOTTOM)
                        grid_copies(n=[2, 2], spacing=peg_spacing)
                            tube(l=peg_height, or=peg_or);
        }

        // underside middle line
        attach(BOTTOM, TOP, inside=true, align=RIGHT, inset=wall_thickness)
            color("black") cube([dimensions[0] - (2 * wall_thickness), underside_spine_thickness, dimensions[2]]);

        // underside tube
        color("red")
            attach(BOTTOM, TOP, inside=true, align=CENTER)
                tube(l=dimensions[2], or=underside_tube_or);

        // underside spines
        move([0, underside_spine_distance_from_center, 0])
            color("black")
                xcopies(dimensions[0] - (2 * wall_thickness) - underside_spine_length)
                    attach(BOTTOM, TOP, inside=true, align=CENTER)
                        cube([underside_spine_length, underside_spine_thickness, dimensions[2]]);

        move([0, -underside_spine_distance_from_center, 0])
            color("black")
                xcopies(dimensions[0] - (2 * wall_thickness) - underside_spine_length)
                    attach(BOTTOM, TOP, inside=true, align=CENTER)
                        cube([underside_spine_length, underside_spine_thickness, dimensions[2]]);

        move([-underside_spine_distance_from_center, 0, 0])
            color("black")
                ycopies(dimensions[1] - (2 * wall_thickness) - underside_spine_length)
                    attach(BOTTOM, TOP, inside=true, align=CENTER)
                        cube([underside_spine_thickness, underside_spine_length, dimensions[2]]);

        move([underside_spine_distance_from_center, 0, 0])
            color("black")
                ycopies(dimensions[1] - (2 * wall_thickness) - underside_spine_length)
                    attach(BOTTOM, TOP, inside=true, align=CENTER)
                        cube([underside_spine_thickness, underside_spine_length, dimensions[2]]);
    }

}
