module rod(r=8, $fn=100) {
    rotate([0, 90, 0]) {
        cylinder(r=4, h=500, center=true);
    }
}
// sphere(d=1)

module stopper(r=8,  $fn=100) {
    difference(){
        union(){            
            translate([0, 0, 11]) {
                cube(size=[10, 8, 12], center=true);  
            }
            rotate([0, 90, 0]) {
                cylinder(r=7.1, h=10, center=true);
            }
        }
        rotate([0, 90, 0]) {
            cylinder(r=4.1, h=11, center=true);
        }
        translate([0, 0, 11]) {
            cube(size=[11, 2, 16], center=true);
        }
        translate([0, 0, 11]) {
            rotate([90, 0, 0]) {
                cylinder(r=3.2, h=11, center=true);
            }    
        }
    }
    
    
} 

module convexLens(d) {
    rotate([0, 90, 0]) {
        cylinder(r=d/2, h=10, center=true);
    }
}

module rodWithStopper(){
    translate([245, 0, 0])
        stopper();
    translate([-245, 0, 0])
        stopper();
    rod();
}




// #rod();
module movingNut(){
    translate([1.5,0,0])
    difference(){
        union(){
            rotate([0, 90, 0]) {
                cylinder(r=11, h=3.5, $fn=100);
            }
            translate([-1.5,0,0]) {
                rotate([0, 90, 0]) {
                    cylinder(r=5, h=11, $fn=100);
                }
            }          
        }        
        translate([-2,0,0]) rotate([0, 90, 0]) 
            cylinder(r=4, h=12, $fn=100);
        
        translate([-0.5,0,8]) rotate([0, 90, 0]) 
            cylinder(r=1.75, h=4.5, $fn=100);
        translate([-0.5,8,0]) rotate([0, 90, 0]) 
            cylinder(r=1.75, h=4.5, $fn=100);
        translate([-0.5,0,-8]) rotate([0, 90, 0]) 
            cylinder(r=1.75, h=4.5, $fn=100);
        translate([-0.5,-8,0]) rotate([0, 90, 0]) 
            cylinder(r=1.75, h=4.5, $fn=100);
    }
}

module board(){
    hull(){
        translate([0,0,-0.5]) cube(size=[200, 36, 1], center=true);
        translate([0,0,-14.5]) cube(size=[200, 43, 1], center=true);
    }
}

// union(){
//     rotate([0, 90, 0]) {
//         cylinder(r=40, h=10, center=true, $fn=500);
//     }        
// }

// angle=60;

// translate([0, sin(0)*50, cos(0)*50])
//     rod();
// translate([0, sin(180-angle/2)*50, cos(180-angle/2)*50])
// {
//     rod();
//     movingNut();
// }
// translate([0, sin(180+angle/2)*50, cos(180+angle/2)*50])
// {
//     rod();
//     movingNut();
// }

// #translate([0,-22,8]) rod();
// #translate([0,22,8]) rod();
board();


module flexEnd($fn=100){
    difference(){
        union(){
            translate([-5,-7.1,-23]) cube([10, 14.2, 23]);
            translate([0,0, 0]) rotate([90,0,0]) union(){            
                translate([0, 0, 11]) {
                    cube(size=[10, 8, 12], center=true);  
                }
                rotate([0, 90, 0]) {
                    cylinder(r=7.1, h=10, center=true);
                }
            }
        }        
        rotate([90,0,0]) union(){
            rotate([0, 90, 0]) {
                cylinder(r=4.1, h=11, center=true);
            }
            translate([0, 0, 11]) {
                cube(size=[11, 2, 16], center=true);
            }
            translate([0, 0, 11]) {
                rotate([90, 0, 0]) {
                    cylinder(r=3.2, h=11, center=true);
                }    
            }
        }            
    }    
}

translate([95, 0, 0]){
    translate([0, -22, 8]) flexEnd();
    translate([0,  22, 8]) scale([1, -1, 1]) flexEnd();
    translate([0, 0, 3]) cube([10, 30, 10], center=true);
}

translate([-95,0,8]) cube([10, 60, 20], center=true);




// logo.scad - Basic example of module, top-level variable and $fn usage

// Logo(10);

// // The $fn parameter will influence all objects inside this module
// // It can, optionally, be overridden when instantiating the module
// module Logo(size=50, $fn=100) {
//     // Temporary variables
//     hole = size/2;
//     cylinderHeight = size * 1.25;

//     // One positive object (sphere) and three negative objects (cylinders)
//     difference() {
//         sphere(d=size);
        
//         cylinder(d=hole, h=cylinderHeight, center=true);
//         // The '#' operator highlights the object
//         #rotate([90, 0, 0]) cylinder(d=hole, h=cylinderHeight, center=true);
//         rotate([0, 90, 0]) cylinder(d=hole, h=cylinderHeight, center=true);
//     }
// }

// echo(version=version());
// // Written by Clifford Wolf <clifford@clifford.at> and Marius
// // Kintel <marius@kintel.net>
// //
// // To the extent possible under law, the author(s) have dedicated all
// // copyright and related and neighboring rights to this software to the
// // public domain worldwide. This software is distributed without any
// // warranty.
// //
// // You should have received a copy of the CC0 Public Domain
// // Dedication along with this software.
// // If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

