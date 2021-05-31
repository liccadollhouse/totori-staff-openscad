// In general, I do not trust slicer-created support structures.  I prefer
// to create my own so I can better place them and ensure the structures
// actually do the support without relying on bridging.

include <TotoriStaffMaster.scad>;

assert(DualExtrusionVersion, "File only usable in dual extrusion mode.");

difference()
{
    color("green") union()
    {
        translate([0,0,38.91]) cube([65,18,6],center=true);
        translate([25,0,43]) cube([10,12.4,5],center=true);
        intersection()
        {
            translate([25,0,50]) cube([10,12.4,18],center=true);
            translate([25,0,48]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
                
        }
        translate([-25,0,43]) cube([10,12.4,5],center=true);
        intersection()
        {
            translate([-25,0,50]) cube([10,12.4,18],center=true);
            translate([-25,0,48]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
        }
        intersection()
        {
            translate([0,0,81]) cube([10,7,18],center=true);
            translate([0,0,80]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
        }
    }
    #TotoriStaffFerulePiece4();
}