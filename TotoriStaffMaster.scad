PipeDiameter = 28;
PipeRadius = PipeDiameter/2;

module TotoriStaffFerulePiece1()
{
    difference()
    { 
        rotate_extrude($fn=256)
        {
            translate([20,0,0]) circle(r=3,$fn=200);        
            polygon(points=[ [0,-3], [20,-3], [16,50], [0,50] ]);
        }
        cylinder(h=200,d=PipeDiameter,$fn=256,center=true);   
    }     
}

module TotoriStaffFerulePiece2()
{
    difference()
    { 
        rotate_extrude($fn=256)
        {
            translate([20,0,0]) circle(r=3,$fn=200);        
            polygon(points=[ [0,-3], [20,-3], [16,30], [0,30] ]);
        }
        cylinder(h=200,d=PipeDiameter,$fn=256,center=true);   
    }     
}

module TotoriStaffFerulePiece3()
{
    difference()
    { 
        union()
        {
            rotate_extrude($fn=256)
            {
                translate([20,0,0]) circle(r=3,$fn=256);        
                polygon(points=[ [0,-3], [20,-3], [8,40], [0,40] ]);
            }
            translate([0,0,40])
            {
                hull()
                {
                    translate([0,0,40]) rotate([90,0,0]) cylinder(d=24,h=5,$fn=256);
                    translate([0,0,0])cylinder(r=8,h=20,$fn=256);
                }
            }
            translate([0,0,50]) rotate([0,90,0])
            hull()
            {
                translate([0,0,25]) rotate([90,0,0]) cylinder(d=24,h=5,$fn=256);
                translate([0,0,0])cylinder(r=8,h=20,$fn=256);
            }
            translate([0,0,50]) rotate([0,-90,0])
            hull()
            {
                translate([0,0,25]) rotate([90,0,0]) cylinder(d=24,h=5,$fn=256);
                translate([0,0,0])cylinder(r=8,h=20,$fn=256);
            }
        }
        translate([0,0,80]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
        translate([25,0,50]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
        translate([-25,0,50]) rotate([90,0,0]) cylinder(d=15,h=50,$fn=256,center=true);
        cylinder(h=15,d=PipeDiameter,$fn=256,center=true);   
    }     
}

module TotoriStaffFeruleJoin()
{
    difference()
    { 
        rotate_extrude($fn=256)
        {
            translate([16,0,0]) circle(r=3,$fn=200);
            polygon(points=[ [0,-3], [16,-3], [16,3], [0,3] ]);        
        }
        cylinder(h=200,d=PipeDiameter,$fn=256,center=true);   
    }
}

/*color("blue") translate([0,0,-8]) TotoriStaffFeruleJoin();
TotoriStaffFerulePiece1();
translate([0,0,50]) TotoriStaffFerulePiece2();
translate([0,0,80]) TotoriStaffFerulePiece3();*/