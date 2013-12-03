defmodule MyStream do
  defrecord Lazy do
  end
  defimpl Enumerable, for: Lazy do
  end
end
