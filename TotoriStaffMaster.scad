include <HeartPrimitives.scad>; // This supplies a function, heart_mod(), for heart shapes

PipeDiameter = 28;  // Units are in mm
PipeRadius = PipeDiameter/2;

Wire4GaugeDiameter = 5.25; // Units are in mm

module TotoriStaffFerulePiece1()
{
    difference()
    { 
        rotate_extrude($fn=256)
        {
            translate([20,0,0]) circle(r=3,$fn=200);        
            polygon(points=[ [0,-3], [20,-3], [16,50], [0,50] ]);
        }
        cylinder(h=200,d=PipeDiameter,$fn=256,center=true);   
    }     
}

module TotoriStaffFerulePiece2()
{
    difference()
    { 
        rotate_extrude($fn=256)
        {
            translate([20,0,0]) circle(r=3,$fn=200);        
            polygon(points=[ [0,-3], [20,-3], [16,30], [0,30] ]);
        }
        cylinder(h=200,d=PipeDiameter,$fn=256,center=true);   
    }     
}

module TotoriStaffFerulePiece3()
{
    difference()
    { 
        union()
        {
            rotate_extrude($fn=256)
            {
                translate([20,0,0]) circle(r=3,$fn=256);        
                polygon(points=[ [0,-3], [20,-3], [8,40], [0,40] ]);
            }            
        }
        cylinder(h=15,d=PipeDiameter,$fn=256,center=true);   
    }     
}

