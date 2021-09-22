# Package

version       = "0.1.0"
author        = "Hendrik Albers"
description   = "Convert tga image to NuiDrawList"
license       = "MIT"
srcDir        = "src"
bin           = @["tga2drawlist"]


# Dependencies
requires "nim >= 1.4.8"
requires "https://github.com/hendrikgit/nimtga#0.2.0"
