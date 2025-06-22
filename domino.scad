include <dependencies/BOSL2/std.scad>
module domino(block=[0, 0], dimensions=[24, 24 * 2, 24 / 3], pip_radius=(24 / 15), chamfer=.5) {
    assert(block[0] > -1, "Top block number must not be negative.");
    assert(block[0] < 7, "Top block number must be less than 7.");
    assert(block[1] > -1, "Bottom block number must not be negative.");
    assert(block[1] < 7, "Bottom block number must be less than 7.");

    columns = [
        0, // add "blank" value to not have to translate 0 based indices
        dimensions[0] * .25, 
        dimensions[0] * .50, 
        dimensions[0] * .75
    ];

    rows = [
        0, // add "blank" value to not have to translate 0 based indices
        dimensions[1] * .875,
        dimensions[1] * .75,
        dimensions[1] * .625,
        dimensions[1] * .375,
        dimensions[1] * .25,
        dimensions[1] * .125
    ];

    difference() {
        // domino block
        color("white")
            cuboid(dimensions, anchor=LEFT+BOTTOM+FRONT, chamfer=chamfer);

        // middle line
        color("black")
            move([dimensions[0] / 2, (dimensions[1] / 2), (dimensions[2] + .1)])
                yrot(180) zrot(90)
                    prismoid([1, dimensions[0] * .9], [0, dimensions[0] * .75], h=1.1);

        // 
        determine_face(block);
    }

    module pip_mask(position=[0, 0], pip_radius=pip_radius) {
        color("black")
            move([columns[position[0]], rows[position[1]], dimensions[2]])
                sphere(r=pip_radius);
    }

    module pip_face_1(flip=true) {
        if (flip) {
            pip_mask([2, 5]);
        } else {
            pip_mask([2, 2]);
        }
    }

    module pip_face_2(flip=true) {
        if (flip) {
            pip_mask([1, 4]);
            pip_mask([3, 6]);
        } else {
            pip_mask([1, 1]);
            pip_mask([3, 3]);
        }
    }

    module pip_face_3(flip=true) {
        if (flip) {
            pip_mask([1, 4]);
            pip_mask([2, 5]);
            pip_mask([3, 6]);
        } else {
            pip_mask([1, 1]);
            pip_mask([2, 2]);
            pip_mask([3, 3]);
        }
    }

    module pip_face_4(flip=true) {
        if (flip) {
            pip_mask([1, 4]);
            pip_mask([1, 6]);
            pip_mask([3, 4]);
            pip_mask([3, 6]);
        } else {
            pip_mask([1, 1]);
            pip_mask([1, 3]);
            pip_mask([3, 1]);
            pip_mask([3, 3]);
        }
    }

    module pip_face_5(flip=true) {
        if (flip) {
            pip_mask([1, 4]);
            pip_mask([1, 6]);
            pip_mask([2, 5]);
            pip_mask([3, 4]);
            pip_mask([3, 6]);
        } else {
            pip_mask([1, 1]);
            pip_mask([1, 3]);
            pip_mask([2, 2]);
            pip_mask([3, 1]);
            pip_mask([3, 3]);
        }
    }

    module pip_face_6(flip=true) {
        if (flip) {
            pip_mask([1, 4]);
            pip_mask([1, 5]);
            pip_mask([1, 6]);
            pip_mask([3, 4]);
            pip_mask([3, 5]);
            pip_mask([3, 6]);
        } else {
            pip_mask([1, 1]);
            pip_mask([1, 2]);
            pip_mask([1, 3]);
            pip_mask([3, 1]);
            pip_mask([3, 2]);
            pip_mask([3, 3]);
        }
    }

    module determine_face(block=[0, 0]) {
        // 0 pips; 0 pips
        if (block == [0, 0]) {
        } else 
        // 0 pips; 1 pip
        if (block == [0, 1]) {
            pip_face_1();
        } else 
        // 0 pips; 2 pips
        if (block == [0, 2]) {
            pip_face_2();
        } else
        // 0 pips; 3 pips
        if (block == [0, 3]) {
            pip_face_3();
        } else
        // 0 pips; 4 pips
        if (block == [0, 4]) {
            pip_face_4();
        } else
        // 0 pips; 5 pips
        if (block == [0, 5]) {
            pip_face_5();
        } else
        // 0 pips; 6 pips
        if (block == [0, 6]) {
            pip_face_6();
        } else
        // 1 pip; 1 pip
        if (block == [1, 1]) {
            pip_face_1(false);
            pip_face_1();
        } else
        // 1 pip; 2 pips
        if (block == [1, 2]) {
            pip_face_1(false);
            pip_face_2();
        } else
        // 1 pip; 3 pips
        if (block == [1, 3]) {
            pip_face_1(false);
            pip_face_3();
        } else
        // 1 pip; 4 pips
        if (block == [1, 4]) {
            pip_face_1(false);
            pip_face_4();
        } else
        // 1 pip; 5 pips
        if (block == [1, 5]) {
            pip_face_1(false);
            pip_face_5();
        } else
        // 1 pip; 6 pips
        if (block == [1, 6]) {
            pip_face_1(false);
            pip_face_6();
        } else
        // 2 pips; 2 pips
        if (block == [2, 2]) {
            pip_face_2(false);
            pip_face_2();
        } else
        // 2 pips; 3 pips
        if (block == [2, 3]) {
            pip_face_2(false);
            pip_face_3();
        } else
        // 2 pips; 4 pips
        if (block == [2, 4]) {
            pip_face_2(false);
            pip_face_4();
        } else
        // 2 pips; 5 pips
        if (block == [2, 5]) {
            pip_face_2(false);
            pip_face_5();
        } else
        // 2 pips; 6 pips
        if (block == [2, 6]) {
            pip_face_2(false);
            pip_face_6();
        } else
        // 3 pips; 3 pips
        if (block == [3, 3]) {
            pip_face_3(false);
            pip_face_3();
        } else
        // 3 pips; 4 pips
        if (block == [3, 4]) {
            pip_face_3(false);
            pip_face_4();
        } else
        // 3 pips; 5 pips
        if (block == [3, 5]) {
            pip_face_3(false);
            pip_face_5();
        } else
        // 3 pips; 6 pips
        if (block == [3, 6]) {
            pip_face_3(false);
            pip_face_6();
        } else
        // 4 pips; 4 pips
        if (block == [4, 4]) {
            pip_face_4(false);
            pip_face_4();
        } else
        // 4 pips; 5 pips
        if (block == [4, 5]) {
            pip_face_4(false);
            pip_face_5();
        } else
        // 4 pips; 6 pips
        if (block == [4, 6]) {
            pip_face_4(false);
            pip_face_6();
        } else
        // 5 pips; 5 pips
        if (block == [5, 5]) {
            pip_face_5(false);
            pip_face_5();
        } else
        // 5 pips; 6 pips
        if (block == [5, 6]) {
            pip_face_5(false);
            pip_face_6();
        } else
        // 6 pips; 6 pips
        if (block == [6, 6]) {
            pip_face_6(false);
            pip_face_6();
        } else {
            determine_face([block[1], block[0]]);
        }
    }
}
