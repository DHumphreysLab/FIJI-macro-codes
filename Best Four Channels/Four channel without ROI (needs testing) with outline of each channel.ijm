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
	title2=replace(title,".nd2","");
	outlinethree = "C1-" + title2 + "-2" + ".nd2";
	outlinetwo = "C1-" + title2 + "-1" +".nd2";
	four = "C4-" + title; 
	three = "C3-" + title;
	two = "C2-" + title; 
	one = "C1-" + title; 
	//Things that need to change if needed are make rectangle, scale bar width, setThreshold, Min and Max, and filenames
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
	run("Duplicate...", " ");
	run("Duplicate...", " ");
	selectWindow(two);
	setMinAndMax(875, 2161);
	run("8-bit");
	run("8-bit");
	run("Merge Channels...", "c4=["+one+"] c6=["+two+"] create");
	saveAs("tif", dir2+"zoom_final image_" + title);
	run("Scale Bar...", "width=100 height=12 font=42 color=White background=None location=[Lower Right] bold hide overlay");
	saveAs("png", dir2+"zoom_final image_" + title);
	selectWindow(three);
	write("select the C3 window");
	setMinAndMax(418, 1366);
	run("8-bit");
	run("8-bit");
	write("finsihed grayscale RPA");
	run("Merge Channels...", "c4=["+outlinetwo+"] c5=["+three+"] create");
	saveAs("tif", dir2+"zoom_grayscale_RPA_"+title);
	run("Scale Bar...", "width=100 height=12 font=42 color=White background=None location=[Lower Right] bold hide overlay");
	saveAs("png", dir2+"zoom_grayscale_RPA_"+title);
	write("finished saving RPA");
	selectWindow(four);
	write("select the C4 window");
	setMinAndMax(418, 1366);
	run("8-bit");
	run("8-bit");
	write("finished beta gal");
	run("Merge Channels...", "c4=["+outlinethree+"] c2=["+four+"] create");
	saveAs("tif", dir2+"zoom_betagal_"+title);
	run("Scale Bar...", "width=100 height=12 font=42 color=White background=None location=[Lower Right] bold hide overlay");
	saveAs("png", dir2+"zoom_betagal_"+title);
	write("finished saving betagal");
	run("Close All");
		}
	}