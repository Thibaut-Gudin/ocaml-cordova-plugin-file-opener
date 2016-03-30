(* -------------------------------------------------------------------------- *)
class error : Ojs.t ->
  object
    inherit Ojs.obj

    method status     : int
    method message    : string
  end

class result : Ojs.t ->
  object
    inherit Ojs.obj
    method status     : int
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class callback : Ojs.t ->
  object
    inherit Ojs.obj

    method error    : error -> unit
    method success  : unit -> unit
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class callback_installed : Ojs.t ->
  object
    inherit Ojs.obj

    method success  : result -> unit
    method error    : unit -> unit
  end

val create_callback_installed :
  ?success:(result -> unit) ->
  ?error:(unit -> unit)     ->
  unit                      ->
  callback_installed
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val create_callback :
  ?error:(error -> unit)  ->
  ?success:(unit -> unit) ->
  unit                    ->
  callback
  [@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class file_opener : Ojs.t ->
  object
    inherit Ojs.obj
    method open_file :  string                                          ->
                        string                                          ->
                        ?cb:(callback [@js.default create_callback ()]) ->
                        unit                                            ->
                        unit

    (* Only available on Android *)
    method uninstall :  string                                          ->
                        ?cb:(callback [@js.default create_callback ()]) ->
                        unit                                            ->
                        unit

    (* Only available on Android *)
    method app_is_installed : string                                ->
                              ?cb:(callback_installed [@js.default
                              create_callback_installed ()])        ->
                              unit                                  ->
                              unit
  end
(* -------------------------------------------------------------------------- *)
