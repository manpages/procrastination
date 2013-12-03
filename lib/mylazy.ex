defrecord Lazy, f: nil, args: nil do
  # waht the fuck is happening, why doesn't this get recompiled by mix
  def get(Lazy[f: f, args: args]) do
    args = Enum.map(args, fn(lazy = Lazy[]) -> get(lazy); (thing) -> thing end)
    apply(f, args)
  end
end
