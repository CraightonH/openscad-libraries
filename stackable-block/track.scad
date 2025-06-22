include <../dependencies/BOSL2/std.scad>

difference() {
    cuboid([40, 80, 20], anchor=LEFT+BOTTOM+FRONT, chamfer=.5);
    move([10, -1, 20]) ycyl(l=90, r=7, anchor=FRONT+CENTER);
    move([30, -1, 20]) ycyl(l=90, r=7, anchor=FRONT+CENTER);
    move([20, -1, 8]) ycyl(l=90, r=7, anchor=FRONT+CENTER);
}
