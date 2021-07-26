include <TotoriStaffMaster.scad>;

assert((DualExtrusionVersion), "File only usable in dual extrusion mode.");

difference()
{
    union()
    {
        hull()
        {
            translate([0,-45,20.5]) cube([10,36,41],center=true);
            translate([0,-45,1]) cube([20,36,2],center=true);
        }
        hull()
        {    
            translate([0,45,20.5]) cube([10,36,41],center=true);
            translate([0,45,1]) cube([20,36,2],center=true);
        }
    }
    TotoriStaffHeartJoin1();
    union()
    {
        hull()
        {
            translate([0,-45,12]) cube([0.1,36,24],center=true);
            translate([0,-45,1]) cube([7,36,2],center=true);
        }
        hull()
        {    
            translate([0,45,12]) cube([0.1,36,24],center=true);
            translate([0,45,1]) cube([7,36,2],center=true);
        }
    }
}
