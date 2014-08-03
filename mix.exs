defmodule Ottypes.Mixfile do
  use Mix.Project

  def project do
    [app: :ottypes,
     version: "0.0.1",
     elixir: "~> 0.14.3",
     deps: deps(Mix.env)]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: []]
  end

  defp deps(:test) do
    [{:excheck, github: "parroty/excheck"}]
  end

  defp deps(:dev) do
    [{:dialyze, "~> 0.1.2"}]
  end

  defp deps(_) do
    []
  end
end
