//Open image
//selectImage("C1-MAX_16.11.23-time-lapse.czi - 16.11.23-time-lapse #2.tif");
run("Z Project...", "projection=[Max Intensity]");
setAutoThreshold("Huang dark no-reset");
//run("Threshold...");
setOption("BlackBackground", true);
run("Convert to Mask");
run("Analyze Particles...", "size=100-Infinity add");
n_auto_rois=roiManager("count");

waitForUser("Select and/or combine ROIs and add to Manager. Click OK when finished");

n_user_rois=roiManager("count")
for (i = n_auto_rois; i <= n_user_rois; i++) {
roiManager("Select", i);
run("Convex Hull");
roiManager("Add");
}

for (i = 0; i <= n_auto_rois; i++) {
roiManager("Select", 0);
roiManager("delete");
}

for (i = 0; i < n_user_rois-n_auto_rois; i++) {
roiManager("Select", 0);
roiManager("delete");
}

