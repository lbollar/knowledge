# Metaprogramming

### Symbols
Symbol object is used for variable names and start with ':'

`:height`

### Expressions
Code is represented as as 'Expr' objects.

`:(height + 23)`

Expressions have two main fields
	- head: the type of the expression
	- args: the terms that make up the expression

```julia
a = :(x < $height < y)
#> :(x < 70 < y)
a.head
#> :comparison
a.args
#> 5-element Array{Any,1}:
#> :x
#> :<
#> 70
#> :<
#> :y
```

### Evaluation
Code is ran by evaluation.

`eval(:(height + 23))`

```julia
eval(:(height + 23))
#> ERROR: height not defined
eval(:(height = 70))
height
#> 70
eval(:(height + 23))
#> 93
```

eval always executes in the global namespace and not local so it is a good 
idea to avoid it.


