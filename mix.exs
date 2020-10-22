defmodule Membrane.FFmpeg.SWResample.Mixfile do
  use Mix.Project

  @github_url "https://github.com/membraneframework/membrane_ffmpeg_swresample_plugin"
  @version "0.3.0"

  def project do
    [
      app: :membrane_ffmpeg_swresample_plugin,
      compilers: [:unifex, :bundlex] ++ Mix.compilers(),
      version: @version,
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      description:
        "Plugin performing audio conversion, resampling and channel mixing, using SWResample module of [FFmpeg](https://www.ffmpeg.org/) library.",
      package: package(),
      name: "Membrane FFmpeg SWResample plugin",
      output_url: @github_url,
      docs: docs(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [],
      mod: {Membrane.FFmpeg.SWResample, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "v#{@version}"
    ]
  end

  defp package do
    [
      maintainers: ["Membrane Team"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => @github_url,
        "Membrane Framework Homepage" => "https://membraneframework.org"
      },
      files: [
        "lib",
        "c_src",
        "ext",
        "mix.exs",
        "README*",
        "LICENSE*",
        ".formatter.exs",
        "bundlex.exs"
      ]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:membrane_core, "~> 0.5.0"},
      {:membrane_caps_audio_raw, "~> 0.2.0"},
      {:bunch, "~> 1.0"},
      {:unifex, "~> 0.2.0"},
      {:membrane_common_c, "~> 0.3.0"},
      {:bundlex, "~> 0.2.7"},
      {:mockery, "~> 2.1", runtime: false}
    ]
  end
end
