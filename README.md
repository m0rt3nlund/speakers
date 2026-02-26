# Speakers
This library let's you play audio files through the speakers (default output device). It also gives you the ability handle the file like a media player.

```
iex> Speakers.add_to_queue("/Users/test/Downloads/audio.mp3")
```
It uses `rust` via a NIF under the hood and is essentially a wrapper over the excellent library [rodio](https://github.com/RustAudio/rodio)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `speakers` to your list of dependencies in `mix.exs`:

## Compilation and distribution
```
mix compile
tar -czf release/speakers_nifaudio-v0.1.0-nif-2.15-x86_64-pc-windows-msvc.dll.tar.gz _build/prod/lib/speakers/priv/native/speakers_nifaudio.dll
cp priv/native/speakers_nifaudio.dll priv/native/speakers_nifaudio-v0.1.0-nif-2.15-x86_64-pc-windows-msvc.dll
mix rustler_precompiled.download Speakers --all --print --ignore-unavailable
```

```elixir
def deps do
  [
    {:speakers, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/speakers](https://hexdocs.pm/speakers).
