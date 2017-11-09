module dovetail(length=100){
    
    module side(){
        translate([0,0,-1])
            cube(size=[4, length, 10]);
        translate([2, 0, 9]) 
            rotate([-90, 0, 0])
                cylinder(r=2, h=length, $fn=100);
        translate([4, 0, 9])
            rotate([0,-10,0])
                translate([-2, 0, -4])
                    cube(size=[19, length, 4]);
    }

    difference(){
        union(){
            translate([-21.5, 0, 0])
                rotate([0, 15, 0]) 
                    side();

            translate([21.5, 0, 0])
                scale([-1, 1, 1])
                    rotate([0, 15, 0])
                        side();
            translate([-6, 0, 0])
                cube(size=[12, length, 5]);        
        }

        translate([-25, -1, -3])
            cube(size=[50, length+2, 3]);
        
        /* BEGIN 螺丝孔 */
        translate([-11,12.5,0])
        cylinder(r=2.5, h=11, $fn=100);

        translate([11,12.5,0])
        cylinder(r=2.5, h=11, $fn=100);

        translate([0, 12.5, -1]) 
            cylinder(r=3.2, h=11, $fn=100);
        /* END 螺丝孔 */

        /* BEGIN 螺丝孔 另一边 */
        translate([-11, length - 12.5 ,0])
        cylinder(r=2.5, h=11, $fn=100);

        translate([11, length - 12.5, 0])
        cylinder(r=2.5, h=11, $fn=100);

        translate([0, length - 12.5, -1]) 
            cylinder(r=3.2, h=11, $fn=100);
        /* END 螺丝孔 */
    }
}    
