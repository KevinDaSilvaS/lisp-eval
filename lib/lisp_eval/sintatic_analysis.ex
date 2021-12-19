defmodule SyntaticAnalysis do
  def syntatic_analysis([{:open_paren, _} | tail], parens, pt), do:
    operator tail, parens+1, pt
  def syntatic_analysis([{:close_paren, _} | tail], parens, pt), do:
    operator tail, parens-1, pt
  def syntatic_analysis([], 0, pt), do: pt
  def syntatic_analysis([], _, _), do: raise "Open close parens not equally balanced."

  def operator([{:operator, op} | tail], parens, pt), do:
    value(tail, parens, pt ++ [op])
  def operator(_, _, _), do: raise "Operator expected."

  def value([{:number, num} | tail], parens, pt), do:
    value(tail, parens, pt ++ [num])
  def value([{:open_paren, _} | tail], parens, pt), do:
    operator tail, parens+1, pt
  def value([{:close_paren, _} | tail], parens, pt), do:
    value tail, parens-1, pt
  def value([], parens, pt), do: syntatic_analysis [], parens, pt
  def value(_, _, _), do: raise "Value expected."
end
