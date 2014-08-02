defmodule TextTest do
  use ExUnit.Case

  test "apply" do

    cases = [
             {"hello world" , ["hello", [5, " world"]]},
             {"", ["hello", [{:d, 5}]]},
             {"hello", ["", ["hello"]]},
             {"hellöö", ["hellö", [5, "ö"]]},
             {"hello world", ["", ["h", "e", "ll", "o", " wor", "ld"]]},
             {"hello", ["world", [{:d, 2}, {:d, 3}, "h", "ello"]]},
             {"hi", ["hello", [1, {:d, 1}, {:d, 1}, {:d, 2},"i"]]},
             {"hi", ["hello", [1, {:d, 1}, "i", {:d, 3}]]}
    ]
    Enum.each cases, fn({expected, input}) ->
                       assert expected == apply(Text, :apply, input)
    end
  end
end
