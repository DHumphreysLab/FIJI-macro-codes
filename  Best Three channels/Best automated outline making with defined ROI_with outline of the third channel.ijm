dir1 = getDirectory("Choose Destination Directory - Initial images");
dir2 = getDirectory("Choose Destination Directory - Save To directory");

//blank loop script for processing folder of images
list = getFileList(dir1);
setBatchMode(false);

for (i=0; i<list.length; i++) {
	showProgress(i+1, list.length);
	filename = dir1 + list[i];
	if (endsWith(filename, "tif")) {
		open(filename);
	write("new loop entered i is at "+i);
	title = getTitle;
	title2=replace(title,".tif","");
	outlinetwo = "C2-" + title2 + "-1" +".tif";
	three = "C1-" + title;
	two = "C3-" + title; 
	one = "C2-" + title; 
	//Things that need to change if needed are make rectangle, scale bar width, setThreshold, Min and Max, and filenames
	makeRectangle(372, 348, 580, 580);
	waitForUser("Find the desired field of view");
	run("Crop");
	run("Scale Bar...", "width=50 height=12 font=42 color=White background=None location=[Lower Right] bold hide overlay");
	write("made scale bars");
	run("Split Channels");
	write("channels are split");
	selectWindow(one);
	setMinAndMax(1475, 3865);
	run("8-bit");
	run("8-bit");
	//run("Threshold...");
	run("Threshold...");
	waitForUser("set the threshold and press ok");
	setOption("BlackBackground", false);
	run("Make Binary");
	run("Outline");
	run("Duplicate...", " ");
	selectWindow(two);
	setMinAndMax(1039, 1581);
	run("8-bit");
	run("8-bit");
	run("Merge Channels...", "c4=["+one+"] c6=["+two+"] create");
	saveAs("tif", dir2+"zoom_final image_" + title);
	run("Scale Bar...", "width=50 height=12 font=42 color=White background=None location=[Lower Right] bold hide overlay");
	saveAs("png", dir2+"zoom_final image_" + title);
	selectWindow(three);
	write("select the C3 window");
	setMinAndMax(724, 2359);
	run("8-bit");
	run("8-bit");
	write("finsihed grayscale RPA");
	run("Merge Channels...", "c4=["+outlinetwo+"] c1=["+three+"] create");
	saveAs("tif", dir2+"zoom_bp_"+title);
	run("Scale Bar...", "width=50 height=12 font=42 color=White background=None location=[Lower Right] bold hide overlay");
	saveAs("png", dir2+"zoom_bp_"+title);
	write("finished saving RPA");
	run("Close All");
		}
	}