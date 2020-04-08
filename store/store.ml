module StringMap = Map.Make(String)
class store = 
  object (self)
    val mutable map = StringMap.empty
    method get key def = begin
      try StringMap.find key map
      with Not_found -> begin
        store <- StringMap.add key def map;
        def
      end
    end
    method set key value = begin
      try begin
        let cur = StringMap.find key map in
        store <- StringMap.update key value map;
        value
      end
      with Not_found -> begin
        store <- StringMap.add key value store;
        key ^ " = " ^ value
      end
    end
  end 

let store_o = new store;
store_o#get "a" "b";
store_o#set "a" "c";
store_o#get "a" "b";
