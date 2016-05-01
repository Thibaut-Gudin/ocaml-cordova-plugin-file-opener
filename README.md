# ocaml-cordova-plugin-file-opener

* gen_js_api (master branch): [![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-file-opener.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-file-opener)

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

## ! BE CAREFUL !

The plugin creates a new object called *cordova.plugins.fileOpener2*, but the object is
available when the *deviceready* event is handled.

We provide a function *Cordova_file_opener.t* of type *unit -> Cordova_file_opener.file_opener* which creates the
binding to the *cordova.plugins.fileOpener2* js object. You must call it when the deviceready
event is handled, eg

```OCaml
let on_device_ready _ =
  let file_opener = Cordova_file_opener.t () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
