include <TotoriStaffMaster.scad>;


module TotoriStaffArmsCoilsFinal()
{
    translate([0,0,24]) rotate([0,90,0]) translate([0,0,140]) TotoriStaffSideArmsCoil_dual();
    hull()  // Adding a platform for the support structure to save on soluble filament.
    {
        translate([4,15,0]) rotate([0,0,-70]) cube([40,10,5]);
        translate([7,5,35]) rotate([0,0,-70]) cube([20,10,5]);
    }
}

module TotoriStaffArmsCoilsFinalSupport()
{
    difference()
    {
        union()
        {
            translate([7,5,40]) rotate([0,0,-70]) cube([20,10,5]);    
            translate([-11,-17,0]) rotate([0,0,70]) cube([30,10,7]);    
            translate([29,-24,0]) rotate([0,0,0]) cube([10,10,6]);
        }
        TotoriStaffArmsCoilsFinal();
    }
}

TotoriStaffArmsCoilsFinal();
//TotoriStaffArmsCoilsFinalSupport();
