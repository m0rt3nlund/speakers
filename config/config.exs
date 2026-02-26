import Config

config :speakers, Speakers.NifAudio,
  path: "native/speakers",
  mode: if(Mix.env() == :prod, do: :release, else: :debug)
