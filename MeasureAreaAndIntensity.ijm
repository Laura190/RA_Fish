/*
 * Macro template to process multiple images in a folder
 */

#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".tif") suffix

// See also Process_Folder.py for a version of this code
// in the Python scripting language.

processFolder(input);

// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
	list = getFileList(input);
	list = Array.sort(list);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
	// Do the processing here by adding your own code.
	// Leave the print statements until things work, then remove them.
	print("Processing: " + input + File.separator + file);
	open(input + File.separator + file);
	title=getTitle();
	getDimensions(width, height, channels, slices, frames);
	if (channels > 1) {
		run("Split Channels");
		for (i = 1; i <= channels; i++) {
			selectWindow("C"+d2s(i,0)+"-"+title);
			ctitle=getTitle();
			measureIntensity(ctitle);
		}
	} else {
		measureIntensity(title);
	}
	run("Close All");
}

function measureIntensity(title) {
	selectWindow(title);
	setAutoThreshold("Default dark no-reset");
	setOption("BlackBackground", true);
	run("Convert to Mask", "background=Dark calculate black create");
	run("Set Measurements...", "area mean modal median stack redirect=["+title+"] decimal=3");
	run("Analyze Particles...", "size=10-Infinity display clear add stack");
	print("Saving to: " + output);
	saveAs("Results", output  + File.separator + title +"_IntensityResults.csv");
	roiManager("save", output  + File.separator + title +"_RoiSet.zip");
	roiManager("reset");
}
