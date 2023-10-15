say = fn a -> IO.puts(a) end
ask = fn a -> IO.gets(a) end

defmodule Maths do
  @moduledoc """
  This is my calculator!
  """
  def add(left, right) do
    left + right
  end

  def subtract(left, right) do
    left - right
  end

  def times(left, right) do
    left * right
  end

  def divide(left, right) do
    left / right
  end

end

username = ask.("Hello user. What is your name? ")

message = "Hello #{username}!"

age = ask.("How old are you, #{username}? ")

userData = [username, age ]
userPointers = [String.length(message)]
userDataComplete = userData ++ userPointers

_tuple = { :name, "Benício", "Antônio", "Trabalho"}

say.(hd(userDataComplete))
say.(5*5)
5 * 5 == 25 or raise("This is an exception!")

affirm = say.(Maths.times(2, 3))
say.(affirm)
