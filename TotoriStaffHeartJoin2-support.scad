include <TotoriStaffMaster.scad>;

assert((DualExtrusionVersion), "File only usable in dual extrusion mode.");

difference()
{
    union()
    {
        hull()
        {
            translate([0,50,0.5]) cube([10,20,1],center=true);
            translate([0,53,41]) cube([10,10,1],center=true);
        }
        
        hull()
        {
            translate([0,53,41]) cube([10,10,1],center=true);
            translate([0,30,81]) cube([11,16,1],center=true);
        }
        
        hull()
        {
            translate([0,-50,0.5]) cube([10,20,1],center=true);
            translate([0,-53,41]) cube([10,10,1],center=true);
        }
        
        hull()
        {
            translate([0,-53,41]) cube([10,10,1],center=true);
            translate([0,-30,81]) cube([11,16,1],center=true);
        }
        cylinder(d=28,h=30,$fn=256);
    }
    TotoriStaffHeartJoin2();
}


