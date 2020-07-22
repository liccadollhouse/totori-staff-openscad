
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

module poly_path2996(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-61.740113,1.285929],[-59.875584,0.969872],[-58.001151,0.599356],[-56.134779,0.184708],[-54.294432,-0.263744],[-52.498077,-0.735671],[-50.763676,-1.220745],[-49.109195,-1.708639],[-47.552599,-2.189025],[-46.111853,-2.651574],[-44.804920,-3.085958],[-42.664356,-3.828922],[-41.274624,-4.335290],[-40.779443,-4.522441],[-39.219921,-5.039602],[-37.665699,-5.577712],[-34.568262,-6.697436],[-31.477349,-7.842943],[-28.383174,-8.975559],[-26.831806,-9.524947],[-25.275954,-10.056611],[-23.714394,-10.565715],[-22.145904,-11.047427],[-20.569259,-11.496911],[-18.983238,-11.909335],[-17.386617,-12.279863],[-15.778173,-12.603661],[-14.611570,-12.800787],[-13.440877,-12.963554],[-12.266517,-13.095498],[-11.088912,-13.200152],[-9.908483,-13.281050],[-8.725653,-13.341727],[-6.354477,-13.416552],[-3.978759,-13.452902],[-1.601875,-13.479047],[0.772799,-13.523263],[1.958252,-13.560982],[3.141887,-13.613821],[4.153878,-13.651938],[5.166246,-13.661982],[6.178994,-13.645547],[7.192130,-13.604226],[8.205658,-13.539615],[9.219585,-13.453307],[10.233914,-13.346896],[11.248654,-13.221976],[12.263808,-13.080140],[13.279382,-12.922984],[15.311814,-12.569085],[17.345993,-12.173029],[19.381966,-11.747570],[23.459465,-10.859447],[25.501082,-10.422288],[27.544668,-10.006732],[29.590270,-9.625533],[31.637930,-9.291441],[32.662547,-9.146046],[33.687695,-9.017210],[34.713379,-8.906527],[35.739607,-8.815591],[36.820412,-8.740829],[37.911927,-8.684434],[39.011201,-8.645356],[40.115281,-8.622547],[42.326048,-8.621540],[44.520609,-8.673021],[46.675342,-8.768601],[48.766628,-8.899889],[50.770846,-9.058495],[52.664377,-9.236029],[54.423599,-9.424099],[56.024893,-9.614315],[58.659215,-9.967625],[60.378380,-10.228835],[60.993427,-10.330821],[61.153258,-10.122919],[61.559458,-9.566154],[62.102085,-8.760936],[62.390203,-8.296535],[62.671201,-7.807676],[62.931335,-7.306909],[63.156863,-6.806786],[63.334043,-6.319858],[63.400208,-6.085264],[63.449132,-5.858676],[63.479098,-5.641662],[63.488387,-5.435792],[63.475283,-5.242634],[63.438067,-5.063757],[63.375021,-4.900731],[63.284427,-4.755123],[63.164569,-4.628504],[63.013727,-4.522441],[62.287614,-4.131249],[61.505761,-3.752740],[60.673336,-3.386895],[59.795506,-3.033699],[58.877438,-2.693132],[57.924298,-2.365178],[56.941254,-2.049821],[55.933474,-1.747042],[54.906123,-1.456824],[53.864369,-1.179150],[51.758320,-0.661365],[49.656664,-0.193548],[47.600737,0.224438],[45.631875,0.592731],[43.791414,0.911471],[42.120691,1.180794],[40.661043,1.400840],[38.540314,1.693651],[37.759917,1.791009],[36.570171,1.863116],[35.375338,1.917189],[34.176251,1.952951],[32.973742,1.970123],[31.768643,1.968429],[30.561788,1.947591],[29.354007,1.907332],[28.146134,1.847374],[26.939002,1.767440],[25.733441,1.667252],[24.530285,1.546532],[23.330366,1.405005],[22.134516,1.242391],[20.943568,1.058414],[19.758354,0.852795],[18.579707,0.625259],[17.417705,0.221546],[16.257276,-0.134169],[15.097032,-0.442718],[13.935585,-0.704934],[12.771549,-0.921648],[11.603537,-1.093694],[10.430160,-1.221903],[9.250032,-1.307109],[8.061766,-1.350142],[6.863974,-1.351836],[5.655269,-1.313023],[4.434264,-1.234535],[3.199571,-1.117204],[1.949804,-0.961864],[0.683575,-0.769345],[-0.600503,-0.540481],[-1.453720,-0.109067],[-3.803111,1.049276],[-5.440314,1.837343],[-7.333290,2.730698],[-9.442616,3.703859],[-11.728869,4.731346],[-14.152626,5.787678],[-16.674462,6.847372],[-19.254954,7.884949],[-21.854679,8.874925],[-23.149435,9.344101],[-24.434215,9.791821],[-25.704091,10.214900],[-26.954136,10.610154],[-28.179421,10.974397],[-29.375020,11.304444],[-30.536003,11.597110],[-31.657443,11.849209],[-32.556003,12.024945],[-33.515215,12.188980],[-34.529232,12.341715],[-35.592203,12.483551],[-37.841621,12.736132],[-40.216682,12.949937],[-42.670601,13.128178],[-45.156592,13.274068],[-47.627869,13.390817],[-50.037647,13.481639],[-52.339139,13.549746],[-54.485559,13.598350],[-58.126042,13.649898],[-60.584809,13.661982],[-61.487573,13.660299],[-61.665670,13.154337],[-62.100445,11.815088],[-62.367440,10.916716],[-62.642627,9.910504],[-62.907348,8.829947],[-63.142943,7.708539],[-63.330754,6.579774],[-63.400910,6.023099],[-63.452122,5.477146],[-63.482059,4.946100],[-63.488387,4.434149],[-63.468776,3.945479],[-63.420891,3.484277],[-63.342402,3.054731],[-63.230975,2.661026],[-63.084278,2.307349],[-62.899979,1.997887],[-62.793000,1.861046],[-62.675745,1.736828],[-62.547924,1.625757],[-62.409245,1.528357],[-62.259415,1.445151],[-62.098145,1.376662],[-61.925141,1.323413],[-61.740113,1.285929]]);
  }
}

