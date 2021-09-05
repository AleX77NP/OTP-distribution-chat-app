# Chat

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `chat` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chat, "~> 0.1.0"}
  ]
end
```

# Usage

First terminal:
```
iex --sname first@localhost -S mix
```

Second termina:
```
iex --sname second@localhost -S mix

```

From the first terminal send a list of numbers: 
```
Chat.send_list(:second@localhost, [1,2,3,4,5,6,7,8])
```
Second node will calculate the sum and return # 36.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/chat](https://hexdocs.pm/chat).

