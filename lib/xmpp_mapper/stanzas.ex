defmodule XmppMapper.Stanza do

  defmodule JID do
    defstruct user: nil, server: nil, resource: nil, luser: nil, lserver: nil, lresource: nil

    # Watch inside jid.erl for the implementation adopted or
    # just convert to a tuple and use :jid.to_string
    def to_string(%JID{user: user, server: server, resource: res}) do
      "#{user}@#{server}"
    end

    def from_string(jid) do
      :jid.from_string(jid)
      |> XmppMapper.Mapper.to_struct
    end
  end

  defmodule IQ do
    defstruct id: nil, type: nil, lang: nil, from: nil, to: nil, error: nil, sub_els: nil
  end

  defmodule Bind do
    defstruct jid: nil, resource: nil
  end

  defmodule Chatstate do
    defstruct type: nil
  end

  defmodule Message do
    defstruct id: nil, type: nil, lang: nil, from: nil, to: nil, subject: nil,
      body: nil, thread: nil, error: nil, sub_els: nil
  end

  defmodule Presence do
    defstruct id: nil, type: nil, lang: nil, from: nil, to: nil, show: nil, status: nil, priority: nil,
      error: nil, sub_els: nil
  end

  defmodule DiscoItems do
    defstruct node: nil, items: nil
  end

  defmodule DiscoItem do
    defstruct jid: nil, name: nil, node: nil
  end

  defmodule Text do
    defstruct lang: nil, data: nil
  end

  defmodule Forwarded do
    defstruct delay: nil, sub_els: nil
  end
end
