# Turn expressions like _ * max(_, 2) into anonomyous functions, i.e.
# x -> x * max(x, 2)

#This macro works with one array map calls

macro par(ex)
    Expr(:->, :_, ex)
end

println(map(@par(_ * max(_, 2)), 1:4))

macro par2(ex)
    count = length(matchall(r"_", string(ex)))
    if count == 0
        error("NO")
    else
        arr = split(string(ex), "_")
        arr = arr[2:(count + 1)]
        args = ""
        new_s = ""
       
        for (i,s)  in enumerate(arr)
          new_s = new_s * "_" * string(i) * " " * s
          args = args * "_" * string(i) * " ,"
        end
       
        Expr(:->, parse(args), parse(new_s))
    end
end

println(map(@par2(_ * max(_, 2)), 1:4, 4:-1:1))
