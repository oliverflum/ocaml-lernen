module StringMap = Map.Make(String)
class store =
  object (self)
    val mutable map = StringMap.empty

    method get key def = 
      try begin
        let res = StringMap.find key map in
        res
      end with Not_found -> begin
        map <- StringMap.add key def map;
        def
      end
    
    method set key value =
      map <- StringMap.add key value map;
      key^": "^value
  end;;
 

let store_o = new gammel_store in

let eins = store_o#set "key" "value" in
print_string (eins^"\n");
let zwei = store_o#set "key" "PENULON" in
print_string (zwei^"\n");
