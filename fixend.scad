include <dovetail.scad>
include <MCAD/gears.scad>

color([119/256, 98/256, 140/256]){
    dovetail();
}


module rod(r=8, $fn=100) {
    rotate([90, 0, 0]) {
        cylinder(r=4, h=500, center=true);
    }
}

module fixEnd($fn=100){
    rotate([0,0,-90]) difference(){
        union(){
            translate([-5,-7.1,-18]) cube([10, 14.2, 18]);
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

module nut(){
    rotate([0,0,-90]) translate([1.5,0,0])
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

color([113/256, 160/256, 165/256]) {
    translate([-25, 5, -5]) {
        cube(size=[50, 15, 20]);
    }
    // translate([-23, 0, 13])    
    //     rotate([90,0,0])
    //         cylinder(r=8, h=10,$fn=100);
    translate([-23, -5, 13])
        fixEnd();
    translate([23, -5, 13])
        scale([-1,1,1])
            fixEnd();
}

distanceX = 30;
distanceY = 15;

color([128/255, 128/255, 128/255]){

    translate([-distanceX, 0, distanceY])
    {
        rod();
        translate([0,120,0]){
            nut();
            translate([0, 10, 0]) rotate([90, 0, 0])
                cylinder(r=15, h=5, $fn=100);            
        }
    }   
        
    translate([distanceX, 0, distanceY])
    {
        rod();
        translate([0,120,0]){
            nut();
            translate([0, 10, 0]) rotate([90, 0, 0])
                cylinder(r=15, h=5, $fn=100);
        }

    }

    translate([0, 0, distanceY])
    {        
        translate([0,120,0]){
           nut();
           translate([0, 20, 0]) rotate([90, 0, 0])
                // cylinder(r=15, h=5, $fn=100);
                gear(30);
        }
    }

}
