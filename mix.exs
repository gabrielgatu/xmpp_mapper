defmodule XmppMapper.Mixfile do
  use Mix.Project

  def project do
    [app: :xmpp_mapper,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Type "mix help compile.app" for more information
  def application do
    [
      mod: {XmppMapper, []},
      applications: [:logger, :fast_xml, :stringprep]
    ]
  end

  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:fast_xml, "~> 1.1"},
      {:stringprep, "~> 1.0"}
    ]
  end
end
