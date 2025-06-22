include <domino.scad>
include <stackable-block/block.scad>
// all permutations of a domino
// for (y = [0:1:6]) {
//     for (x = [0:1:6]) {
//         move([x * 25, y * 50, 0]) domino([x,y]);
//     }
// }

// blocks
width = 31.5;
for (x = [0:1:1]) {
    for (y = [0:1:1]) {
        move([x*width,y*width,0]) block();
    }
}
