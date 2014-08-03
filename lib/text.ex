defmodule Text do

  # Custom Types
  @type text_mov_op :: integer
  @type text_del_op :: {:d, non_neg_integer}
  @type text_ins_op :: String.t
  @type text_op :: text_mov_op | text_del_op | text_ins_op


  # API

  @spec apply(String.t, [text_op]) :: String.t
  def apply(content, ops) do
    {new_content, _} = List.foldl(ops, {content, 0}, &apply_op/2)
    new_content
  end


  # Internal Functions

  @spec apply_op(text_op, {String.t, non_neg_integer}) :: {String.t, non_neg_integer}

  def apply_op(ins, {text, pos}) when is_binary(ins) do
    {head, tail} = String.split_at(text, pos)
    {head <> ins <> tail, pos + String.length(ins)}
  end

  def apply_op(mov, {text, pos}) when is_integer(mov) do
    {text, pos + mov}
  end

  def apply_op({:d, length}, {text, pos}) do
    {head, tail} = String.split_at(text, pos)
    removed = String.slice(tail, length, String.length(tail))
    {head <> removed, pos}
  end

  def apply_op(op, {_text, _pos}) do
    raise ArgumentError, message: :io.format("invalid op: ~p", [op])
  end

end
