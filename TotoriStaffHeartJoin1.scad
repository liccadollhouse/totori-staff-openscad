include <TotoriStaffMaster.scad>;

// I'm doing the pipe subtraction here because it removes
// a ton of union() statements.
difference()
{
    TotoriStaffHeartJoin1();
    cylinder(h=16,d=PipeDiameter,$fn=256,center=true); // pipe goes here
}