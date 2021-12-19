defmodule LexicalAnalysis do

  @operators ["/", "+", "-", "*"]
  @numbers 0..9 |> Enum.map(&(Integer.to_string(&1)))

  def lexical_analysis(["(" | tail]), do:
    lexical_analysis(tail) ++ [{:open_paren, "("}]
  def lexical_analysis([")" | tail]), do:
    lexical_analysis(tail) ++ [{:close_paren, ")"}]
  def lexical_analysis([head | tail]) when head in @operators do
    lexical_analysis(tail) ++ [{:operator, head}]
  end
  def lexical_analysis([head | tail]) when head in @numbers do
    number_automaton(tail, head)
  end
  def lexical_analysis([" " | tail]), do: lexical_analysis(tail)
  def lexical_analysis([]), do: []
  def lexical_analysis([s | _]), do: raise "Symbol(#{s}) not expected"

  def number_automaton([head | tail], number) when head in @numbers do
    number_automaton tail, (number <> head)
  end
  def number_automaton(ls, number), do: lexical_analysis(ls) ++ [{:number, number}]
end
