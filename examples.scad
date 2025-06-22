include <domino.scad>
// all permutations of a domino
for (y = [0:1:6]) {
    for (x = [0:1:6]) {
        move([x * 25, y * 50, 0]) domino([x,y]);
    }
}
