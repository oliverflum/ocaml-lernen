open Mirage

let main =
  foreign
    ~packages:[
      package "duration"
    ]
    "Unikernel.Count" (time @-> job)

let () =
  register "count" [main $ default_time]
