defmodule TextTest do
  use ExUnit.Case

  test "text.apply" do

    cases = [
             {"hello world" , ["hello", [5, " world"]]},
             {"", ["hello", [{:d, 5}]]},
             {"hello", ["", ["hello"]]},
             {"hellöö", ["hellö", [5, "ö"]]}
    ]
    Enum.each cases, fn({expected, input}) ->
                       assert expected == apply(Text, :apply, input)
    end
  end
end
