import json, os
import nimtga

if paramCount() != 2:
  echo "Parameters: image.tga drawlist.json"
  quit(QuitFailure)
let imageFn = paramStr(1);
let outputFn = paramStr(2);

let tga = imageFn.readTgaFile

var drawlist = %*[]
for y in 0 .. tga.height - 1:
 for x in 0 .. tga.width - 1:
    # pixels in tga: last row of the image is at the beginning of the sequence
    let pixel = tga.pixels[(tga.height - 1 - y) * tga.width + x]
    drawlist &= %*{
      "color": {
        "a": pixel.alpha,
        "b": pixel.blue,
        "g": pixel.green,
        "r": pixel.red
      },
      "enabled": true,
      "fill": false,
      "line_thickness": 1.0,
      "points": [
        x.float,
        y.float,
        (x + 1).float,
        (y + 1).float
      ],
      "type": 0
    }

writeFile(outputFn, $drawlist)
