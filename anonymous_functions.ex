defmodule AnonymousFunctions do
  def functions() do
    #---Pattern matching---

    #Exercise:Functions-1
    #Go into IEx. Create and run the functions that do the following

    list_concat=fn [a,b],[c,d] -> [a,b] ++ [c,d] end
    IO.inspect(list_concat.([:a,:b], [:c,:d]))

    sum=fn (a,b,c) -> a+b+c end
    IO.puts(sum.(1,2,3))

    pair_tuple_to_list=fn {a,b} -> [a,b] end
    IO.inspect(pair_tuple_to_list.({1234,5678}))

    #---One Function, Multiple Bodies---

    #Exercise:Functions-2
    #Write a function that takes three arguments. If the first two are zero, return “FizzBuzz.”
    #If the first is zero, return “Fizz.” If the second is zero, return “Buzz.”
    #Otherwise return the third argument. Do not use any lan- guage features that we haven’t yet covered in this book.

    fizz_buzz=fn 
      {0,0,_} -> "FizzBuzz"
      {0,_,_} -> "Fizz"
      {_,0,_} -> "Buzz"
      {_,_,c} -> "#{c}"
    end

    IO.inspect(fizz_buzz.({0,0,1}))
    IO.inspect(fizz_buzz.({0,2,1}))
    IO.inspect(fizz_buzz.({2,0,1}))
    IO.inspect(fizz_buzz.({3,2,1}))

    #Exercise:Functions-3
    #The operator rem(a,b) returns the remainder after dividing a by b.
    #Write a function that takes a single integer (n) and calls the function in the previ- ous exercise, passing it rem(n,3), rem(n,5), and n.
    #Call it seven times with the arguments 10, 11, 12, and so on. You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.” 

    fizz_buzz2=fn (n) -> fizz_buzz.({rem(n,3),rem(n,5),n}) end
    IO.puts(fizz_buzz2.(10))
    IO.puts(fizz_buzz2.(11))
    IO.puts(fizz_buzz2.(12))
    IO.puts(fizz_buzz2.(13))
    IO.puts(fizz_buzz2.(14))
    IO.puts(fizz_buzz2.(15))
    IO.puts(fizz_buzz2.(16))

    #---Functions Can Return Functions---

    #Exercise:Functions-4
    #Write a function prefix that takes a string. It should return a new function that takes a second string.
    #When that second function is called, it will return a string containing the first string, a space, and the second string. 
    
    prefix=fn (a) -> (fn (b) -> "#{a} #{b}" end) end
    mrs=prefix.("Mrs")
    IO.puts(mrs.("Smith"))
    IO.puts(prefix.("Elixir").("Rocks"))

  end
end
