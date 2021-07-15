include <TotoriStaffMaster.scad>;

if (DualExtrusionVersion)
{
    TotoriStaffSideArms_dual();
}
else
{
    mirror([0,1,0]) TotoriStaffSideArms();
}