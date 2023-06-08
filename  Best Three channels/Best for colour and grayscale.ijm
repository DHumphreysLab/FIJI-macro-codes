dir1 = getDirectory("Save files folder");
setBatchMode(true);
imgArray = newArray(nImages);
for(i=0;i<nImages; i++) {
	selectImage(i+1);
	imgArray[i] = getImageID();
	title = getTitle;
	Stack.setChannel(1);
	setMinAndMax(125, 1944);
	Stack.setChannel(2);
	setMinAndMax(905, 2372);
	Stack.setChannel(3);
	setMinAndMax(527, 1013);
	Stack.setDisplayMode("composite");
	Stack.setActiveChannels("111");
	saveAs("tif", dir1+"composite_"+title);
	saveAs("png", dir1+"composite_"+title);
	Stack.setActiveChannels("100");
	saveAs("tif", dir1+"DAPI_"+title);
	saveAs("png", dir1+"DAPI_"+title);
	Stack.setActiveChannels("010");
	saveAs("tif", dir1+"gH_"+title);
	saveAs("png", dir1+"gH_"+title);
	Stack.setActiveChannels("001");
	saveAs("tif", dir1+"rpa_"+title);
	saveAs("png", dir1+"rpa_"+title);
	Stack.setDisplayMode("grayscale");
	Stack.setChannel(1);
	setMinAndMax(125, 1944);
	Stack.setChannel(2);
	setMinAndMax(875, 2161);
	Stack.setChannel(3);
	setMinAndMax(418, 1366);
	Stack.setChannel (1);
	saveAs("tif", dir1+"grayscale_DAPI_"+title);
	saveAs("png", dir1+"grayscale_DAPI_"+title);
	Stack.setChannel (2)
	saveAs("tif", dir1+"grayscale_gH_"+title);
	saveAs("png", dir1+"grayscale_gH_"+title);
	Stack.setChannel (3)
	saveAs("tif", dir1+"grayscale_rpa_"+title);
	saveAs("png", dir1+"grayscale_rpa_"+title);
	write("the counter of the loop is at" + i);
}
