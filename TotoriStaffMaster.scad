include <helperfunctions-openscad/HeartPrimitives.scad>; // This supplies a function, heart_mod(), for heart shapes
include <TotoriStaffArmPath.scad>; // This is required for the arm sections of the heart ring on the staff
include <Spiral_Extrude.scad>; // This is from the following:
// https://www.thingiverse.com/thing:1958354
// spiral_extrude() by AKADAP is licensed under the GNU - GPL license.
// We are using the extrude_spiral() module to generate the coils for the dual
// extrusion version of Totori's staff.
include <helperfunctions-openscad/screwprimitives.scad>; // This supplies some functions for screw diameters
include <../threads-scad/threads.scad>;

// DUAL EXTRUSION FLAG 
// READ THIS COMMENT BEFORE SETTING TO TRUE
// 
// The DualExtrusionVersion flag enables a version of Totori's staff that
// exploits dual extrusion printers and water-soluble filaments such as PVA
// and BVOH.  In general, the original single extrusion version had multiple
// compromises to use as few support structures as possible.  The dual
// extrusion version aims to remove as many of the compromises as possible.
DualExtrusionVersion = true;
//
// END DUAL EXTRUSION FLAG
 

PipeDiameter = 27.8;  // Units are in mm
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
        // Add a cone on top of the "pipe cylinder" that will allow for the top
        // to not require a support structure.
        translate([0,0,22.5]) cylinder(h=30,d1=PipeDiameter,d2=1,$fn=256,center=true);
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
                    translate([0,2.5,40]) rotate([90,0,0]) cylinder(d=24,h=5,$fn=256);
                    translate([0,0,0])cylinder(r=8,h=10,$fn=256);
                }
            }
            // The angle is done in this way in order to make this section easier to print.
            translate([0,0,50]) rotate([0,95,0]) 
                hull()
                {
                    translate([0,2.5,25]) rotate([90,0,0]) cylinder(d=24,h=5,$fn=256);
                    translate([0,0,0])cylinder(r=8,h=20,$fn=256);
                }
            translate([0,0,50]) rotate([0,-95,0])
                hull()
                {
                    translate([0,2.5,25]) rotate([90,0,0]) cylinder(d=24,h=5,$fn=256);
                    translate([0,0,0])cylinder(r=8,h=20,$fn=256);
                }
        }
        if (DualExtrusionVersion)
        {
            translate([0,0,80]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
            translate([25,0,48]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
            translate([-25,0,48]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
          //  translate([0,0,15.9]) cube([200,200,40],center=true);
        }
        else
        {
            translate([0,0,80]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
            translate([25,0,50]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
            translate([-25,0,50]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
            translate([0,0,20]) cube([200,200,40],center=true);
            cylinder(h=15,d=PipeDiameter,$fn=256,center=true);   
        }
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


module TotoriStaffPinPrimitive()
{    
    difference()
    {
        union()
        {
            square([3.5,30]);
            square([6,6]);
            translate([0,24,0]) square([6,6]);
        }
        translate([10.5,24,0]) circle(r=7,$fn=128);
        translate([10.5,6,0]) circle(r=7,$fn=128);
    }
}

module TotoriStaffPin()
{
    rotate_extrude($fn=128) TotoriStaffPinPrimitive();
    mirror([0,0,1]) rotate_extrude($fn=128) TotoriStaffPinPrimitive();
}


module TotoriStaffHeartJoin1()
{
    difference()
    {
        union()
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
            translate([0,0,85]) RodStart(20,5,15);
            difference()
            {
                translate([0,0,-40]) scale([1,0.9,0.85]) rotate([90,0,90]) linear_extrude(height=10,center=true) heart_mod(200,center=true,fn=512);
                translate([0,-46,-32]) scale([1,1,1.25]) rotate([0,90,0]) cylinder(h=11,d=100,center=true,$fn=256);
                translate([0,46,-32]) scale([1,1,1.25]) rotate([0,90,0]) cylinder(h=11,d=100,center=true,$fn=256);
                translate([0,162,-40]) cube([11,200,200],center=true);
                translate([0,-162,-40]) cube([11,200,200],center=true);
                translate([0,0,-120]) cube([11,200,200],center=true);
                translate([0,52,37]) rotate([0,90,0]) scale([1.05,1.05,1]) TotoriStaffPin();
                linear_extrude(height=37) projection() translate([0,52,37]) scale([1.05,1.05,1]) rotate([0,90,0]) TotoriStaffPin();
                translate([0,-52,37]) rotate([0,90,0]) scale([1.05,1.05,1]) TotoriStaffPin();
                linear_extrude(height=37) projection() translate([0,-52,37]) scale([1.05,1.05,1]) rotate([0,90,0]) TotoriStaffPin();
                translate([0,-38,37]) rotate([0,90,0]) cylinder(h=15,d=ScrewDiameter6,center=true,$fn=128);
                translate([0,38,37]) rotate([0,90,0]) cylinder(h=15,d=ScrewDiameter6,center=true,$fn=128);
            }
        }
        cylinder(r=PipeRadius,h=15.1,$fn=128,center=true);
        cylinder(r=6,h=100,$fn=128,center=true);    
        translate([0,0,50]) sphere(r=6,$fn=128,center=true);
    }
    // Only generate for non-dual extrusion printers.  The specific support structures for dual 
    // extrusion printers will be in another file.
    if (DualExtrusionVersion == false)
    {
        // Create two small posts; you do NOT want to build support structures this high.
        // Use these posts and build supports on them instead.
        translate([-5,34,0]) cube([10,29,27]);
        translate([-5,34,0]) cube([15,29,3]);
        translate([-5,-34-29,0]) cube([10,29,27]);
        translate([-5,-34-29,0]) cube([15,29,3]);
    }
    
    
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
        difference()
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
            cylinder(d=19,h=20,$fn=256);
        }
        // Do this only for non-dual extrusion printers.
        if (DualExtrusionVersion == false)
        {
            // I'm intersecting this part with this cube.  This will allow me to print this section
            // without resorting to support structures.
            translate([0,0,45]) cube([190,190,90],center=true);
        }
    }
    translate([0,0,20]) rotate([180,0,0]) RodEnd(20,20,thread_len=15);    
    
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

// A module that gives the general shape of the outer heart ring.
module HeartRingPrimitive()
{
    difference()
    {
        union()        
        translate([0,0,5]) scale([1,0.95,0.85]) rotate([90,0,90]) linear_extrude(height=5,center=true) heart_mod(200,center=true);
        translate([0,0,5]) scale([1,0.9,0.8]) rotate([90,0,90]) linear_extrude(height=6,center=true) heart_mod(170,center=true);
        translate([0,0,50]) cube([6,90,100],center=true);
    }
        difference()
        {
            translate([0,-43,65]) scale([1,1,1]) rotate([0,90,0]) cylinder(h=5,d=50,center=true,$fn=128);
            translate([0,-51,58]) scale([1,1.2,0.75]) rotate([0,90,0]) cylinder(h=6,d=30,center=true,$fn=128);
            
        }
        difference()
        {
            translate([0,43,65]) scale([1,1,1]) rotate([0,90,0]) cylinder(h=5,d=50,center=true,$fn=128);
            translate([0,51,58]) scale([1,1.2,0.75]) rotate([0,90,0]) cylinder(h=6,d=30,center=true,$fn=128);    
        }
}

module TotoriStaffHeart()
{
   difference()
   { 
        translate([30,0,0]) scale([2,1,1]) HeartRingPrimitive();
        translate([26,54,84]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
        translate([26,-54,84]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
        translate([26,42,85]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
        translate([26,-42,85]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
        translate([26,-58,-20]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
        translate([26,-51,-26]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
        translate([26,58,-20]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
        translate([26,51,-26]) rotate([0,90,0]) cylinder(h=8,d=Wire4GaugeDiameter,center=true,$fn=128);
   }         
}

module TotoriStaffHeartWing()
{
   difference()
   { 
       union()
       { 
           translate([0,-90,-42]) scale([1,0.60,0.75]) mirror([0,1,0]) rotate([7,180,0]) 
           difference()
           { 
               translate([0,0,0]) scale([2,1,1]) HeartRingPrimitive();
               translate([0,100,0]) cube(200,center=true);
               translate([0,0,-100]) cube(140,center=true);       
           }
           translate([0,-15,-150])
           intersection()
           {
               translate([0,10,75]) rotate([0,90,0]) cylinder(r=50,h=10,$fn=128,center=true);
               translate([0,-72,30]) rotate([0,90,0]) cylinder(r=50,h=10,$fn=128,center=true);
               translate([0,-25,50]) rotate([0,90,0]) cylinder(r=15,h=10,$fn=128,center=true);
           }
       }
       translate([0,-58,-20]) rotate([0,90,0]) cylinder(h=50,d=Wire4GaugeDiameter,center=true,$fn=128);
       translate([0,-51,-26]) rotate([0,90,0]) cylinder(h=50,d=Wire4GaugeDiameter,center=true,$fn=128);
   }
}
    
module TotoriStaffMiddleJoin()
{
    difference()
    { 
        rotate_extrude($fn=256)
        {
            polygon(points=[ [0,0], [20,0], [16,20], [0,20] ]);
            polygon(points=[ [0,0], [20,0], [16,-40], [0,-40] ]);
        }
        cylinder(h=200,d=PipeDiameter,$fn=256,center=true);   
    }    
}

module TotoriStaffSideArms()
{
    difference()
    {
        translate([30,60,-60])
        hull()
        {
            scale([1,5,3]) rotate([90,-35,90]) poly_path2996(2);
            scale([1,5,3]) rotate([90,-35,90]) translate([0,0,8]) poly_path3022(1);                    
        }
        if (DualExtrusionVersion == false) // wire to insert for single extruder
        {
            translate([34,-10,-100]) rotate([-45,0,0]) cylinder(d=6,h=30,center=true,$fn=64);        
        }
        
    }
    difference()
    {
        union()
        {
            hull()
            {
                translate([30,120,-15]) rotate([0,90,0]) cylinder(d=22,h=7,$fn=128);
                translate([30,132,-31]) rotate([0,90,0]) cylinder(d=22,h=7,$fn=128);    
            }
            translate([30,138,-15]) rotate([0,90,0]) cylinder(d=22,h=7,$fn=128);
        }
        translate([33,120,-15]) rotate([0,90,0]) cylinder(d=12,h=8,center=true,$fn=128);
        translate([33,132,-31]) rotate([0,90,0]) cylinder(d=12,h=8,center=true,$fn=128);    
        translate([33,138,-15]) rotate([0,90,0]) cylinder(d=12,h=8,center=true,$fn=128);
    }    
}

module TotoriStaffSideArms_dual()
{
    translate([-5,15,0]) TotoriStaffSideArms();
    

        
    hull()
    {
        translate([-5,15,0]) intersection()
        {
            translate([30,60,-60])
            hull()
            {
                scale([1,5,3]) rotate([90,-35,90]) poly_path2996(2);
                scale([1,5,3]) rotate([90,-35,90]) translate([0,0,8]) poly_path3022(1);                    
            }
            translate([0,0,-100]) rotate([55,0,0]) cube([100,5,100],center=true);
        }
        translate([cos(320)*((8*320/360)+20),sin(320)*((8*320/360)+20),-150+(50*320/360)]) rotate([106,0,320])cylinder(h=0.1,d=7,$fn=128,center=true);
    }
    translate([cos(320)*((8*320/360)+20),sin(320)*((8*320/360)+20),-150+(50*320/360)]) rotate([106,0,320]) cube([3,3,8],center=true);
}

module TotoriStaffSideArmsCoil_dual()
{
    AngleMax=320;    
    
    difference()
    {
    translate([0,0,-150]) extrude_spiral(StartRadius=20, Angle=AngleMax, ZPitch=50, RPitch=8,StepsPerRev=360, Starts=1)
    {
        circle(d=7,$fn=128);
    }
        translate([cos(320)*((8*320/360)+20),sin(320)*((8*320/360)+20),-150+(50*320/360)]) rotate([106,0,320]) cube([3.2,3.2,9],center=true);
    }
    difference()
    {
        translate([0,0,-150]) extrude_spiral(StartRadius=20, Angle=-90, ZPitch=50, RPitch=0,StepsPerRev=360, Starts=1)
        {
            circle(d=7,$fn=128);
        }
        translate([5,-19.5,-150]) cylinder(h=100,d=ScrewDiameter6,center=true,$fn=32);
        translate([11,-17,-150]) cylinder(h=100,d=ScrewDiameter6,center=true,$fn=32);
    }
}



module TotoriStaffLowerCoilStop()
{
    // Single extrusion version:
    // Since I'm using 4 gauge wire to do the coils, the wire ends must be
    // enveloped to prevent cuts.  This structure will keep up the coil structure
    // and protect the wire ends.
    if (DualExtrusionVersion == false)
    {
        translate([0,0,-185]) difference()
        {
            union()
            {
                cylinder(h=20,r=PipeRadius+2,$fn=128);
                hull()
                {
                    translate([18,0,10])cylinder(h=10,d=8,$fn=128);
                    translate([14,0,1])sphere(d=2,$fn=128);
                }
                hull()
                {
                    translate([-18,0,10])cylinder(h=10,d=8,$fn=128);
                    translate([-14,0,1])sphere(d=2,$fn=128);
                }
            }
            translate([-18,0,10]) cylinder(d=6,h=20,$fn=128);
            translate([18,0,10]) cylinder(d=6,h=20,$fn=128);
            cylinder(r=PipeRadius,h=100,$fn=256,center=true);
        }
    }
    // Dual extrusion version:
    // This stop is specifically designed for the printed coils.  You will need to
    // print this and the other half, then bolt the halves together with screws through
    // the pipe.
    else
    {
        difference()
        {
            union()
            {
                intersection()
                {
                    translate([0,0,-171]) cylinder(h=12,r=PipeRadius+12,$fn=256);
                    scale([0.8,1.2,1]) translate([0,0,-171]) cylinder(h=12,r=PipeRadius+12,$fn=256);
                }
                translate([0,0,-181]) cylinder(h=20,r=PipeRadius+1.5,$fn=128);
                translate([0,0,-176]) rotate([90,90,0]) cylinder(h=(PipeRadius*2+3),d=8.5,$fn=128,center=true);
                hull()
                {
                    translate([0,-20,-163]) rotate([0,65,0]) cylinder(h=0.1,d=7.2,center=true,$fn=128);
                    translate([-0.707*(PipeRadius+1.5),-(PipeRadius+1.5)*0.707,-180.95]) cylinder(h=0.1,d=0.1,center=true,$fn=128);
                }
                hull()
                {
                    translate([0,20,-163]) rotate([0,-65,0]) cylinder(h=0.1,d=7.2,center=true,$fn=128);
                    translate([0.707*(PipeRadius+1.5),(PipeRadius+1.5)*0.707,-180.95]) cylinder(h=0.1,d=0.1,center=true,$fn=128);
                }
                
            }
            translate([0,0,-150]) extrude_spiral(StartRadius=20, Angle=-90, ZPitch=50, RPitch=0,StepsPerRev=360, Starts=1)
            {
                circle(d=7.2,$fn=128);
            }                        
            translate([11,-17,-150]) cylinder(h=100,d=ScrewDiameter6,center=true,$fn=32);
            translate([11,-17,-168.5]) linear_extrude(10,center=true) NutWell6_2d();
            translate([5,-19.5,-150]) cylinder(h=100,d=ScrewDiameter6,center=true,$fn=32);   
            translate([5,-19.5,-171.5]) linear_extrude(10,center=true) NutWell6_2d();
            
            rotate([0,0,180]) union()
            {
                translate([0,0,-150]) extrude_spiral(StartRadius=20, Angle=-90, ZPitch=50, RPitch=0,StepsPerRev=360, Starts=1)
                {
                    circle(d=7.2,$fn=128);
                }
                translate([11,-17,-150]) cylinder(h=100,d=ScrewDiameter6,center=true,$fn=32);
                translate([11,-17,-168.5]) linear_extrude(10,center=true) NutWell6_2d();
                translate([5,-19.5,-150]) cylinder(h=100,d=ScrewDiameter6,center=true,$fn=32);   
                translate([5,-19.5,-171.5]) linear_extrude(10,center=true) NutWell6_2d();
            }
            translate([0,0,-176]) rotate([90,90,0]) cylinder(h=(PipeRadius*2+5),d=ScrewDiameter8,$fn=128,center=true);
            translate([0,0,-171]) cylinder(r=PipeRadius,h=100,$fn=256,center=true);
        }        
    }
}


// Anything down here is temporary for visualization purposes.
// I use separate OpenSCAD files that include this file and call
// only the appropriate module.

translate([0,0,-400])
{
    mirror([0,0,1])
    {
        //color("blue") translate([0,0,-8]) TotoriStaffFeruleJoin();
        //TotoriStaffFerulePiece1();
        //translate([0,0,50]) TotoriStaffFerulePiece2();
        //translate([0,0,80]) TotoriStaffFerulePiece3();
        //translate([0,0,80]) TotoriStaffFerulePiece4();
    }
//cylinder(r=PipeRadius,h=400,$fn=64);
}


//TotoriStaffCenterJewel();
//translate([0,0,45]) TotoriStaffHeartJoin1();
//translate([0,0,135]) TotoriStaffHeartJoin2();
//translate([0,0,225]) TotoriStaffHeartJoin3();
//TotoriStaffHeart();
//#rotate([0,90,0])TotoriStaffPin();
//mirror([1,0,0])TotoriStaffHeart();
//translate([0,0,-45]) mirror([0,0,1]) TotoriStaffFerulePiece2();
//translate([0,0,-95]) TotoriStaffMiddleJoin();
//TotoriStaffHeartWing();
//mirror([0,1,0])TotoriStaffHeartWing();
//TotoriStaffSideArms_dual();
//TotoriStaffSideArmsCoil_dual();
//rotate([0,0,180]) mirror([0,0,0])TotoriStaffSideArms_dual();

//TotoriStaffLowerCoilStop();