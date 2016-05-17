defmodule XmppMapper.Mapper do
  alias XmppMapper.Stanza.{JID, IQ, Bind, Chatstate, Message, Presence, DiscoItems, DiscoItem, Text, Forwarded}

  @doc """
  Converts the result from :xmpp_codec.decode (which is a record) into a struct.
  """
  def to_struct({:iq, id, type, lang, from, to, error, sub_els}) do
    %IQ{
      id: id,
      type: type,
      lang: lang,
      from: to_struct(from),
      to: to_struct(to),
      error: error,
      sub_els: to_struct(sub_els)}
  end

  def to_struct({:chatstate, type}) do
    %Chatstate{type: type}
  end

  def to_struct({:message, id, type, lang, from, to , subject, body, thread, error, sub_els}) do
    %Message{
      id: id,
      type: type,
      lang: lang,
      from: to_struct(from),
      to: to_struct(to),
      subject: subject,
      body: body,
      thread: thread,
      error: error,
      sub_els: to_struct(sub_els)}
  end

  def to_struct({:bind, jid, resource}) do
    %Bind{
      jid: jid,
      resource: resource}
  end

  def to_struct({:jid, user, server, resource, luser, lserver, lresource}) do
    %JID{
      user: user,
      server: server,
      resource: resource,
      luser: luser,
      lserver: lserver,
      lresource: lresource}
  end

  def to_struct({:presence, id, type, lang, from, to, show, status, priority, error, sub_els}) do
    %Presence{
      id: id,
      type: type,
      lang: lang,
      from: to_struct(from),
      to: to_struct(to),
      show: show,
      status: Enum.map(status, &to_struct/1),
      priority: priority,
      error: error,
      sub_els: to_struct(sub_els)}
  end

  def to_struct({:disco_items, node, items}) do
    %DiscoItems{
      node: node,
      items: to_struct(items)}
  end

  def to_struct({:disco_item, jid, name, node}) do
    %DiscoItem{
      jid: to_struct(jid),
      name: name,
      node: node}
  end

  def to_struct({:text, lang, data}) do
    %Text{
      lang: lang,
      data: data}
  end

  def to_struct({:forwarded, delay, sub_els}) do
    %Forwarded{
      delay: delay,
      sub_els: to_struct(sub_els)}
  end

  def to_struct(coll) when is_list(coll), do: Enum.map(coll, &to_struct/1)
  def to_struct(record), do: record
end
