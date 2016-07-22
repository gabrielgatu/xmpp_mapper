# XmppMapper

WARNING: Project not maintained anymore. Use it only as a starting point.

XmppMapper is a small - still unfinished and unstable - library for xmpp stanza parsing.
It uses underneath the fast_xml and xmpp_codec libraries, by the awesome ejabberd team.

## Why

I've created this library because of my [elixible](https://github.com/gabrielgatu/elixible) project.
From what I've seen, there is not much to choose in xmpp parser in elixir, but there are some in the erlang
community. So I've just readapted some of this libraries to work nice with elixir and provide a nice API.

## How it works

It's really simple: through the `XmppMapper.Parser.parse/1` you can parse a xml stanza into an elixir struct.

Most of the structs don't have functions, but the `Stanza.JID` has some utility ones.

## Coverage

You can see inside the `stanzas.ex` module what stanzas are supported. As soon as I have some free time I'll
port the other stanzas as well.

## License

The MIT License (MIT)

Copyright (c) 2016 Gabriel Gatu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
