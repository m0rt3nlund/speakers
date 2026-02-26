defmodule Speakers.NifAudio do
  @moduledoc false

  use Rustler,
    otp_app: :speakers,
    crate: :speakers,
    base_url: "https://github.com/m0rt3nlund/speakers/releases/download/v#{version}",
    version: version

  def add_to_queue(_file_path), do: :erlang.nif_error(:nif_not_loaded)
  def pause(), do: :erlang.nif_error(:nif_not_loaded)
  def resume(), do: :erlang.nif_error(:nif_not_loaded)
  def get_queue_len(), do: :erlang.nif_error(:nif_not_loaded)
  def get_volume(), do: :erlang.nif_error(:nif_not_loaded)
  def set_volume(_new_volume), do: :erlang.nif_error(:nif_not_loaded)
end
