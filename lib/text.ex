defmodule Text do


  def apply(content, ops) do
    {new_content, _} = List.foldl(ops, {content, 0}, &apply_op/2)
    new_content
  end


  def apply_op(ins, {text, pos}) when is_binary(ins) do
    {head, tail} = String.split_at(text, pos)
    {head <> ins <> tail, pos}
  end

  def apply_op(mov, {text, pos}) when is_integer(mov) do
    {text, pos + mov}
  end

  def apply_op({:d, length}, {text, pos}) do
    {head, tail} = String.split_at(text, pos)
    removed = String.slice(tail, length, String.length(tail))
    {head <> removed, pos}
  end
end
