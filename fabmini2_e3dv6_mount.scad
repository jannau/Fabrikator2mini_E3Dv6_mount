// Fabrikator 2 mini E3D v6 hotend mount
//
// Copyright (c) 2017 Janne Grunau
//
// This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

 module prism(l, w, h){
       polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
}

module block() {
    union() {
    translate([0,-9,15]) cube([30,19, 9]);
    translate([0, 0,10]) cube([30,10, 5]);
    translate([0, 0, 0]) cube([30,20,10]);
    }
}

module object() {
difference() {
    block();
    union() {
        translate([15,10,10]) cylinder(r=8, $fs=0.05, h=20);
        translate([15,10,4.1]) cylinder(r=6, $fs=0.05, h=5.9);

        translate([30,18,10.1]) rotate([0,180,0]) prism(30,2,2);

        //translate([15 - 12 / 2, 0, 0]) cube([12,8, 5.9]);
        translate([15,10,-2]) cylinder(r=8, $fs=0.05, h=6.1);
        //translate([15 - 16/2, 0, 5.9]) cube([16,8, 4.1]);
        //translate([15 - 8/2, 0, 5.9]) cube([8,8, 4.1]);

        // cables
        translate([ 0,10,17]) cylinder(r=3, h=14, $fs=0.1, center=true);
        translate([ 0,10,8]) cylinder(r1=1.5, r2=3, h=4, $fs=0.1, center=true);
        translate([ 0,10,3]) cylinder(r=1.5, h=6, $fs=0.1, center=true);

        // hotend screw + nut holes
        translate([4,11.5,5]) rotate([-90,0,0]) cylinder(r=1.6, h=17, $fs=0.05, center=true);
        translate([4,1.5,5]) rotate([-90,30,0]) cylinder(r=3.2, h=3, $fn=6, center=true);
        translate([26,11.5,5]) rotate([-90,0,0]) cylinder(r=1.6, h=17, $fs=0.05, center=true);
        translate([26,1.5,5]) rotate([-90,30,0]) cylinder(r=3.2, h=3, $fn=6, center=true);

        // mount screw + nut holes
        translate([ 5,-3.5,21]) cylinder(r=2.1, h=6, $fs=0.1, center=true);
        translate([ 5,-3.5,20.5]) cylinder(r=4.05, h=3, $fn=6, center=true);
        translate([25,-3.5,20.5]) cylinder(r=2.1, h=11, $fs=0.1, center=true);
        translate([25,-3.5,16.5]) cylinder(r=4.05, h=3, $fn=6, center=true);

        // y stepper screw clearance
        translate([0,-9,15]) cube([12.5,9,4]);
        translate([17.5,-9.1,15]) rotate([0,0,90]) prism(9.1,5,4);
    }
}
}

module mount() {
    difference() {
        object();
        translate([0,9.3,0]) cube([30,10.7,30]);
    }
}

module clamp() {
    difference() {
        object();
        translate([0,-9,-2]) cube([30,19.7,30]);
    }
}

rotate([180,0,0]) translate([0,0,-24])  mount();
rotate([0,0,180]) translate([-30,10,0]) clamp();
