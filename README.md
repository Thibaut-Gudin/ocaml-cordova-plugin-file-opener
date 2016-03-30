# ocaml-cordova-plugin-file-opener

Binding to
[cordova-plugin-file-opener](https://github.com/apache/cordova-plugin-file-opener)

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

## How to use ?

TODO

## ! BE CAREFUL !

The plugin creates a new object called *cordova.plugins.fileOpener2*, but the object is
available when the *deviceready* event is handled.

We don't provide a *file_opener* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *file_opener* will be set to **undefined**
because the *file_opener* object doesn't exist when we create the variable.

Instead, we provide a function *File_opener.t* of type *unit -> File_opener.file_opener* which creates the
binding to the *cordova.plugins.fileOpener2* js object. You must call it when the deviceready
event is handled, eg

```OCaml
let on_device_ready _ =
  let file_opener = File_opener.t () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
