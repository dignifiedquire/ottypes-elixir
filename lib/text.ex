defmodule Text do

  # Custom Types
  @type text_op :: binary | {:d, integer} | integer


  # API

  @spec apply(binary, [text_op]) :: binary
  def apply(content, ops) do
    {new_content, _} = List.foldl(ops, {content, 0}, &apply_op/2)
    new_content
  end


  # Internal Functions

  @spec apply_op(text_op, {binary, integer}) :: {binary, integer}

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
