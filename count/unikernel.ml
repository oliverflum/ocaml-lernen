open Lwt.Infix

module Count (Time : Mirage_time_lwt.S) = struct

  let start _time =

    let rec loop = function
      | 1000 -> Lwt.return_unit
      | n ->
        if n = 0 
          then Logs.err (fun m -> m "HELLO... (%i)" n)
          else Logs.err (fun m -> m "AGAIN (%i)" n);
        Time.sleep_ns (Duration.of_sec 1) >>= fun () ->
        loop (n+1)
    in
    loop 0

end
