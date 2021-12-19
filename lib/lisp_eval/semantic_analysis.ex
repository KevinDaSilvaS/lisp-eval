defmodule SemanticAnalysis do
  def semantic_analysis(["*" | tail]) do
    {v1, nTail}  = semantic_analysis tail
    {v2, nNtail} = semantic_analysis nTail
    {v1 * v2, nNtail}
  end
  def semantic_analysis(["/" | tail]) do
    {v1, nTail}  = semantic_analysis tail
    {v2, nNtail} = semantic_analysis nTail
    case v2 do
      0 -> raise "Error division by zero"
      _ -> {v1 / v2, nNtail}
    end
  end
  def semantic_analysis(["-" | tail]) do
    {v1, nTail}  = semantic_analysis tail
    {v2, nNtail} = semantic_analysis nTail
    {v1 - v2, nNtail}
  end
  def semantic_analysis(["+" | tail]) do
    {v1, nTail}  = semantic_analysis tail
    {v2, nNtail} = semantic_analysis nTail
    {v1 + v2, nNtail}
  end
  def semantic_analysis([head | tail]), do: {round(String.to_integer(head)), tail}
end
