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
        translate([0,0,-33])
        {          
            translate([-70,50,0]) rotate([0,0,-28]) cube([30,180,4],center=true);
            translate([-105,-12,6]) rotate([0,0,-28]) cube([20,30,8],center=true);        
            translate([-20,145,0]) rotate([0,0,-28]) cube([50,50,4],center=true);
            translate([-125,-5,0]) rotate([0,0,28]) cube([20,70,4],center=true);
            translate([-125,-2,27]) rotate([0,0,22]) cube([10,30,56],center=true);
            translate([-150,0,0]) rotate([0,0,-28]) cube([20,60,4],center=true);
            translate([-150,0,7]) rotate([0,0,-28]) cube([10,40,16],center=true);
        }
        TotoriStaffArmsFinal();
    }
    
}

//TotoriStaffArmsFinal();
TotoriStaffArmsFinalSupport();