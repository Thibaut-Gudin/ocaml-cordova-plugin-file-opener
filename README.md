# ocaml-cordova-plugin-file-opener

[![LGPL-v3 licensed](https://img.shields.io/badge/license-LGPLv3-blue.svg)](https://raw.githubusercontent.com/dannywillems/ocaml-cordova-plugin-file-opener/master/LICENSE)
[![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-file-opener.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-file-opener)

Binding to
[cordova-plugin-file-opener](https://github.com/apache/cordova-plugin-file-opener2)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-file-opener-example).

## What does cordova-plugin-file-opener do ?

```
This plugin defines a global navigator.file-opener object, which provides an API for
taking pictures and for choosing images from the system's image library.
```

Source: [cordova-plugin-file-opener](https://github.com/apache/cordova-plugin-file-opener)

## Repository branches and tags

Only gen_js_api version is provided.

The binding has not been tested but it compiles.

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0
```

You can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-file-opener https://github.com/dannywillems/ocaml-cordova-plugin-file-opener.git
```

and to compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package cordova-plugin-file-opener [...] -linkpkg [other arguments]
```

Don't forget to install the cordova plugin file opener with
```Shell
cordova plugin add cordova-plugin-file-opener2
```

## How to use ?

See the official documentation: [cordova-plugin-file-opener](https://github.com/apache/cordova-plugin-file-opener2)
