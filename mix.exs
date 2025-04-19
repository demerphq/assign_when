defmodule AssignWhen.MixProject do
  use Mix.Project

  def project do
    [
      app: :assign_when,
      version: "0.1.0",
      elixir: "~> 1.0",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      name: "AssignWhen",
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/demerphq/assign_when"
    ]
  end

  defp description() do
    """
    Allows the use of `when` clauses on assignment statements as an alternative to using `if`,
    avoiding the need for boilerplate `else` clauses which return the original variables when
    the condition is `false`. Thus you can write

    ```elixir
    x = 1 when x == nil`
    ```

    instead of

    ```elixir
    x = if x == nil, do: 1, else: x`
    ```
    """
  end

  defp package do
    [
      name: :assign_when,
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/demerphq/assign_when"},
      maintainers: ["Yves Orton"],
      files: ~w(lib mix.exs .formatter.exs README.md LICENSE)
    ]
  end

  def application do
    []
  end

  defp deps do
    [{:ex_doc, "~> 0.14", only: :dev, runtime: false}]
  end
end
