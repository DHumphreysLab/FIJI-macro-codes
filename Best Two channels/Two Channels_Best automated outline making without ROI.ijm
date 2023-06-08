dir1 = getDirectory("Choose Destination Directory - Initial images");
dir2 = getDirectory("Choose Destination Directory - Save To directory");

//blank loop script for processing folder of images
list = getFileList(dir1);
setBatchMode(false);

for (i=0; i<list.length; i++) {
	showProgress(i+1, list.length);
	filename = dir1 + list[i];
	if (endsWith(filename, "nd2")) {
		open(filename);
	write("new loop entered i is at "+i);
	title = getTitle;
	four = "C4-" + title; 
	three = "C3-" + title;
	two = "C2-" + title; 
	one = "C1-" + title; 
	//Things that need to change if needed are scale bar width, setThreshold, Min and Max, and filenames
	run("Scale Bar...", "width=100 height=12 font=42 color=White background=None location=[Lower Right] bold hide overlay");
	write("made scale bars");
	run("Split Channels");
	write("channels are split");
	selectWindow(one);
	setMinAndMax(125, 1944);
	run("8-bit");
	run("8-bit");
	//run("Threshold...");
	run("Threshold...");
	waitForUser("set the threshold and press ok");
	setOption("BlackBackground", false);
	run("Make Binary");
	run("Outline");
	selectWindow(two);
	setMinAndMax(609, 1946);
	run("8-bit");
	run("8-bit");
	run("Merge Channels...", "c4=["+one+"] c6=["+two+"] create");
	saveAs("tif", dir2+"final image_" + title);
	run("Scale Bar...", "width=100 height=12 font=42 color=White background=None location=[Lower Right] bold hide overlay");
	saveAs("png", dir2+"final image_" + title);
	run("Close All");
		}
	}