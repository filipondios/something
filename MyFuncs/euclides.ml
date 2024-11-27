
(* Euclides mcd *)
let rec euclides (a: int64) (b: int64) = 
  let rem = Int64.rem a b in 
  match rem with
  | 0L -> b 
  | _ -> euclides b rem


let rec extended_euclides' r s old_r old_s a b =
  match r with  
  | 0L -> 
    (match b with
    | 0L -> (old_s, 0L)
    | _  -> (old_s, Int64.div (Int64.sub old_r (Int64.mul old_s a)) b))
  | _ -> 
    let quot = Int64.div old_r r in 
    extended_euclides' 
      (Int64.sub old_r (Int64.mul quot r))
      (Int64.sub old_s (Int64.mul quot s))
      r s a b


let extended_euclides (a: int64) (b: int64) =
  extended_euclides' 0L b 1L a a b