module poly_path3022(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-61.401843,6.598895],[-56.283334,6.620900],[-51.570641,6.346607],[-47.220678,5.812273],[-43.190361,5.054155],[-39.436603,4.108511],[-35.916318,3.011597],[-29.403828,0.508988],[-23.308205,-2.163617],[-17.284763,-4.716163],[-14.192396,-5.856772],[-10.988817,-6.858594],[-7.630942,-7.685374],[-4.075683,-8.300855],[0.021400,-8.712536],[4.198410,-8.876851],[8.437958,-8.836847],[12.722658,-8.635574],[21.357959,-7.921415],[29.965212,-7.078762],[38.405314,-6.452005],[42.519214,-6.327209],[46.539164,-6.385534],[50.447775,-6.670027],[54.227659,-7.223737],[57.861429,-8.089713],[61.331697,-9.311005],[61.565715,-9.263348],[61.787798,-9.033030],[61.908101,-8.752296],[61.836777,-8.553395],[58.320409,-6.843513],[54.642926,-5.636190],[50.822522,-4.868529],[46.877389,-4.477635],[42.825722,-4.400611],[38.685714,-4.574562],[30.213447,-5.423803],[21.606135,-6.522190],[13.009324,-7.366555],[8.760341,-7.536239],[4.568563,-7.453729],[0.452184,-7.056129],[-3.570603,-6.280545],[-9.265710,-4.551876],[-15.824576,-2.149080],[-23.029926,0.618915],[-30.664484,3.443175],[-38.510976,6.014773],[-42.445799,7.109282],[-46.352127,8.024775],[-50.202801,8.722638],[-53.970661,9.164253],[-57.628548,9.311005],[-61.149303,9.124275],[-61.436361,8.988882],[-61.662559,8.687866],[-61.908101,7.817193],[-61.837378,6.968716],[-61.668247,6.695445],[-61.401843,6.598895]]);
  }
}