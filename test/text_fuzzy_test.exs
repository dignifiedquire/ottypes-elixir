defmodule ExCheck.TextFuzzyTest do
  use ExUnit.Case, async: false
  use ExCheck
  #alias ExCheck.Sample


  def insert_op() do
    sized fn (s) -> insert_op(s) end
  end

  def insert_op(size) do
    sized fn (s) ->
            vector size, unicode_binary(s + 1, :utf8)
    end
  end

  def init_string(size) do
    unicode_binary(size, :utf8)
  end

  property :apply do
    for_all {initial, ops} in {init_string(5), insert_op(5)} do
      expected = Enum.join List.flatten([initial, ops]), ""
      expected == Text.apply initial, List.flatten [ String.length(initial), ops]
    end
  end

end