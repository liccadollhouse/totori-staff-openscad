include <TotoriStaffMaster.scad>;

TotoriStaffHeartJoin2();
if (DualExtrusionVersion == true)
{
    translate([0,0,90]) TotoriStaffHeartJoin3();
}