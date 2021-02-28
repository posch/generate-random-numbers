let n = int_of_string(Sys.argv.(1)) ;;
for i = 1 to n do
  Printf.printf "%.6f\n" (Random.float 1.0)
done
