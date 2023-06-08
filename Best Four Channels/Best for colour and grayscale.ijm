dir1 = getDirectory("Choose Destination Directory - Initial images");
dir2 = getDirectory("Choose Destination Directory - Save To directory");

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

	makeRectangle(372, 348, 580, 580);
	waitForUser("Find the desired field of view");
	run("Crop");
	run("Scale Bar...", "width=50 height=12 font=42 color=White background=None location=[Lower Right] bold hide overlay");
	write("made scale bars");
	Stack.setChannel(1);
	setMinAndMax(14, 2721);
	Stack.setChannel(2);
	setMinAndMax(1170, 1777);
	Stack.setChannel(3);
	setMinAndMax(581, 3499);
	Stack.setChannel(4);
	setMinAndMax(770, 1876);
	Stack.setDisplayMode("composite");
	Stack.setActiveChannels("1111");
	saveAs("tif", dir1+"composite_"+title);
	saveAs("png", dir1+"composite_"+title);
	Stack.setActiveChannels("1000");
	saveAs("tif", dir1+"DAPI_"+title);
	saveAs("png", dir1+"DAPI_"+title);
	Stack.setActiveChannels("0100");
	saveAs("tif", dir1+"Wnt_"+title);
	saveAs("png", dir1+"Wnt_"+title);
	Stack.setActiveChannels("0010");
	saveAs("tif", dir1+"gH_"+title);
	saveAs("png", dir1+"gH_"+title);
	Stack.setActiveChannels("0001");
	saveAs("tif", dir1+"bgal_"+title);
	saveAs("png", dir1+"bgal_"+title);
	run("Close All");
		}
	}