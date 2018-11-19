defmodule MergeIndex.MixProject do
  use Mix.Project

  @vsn "2.1.0"

  def project do
    [
      app: :merge_index,
      version: @vsn,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      erlc_options: [{:parse_transform, :lager_transform}],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {:mi_app, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:lager_logger, git: "https://github.com/PSPDFKit-labs/lager_logger.git"}
    ]
  end
end
