include <TotoriStaffMaster.scad>;

module TotoriStaffArmsFinal()
{
    rotate([0,90,0])
        difference()
        {
            TotoriStaffSideArms_dual();
            translate([-5,15,0]) translate([33,132,-31]) rotate([0,90,0]) cylinder(d=12,h=8,center=true,$fn=128); // This fixes a flaw that would have needed to be fixed using some ungodly amount of difference() blocks.  It was easier to do it here.
        }
}

module TotoriStaffArmsFinalSupport()
{
   difference()
   { 
        union()
        {
           linear_extrude(2) projection(cut = false) translate([0,0,34]) TotoriStaffArmsFinal();
           intersection()
           {
                linear_extrude(15) projection(cut = false) translate([0,0,34]) TotoriStaffArmsFinal();
                translate([-100,-30,-10]) rotate([-25,0,-20]) cube(50,center=true);
           } 
        }
        translate([0,0,34.2]) TotoriStaffArmsFinal();
        
   } 
}

//translate([0,0,34.2]) TotoriStaffArmsFinal();
//TotoriStaffArmsFinalSupport();