module TotoriStaffFerulePiece4()
{
    difference()
    { 
        union()
        {
            translate([0,0,40])
            {
                hull()
                {
                    translate([0,0,40]) rotate([90,0,0]) cylinder(d=24,h=5,$fn=256);
                    translate([0,0,0])cylinder(r=8,h=20,$fn=256);
                }
            }
            // The angle is done in this way in order to make this section easier to print.
            translate([0,0,50]) rotate([0,95,0]) 
                hull()
                {
                    translate([0,0,25]) rotate([90,0,0]) cylinder(d=24,h=5,$fn=256);
                    translate([0,0,0])cylinder(r=8,h=20,$fn=256);
                }
            translate([0,0,50]) rotate([0,-95,0])
                hull()
                {
                    translate([0,0,25]) rotate([90,0,0]) cylinder(d=24,h=5,$fn=256);
                    translate([0,0,0])cylinder(r=8,h=20,$fn=256);
                }
        }
        translate([0,0,80]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
        translate([25,0,50]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
        translate([-25,0,50]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
        translate([0,0,20]) cube([200,200,40],center=true);
        cylinder(h=15,d=PipeDiameter,$fn=256,center=true);   
    }
}

module TotoriStaffFeruleJoin()
{
    difference()
    { 
        rotate_extrude($fn=256)
        {
            translate([16,0,0]) circle(r=3,$fn=200);
            polygon(points=[ [0,-3], [16,-3], [16,3], [0,3] ]);        
        }
        cylinder(h=200,d=PipeDiameter,$fn=256,center=true);   
    }
}

// Used for the red jewel.
module Octagon2DPrimitive()
{
    difference()
    {
        square([90,50],center=true);
        translate([58,58,0]) rotate([0,0,-45]) square([80,80],center=true);
        translate([58,-58,0]) rotate([0,0,-45]) square([80,80],center=true);
        translate([-58,-58,0]) rotate([0,0,-45]) square([80,80],center=true);
        translate([-58,58,0]) rotate([0,0,-45]) square([80,80],center=true);        
    }
}

// Some quick ruler measurement gives us the ratios needed to size
// the red jewel in the center of the staff.
module TotoriStaffCenterJewel()
{
    // We will extrude an octagon "shape" vertically, then use convex
    // hulls to create the facets at the ends.
    difference()
    {
        hull()
        {
            rotate([0,90,0]) linear_extrude(height=35,center=true) Octagon2DPrimitive();
            translate([20,0,0]) scale([1,0.5,0.7]) rotate([0,90,0]) linear_extrude(height=0.1,center=true) Octagon2DPrimitive();
            translate([-20,0,0]) scale([1,0.5,0.7]) rotate([0,90,0]) linear_extrude(height=0.1,center=true) Octagon2DPrimitive();        
        }    
        cylinder(r=PipeRadius,h=100,$fn=256,center=true);
    }
}

module TotoriStaffHeartJoin1()
{
    cylinder(r=PipeRadius+4,h=5,$fn=128);
    hull()
    {
        translate([0,0,5]) cylinder(r=PipeRadius+2,h=1,$fn=128);
        translate([0,0,10]) cylinder(r=PipeRadius-2,h=2,$fn=128);
    }
    
    rotate_extrude($fn=128)    
    {
        difference()
        {
            translate([0,10,0]) square([40,75]);
            translate([110,0,0]) scale([1,2,1]) circle(r=100,$fn=256);
        }
    }
    translate([0,0,85]) cylinder(r=PipeRadius+5.48,h=5,$fn=128);

    difference()
    {
        translate([0,0,-40]) scale([1,0.9,0.85]) rotate([90,0,90]) linear_extrude(height=5,center=true) heart_mod(200,center=true);
        translate([0,-46,-30]) scale([1,1,1.3]) rotate([0,90,0]) cylinder(h=6,d=100,center=true,$fn=128);
        translate([0,46,-30]) scale([1,1,1.3]) rotate([0,90,0]) cylinder(h=6,d=100,center=true,$fn=128);
        translate([0,160,-40]) cube([6,200,200],center=true);
        translate([0,-160,-40]) cube([6,200,200],center=true);
        translate([0,0,-120]) cube([6,200,200],center=true);
        translate([0,54,39]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
        translate([0,-54,39]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
        translate([0,42,40]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
        translate([0,-42,40]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);        
        cylinder(h=16,d=PipeDiameter,$fn=256,center=true); // pipe goes here
    }
    // Create two small posts; you do NOT want to build support structures this high.
    // Use these posts and build supports on them instead.
    translate([-2.5,32,0]) cube([5,29,32.3]);
    translate([-2.5,32,0]) cube([10,29,3]);
    translate([-2.5,-32-29,0]) cube([5,29,32.4]);
    translate([-2.5,-32-29,0]) cube([10,29,3]);
    
}

// These 3 modules are used for the second part of the join.
module FleurDeLisArmMain()
{
    difference()
    {
        translate([0,-40,65]) rotate([0,90,0]) cylinder(h=1,d=60,center=true,$fn=128);
        translate([0,-32,60]) scale([1,1.1,1]) rotate([0,90,0]) cylinder(h=2,d=40,center=true,$fn=128);
        translate([0,-33,50]) scale([1,1,1]) rotate([0,90,0]) cylinder(h=2,d=40,center=true,$fn=128);
        translate([0,-38,55]) scale([1,1,1.2]) rotate([0,90,0]) cylinder(h=2,d=35,center=true,$fn=128);
    }
}

module FleurDeLisArmSide()
{
    difference()
    {
        translate([0,-40,65]) rotate([0,90,0]) cylinder(h=1,d=50,center=true,$fn=128);
        translate([0,-32,60]) scale([1,1.1,1]) rotate([0,90,0]) cylinder(h=2,d=40,center=true,$fn=128);
        translate([0,-33,50]) scale([1,1,1]) rotate([0,90,0]) cylinder(h=2,d=40,center=true,$fn=128);
        translate([0,-38,55]) scale([1,1,1.2]) rotate([0,90,0]) cylinder(h=2,d=35,center=true,$fn=128);
    }
}

module FleurDeLisArmFull()
{
    difference()
    {
        hull()
        {
            FleurDeLisArmMain();
            translate([5,0,0]) FleurDeLisArmSide();
            translate([-5,0,0]) FleurDeLisArmSide();
        }
        translate([0,-32,60]) scale([1,1.1,1]) rotate([0,90,0]) cylinder(h=12,d=40,center=true,$fn=128);
        translate([0,-33,50]) scale([1,1,1]) rotate([0,90,0]) cylinder(h=12,d=40,center=true,$fn=128);
        translate([0,-38,55]) scale([1,1,1.2]) rotate([0,90,0]) cylinder(h=12,d=35,center=true,$fn=128);
    }  
}


module TotoriStaffHeartJoin2()
{
    intersection()
    {
        union()
        {
            cylinder(r=PipeRadius+5.48,h=2,$fn=128);
            
            translate([0,0,87])
            mirror([0,0,1])
            rotate_extrude($fn=128)    
            {
                difference()
                {
                    translate([0,10,0]) square([40,75]);
                    translate([110,0,0]) scale([1,2,1]) circle(r=100,$fn=256);
                }
            }
            hull()
            {
                translate([0,0,88]) cylinder(r=PipeRadius+3,h=2,$fn=128);
                translate([0,0,60]) cylinder(r=PipeRadius-3.1,h=2,$fn=128);
            }
            
            FleurDeLisArmFull();
            mirror([0,1,0]) FleurDeLisArmFull();
        }
        // I'm intersecting this part with this cube.  This will allow me to print this section
        // without resorting to support structures.
        translate([0,0,45]) cube([190,190,90],center=true);
    }
    
}

// This part is simple, thank goodness.
module TotoriStaffHeartJoin3()
{
    hull()
    {
        cylinder(r=PipeRadius+3,h=2,$fn=128);
        translate([0,0,50]) sphere(d=5,$fn=64);
    }    
}
    

// Anything down here is temporary for visualization purposes.
// I use separate OpenSCAD files that include this file and call
// only the appropriate module.

/*color("blue") translate([0,0,-8]) TotoriStaffFeruleJoin();
TotoriStaffFerulePiece1();
translate([0,0,50]) TotoriStaffFerulePiece2();
translate([0,0,80]) TotoriStaffFerulePiece3();*/
//cylinder(r=PipeRadius,h=400,$fn=64);
/*
TotoriStaffCenterJewel();
translate([0,0,45]) TotoriStaffHeartJoin1();
translate([0,0,135]) TotoriStaffHeartJoin2();
translate([0,0,225]) TotoriStaffHeartJoin3();
*/
