(* -------------------------------------------------------------------------- *)
type error = private Ojs.t

val error_status : error -> int [@@js.get "status"]

val error_message : error -> string [@@js.get "message"]

type result = private Ojs.t

val result_status : result -> int [@@js.get "status"]

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type callback_installed = private Ojs.t

val create_callback_installed :
  ?success:(result -> unit) ->
  ?error:(unit -> unit) ->
  unit ->
  callback_installed
  [@@js.builder]

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type callback = private Ojs.t

val create_callback :
  ?error:(error -> unit) -> ?success:(unit -> unit) -> unit -> callback
  [@@js.builder]

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val open_file :
  string ->
  string ->
  ?cb:(callback[@js.default create_callback ()]) ->
  unit ->
  unit
  [@@js.global "cordova.plugins.fileOpener2.openFile"]

(* Only available on Android *)
val uninstall :
  string -> ?cb:(callback[@js.default create_callback ()]) -> unit -> unit
  [@@js.global "cordova.plugins.fileOpener2.uninstall"]

(* Only available on Android *)
val app_is_installed :
  string ->
  ?cb:(callback_installed[@js.default create_callback_installed ()]) ->
  unit ->
  unit
  [@@js.global "cordova.plugins.fileOpener2.appIsInstalled"]

(* -------------------------------------------------------------------------- *)

val open_ :
  file_name:string -> content_type:string -> callback -> unit
[@@js.global "cordova.plugins.fileOpener2.open"]
