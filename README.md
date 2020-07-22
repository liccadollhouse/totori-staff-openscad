# totori-staff-openscad
OpenSCAD code for Totori's staff.

Version history:

v.1.0 - Initial version for Okashicon's virtual cosplay runway (2020)
v.1.1 - Added this readme.

The way I do my OpenSCAD code is the following:  I create a "master" file with all the modules of the individual parts of the staff.  Then, I create individual OpenSCADs file that includes the master file, and only calls the individual module that is to be printed.  So, in terms of
what you need to print and where they go on the staff, you will assemble the following in order on your PVC pipe(starting from the top of the staff):

TotoriStaffHeartJoin3
TotoriStaffHeartJoin2
TotoriStaffHeartJoin1
TotoriStaffRedJewel
TotoriStaffFerulePiece2 (this is used twice)
TotoriStaffMiddleJoin (this is the silver piece under the jewel)
TotoriStaffCoilStop (this is required to cover the 6 gauge wire that the side arms on the staff are attached to)
TotoriStaffFeruleJoin (this is painted blue like the rest of the staff)
TotoriStaffFerulePiece1
TotoriStaffFerulePiece2
TotoriStaffFerulePiece3
TotoriStaffFerulePiece4

Then, the whole heart ring section, you will print two of these items:

TotoriStaffHeart
TotoriStaffHeartWing
TotoriStaffSideArms (you will have to mirror one of them, as this part is asymmetrical)

This is sandwiched in the appropriate parts by little rods; you can do what you want with that.  I manufactured small pins to hold the heart together to the staff, but the holes are sized for #10 screws.  The side arms are inserted into 6 gauge wire, and twisted around the staff to the coil stop.  (The holes are sized for 4 gauge wire, but 4 gauge wire was too difficult to twist with my strength.)

I am, of course, open to suggestions and improvements, as this was modeled relatively quickly to the point of being rushed.  I will definitely be making improvements to this model as time permits.  You may contact me through GitHub.




