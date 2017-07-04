# Apple Photos RAW Scripts
AppleScript for managing RAW files in Apple Photos

When importing via Camera Connection Kit, lots of CR2, NEF, etc. files end up in your Apple Photos library. Depending on your workflow, you may want to delete them from their or re-encode them to DNG in order to save space.

## Exporting and Converting

### ExportRAW.scpt

This script will 
- Look for non-DNG RAW files in your library (first in an album called "RAW Files")
- Export them to a folder
- Convert the exported RAW files with the [Adobe DNG converter](https://helpx.adobe.com/photoshop/using/adobe-dng-converter.html)
- Put the original RAW files that exist in your catalog into an album called "Outputted RAW"

At this point, you can:
1. Delete the RAW files in your library, via the Outputted RAW album
2. Reimport the new DNG files

WARNING: If you delete and reimport the RAW images, they will not be added to any albums you may have created. Any manual organization will be disrupted by the deleting and importing process. 

## Usage Instructions

### Prerequisties 

- Adobe DNG Converter installed in your Applications folder
- Suggested: Smart Album named RAW Files
*If you don't have a smart album named RAW Files, the script can search your entire library of photos for RAW files. However, this will take a lot longer*

### Running the script
1. Open Photos
2. Open the `ExportRAW.scpt` in Script Editor
3. Run the Script by pressing the play button in the toolbar
4. It will ask for an output folder 




