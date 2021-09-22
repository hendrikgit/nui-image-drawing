# Show any image via NUI
This allows you to show small images on the client without adding them to the module or nwsync.

This is experimental and so far not practical for bigger images (or maybe not at all). Drawing too many elements breaks the rendering on the client and also takes a few seconds.

The json for the elements to be drawn is generated with external programs because it takes too long to build in nwscript. Especially JsonArrayInsert() got slow when continuing to add elements to a large array.

## Quick start
* create a sqlite db and place it in your servers database folder `sqlite3 server/database/nui_images.sqlite3 < nui_images.sqlite3`
* compile the nim code and run `./tga2drawlist image.tga image.json`, the sqlite file in this project contains test data if you want to skip this step for now
* insert the contents of the generated json file into the sqlite db
* run the nwscript code, or similar code, in a module to see the drawn image
