defmodule Procrastination.Mixfile do
  use Mix.Project

  def project do
    [ app: :procrastination,
      version: "0.0.1",
      elixir: "~> 0.11.1-dev",
      deps: deps ]
  end

  def application do
    []
  end

  defp deps do
    []
  end
end
