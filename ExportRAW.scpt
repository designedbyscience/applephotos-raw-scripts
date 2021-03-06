JsOsaDAS1.001.00bplist00�Vscript_Cvar photos = Application("Photos");
photos.includeStandardAdditions = true;

var app = Application.currentApplication();
app.includeStandardAdditions = true;

album = photos.albums().find(function (album) {
	return album.name().toLowerCase() == "raw files";
})

if (!album) {
	var scanEntireResponse = app.displayAlert("No RAW Files album found", {as:"warning", message: "There is no RAW Files smart album. Should we scan entire catalog for RAW files? This may take a very long time", buttons: ["Scan Entire Catalog", "Cancel"], defaultMessage: "Scan Entire Catalog", cancelMessage: "Cancel"});

	if (scanEntireResponse.buttonReturned != "Cancel" ){
		items = photos.mediaItems().filter(function(mi){
			return mi.filename().match(/crw|cr2|nef|arw/i);
		})
	} else {
		// Break
	}

} else {
	items = album.mediaItems().filter(function(mi){
			return !mi.filename().match(/dng/i);
		})
}

var outputFolder = photos.chooseFolder({
    withPrompt: "Please select an output folder:"
})

// Specify timeout longer than default
photos.export(items, {to: outputFolder, usingOriginals: true}, { timeout: 1500 });
var outputtedAlbum = photos.make({new: "album", named: "Outputed RAW"});

app.doShellScript('"/Applications/Adobe\ DNG\ Converter.app/Contents/MacOS/Adobe\ DNG\ Converter" -c ' + outputFolder + '/*');

photos.add(items, {to: outputtedAlbum});                              Y jscr  ��ޭ