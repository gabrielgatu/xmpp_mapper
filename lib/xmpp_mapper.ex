defmodule XmppMapper do
  use Application

  def start(_type, _args) do
    :ok = :jid.start
    Supervisor.start_link([], [strategy: :one_for_one])
  end
end
