defmodule Membrane.FFmpeg.SWResample do
  @moduledoc false
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = []

    opts = [strategy: :one_for_one, name: Membrane.FFmpeg.SWResample]
    Supervisor.start_link(children, opts)
  end
end
