defmodule XmppMapper.Parser do

  @c2s_stanzas ["iq", "presence", "message"]

  @doc """
  Parses the xml string and returns an xmpp struct.
  """
  @spec parse(String.t) :: struct()
  def parse(xml) do
    xml
    |> :fxml_stream.parse_element
    |> handle_parsed_result
  end

  defp handle_parsed_result({:error, message}) do
    {:error, message}
  end

  defp handle_parsed_result({:xmlel, "success", _, _}) do
    # TODO: What to do here?
    {:error, "What to do with success?"}
  end

  defp handle_parsed_result(record) do
    stanza =
      record
      |> add_missing_namespaces
      |> :xmpp_codec.decode
      |> XmppMapper.Mapper.to_struct

    {:ok, stanza}
  end

  # If the root stanza is of c2s family, then ensure it has the jabber:client xmlns namespace
  # Otherwise return it.
  defp add_missing_namespaces({:xmlel, name, [{"xmlns", _} | attrs], children}) when name in @c2s_stanzas, do:
    add_missing_namespaces({:xmlel, name, attrs, children})

  defp add_missing_namespaces({:xmlel, name, attrs, children}) when name in @c2s_stanzas, do:
    {:xmlel, name, [{"xmlns", "jabber:client"} | attrs], children}

  defp add_missing_namespaces(xml), do: xml
end
