module type Hello_type = sig
  val hello : unit -> unit
 end

module Hello : Hello_type = 
 struct
   let message = "Hello"
   let hello () = print_endline message
 end
   
 (* At this point, Hello.message is not accessible anymore. *)
 let goodbye () = print_endline "Goodbye"