defmodule Speakers.MixProject do
  use Mix.Project
  
  @version "0.1.0"
  
  def project do
    [
      app: :speakers,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler_precompiled, "~> 0.8"},
      {:rustler, "~> 0.37.0"},
      {:ex_doc, "~> 0.21.2", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Library for playing remote audio files
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Raza Gill"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/razagill/speakers"}
    ]
  end
end
