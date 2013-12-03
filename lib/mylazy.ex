defrecord Lazy, f: nil, args: nil do
  def get(Lazy[f: f, args: args]) do
    args = Enum.map(args, fn(lazy = Lazy[]) -> get(lazy); (thing) -> thing end)
    apply(f, args)
  end
end

defmodule AParser do
  @stuff "5ABCDE4abcdsomeotherstuff"

  def parse_stuff(), do: parse(@stuff)

  def parse(stuff) do
    first = Lazy.new(f: fn(x) -> 
      {count, rest} = get_count(x)
      do_parse(count, rest)
    end, args: [stuff])
    Lazy.new(f: fn({acc, rest}) -> 
      {count, rest} = get_count(rest)
      {second, rest} = do_parse(count, rest)
      {acc, second, rest}
    end, args: [first])
  end

  defp get_count(stuff) do
    count = stuff |> String.first |> binary_to_integer
    rest  = stuff |> String.slice(1, String.length(stuff))
    {count, rest}
  end
  
  defp do_parse(count, rest) do
    {rest |> String.slice(0, count), rest |> String.slice(count, String.length(rest))}
  end

end
