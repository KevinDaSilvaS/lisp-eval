defmodule LispEval do
  import LexicalAnalysis,  only: [lexical_analysis: 1]
  import SyntaticAnalysis, only: [syntatic_analysis: 3]
  import SemanticAnalysis, only: [semantic_analysis: 1]
  import IO.ANSI, only: [blue_background: 0, reset: 0]

  def main(filepath) do
    program = File.read!(filepath)
      |> String.split("", trim: true)
      |> lexical_analysis()
      |> Enum.reverse()
      |> syntatic_analysis(0, [])
    {out, _} = semantic_analysis program
    IO.puts blue_background() <> "[ Output: #{out} ]" <> reset()
  end
end
