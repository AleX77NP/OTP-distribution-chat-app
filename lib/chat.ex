defmodule Chat do
  @moduledoc false

  @spec recieve_message(any) :: :ok
  def recieve_message(message) do
    IO.puts message
  end
  def send_message(recipient, message) do
    spawn_task(__MODULE__, :recieve_message, recipient, [message])
  end

  def send_list(recipient, list) do
    spawn_task(__MODULE__, :recieve_list_and_sum, recipient, [list])
  end

  def recieve_list_and_sum(list) do
    node = hd(Node.list())
    result = Enum.reduce(list, fn (x, acc) -> acc + x end)
    send_message(node, result)
  end

  def spawn_task(module, fun, recipient, args) do
    recipient
    |> remote_supervisor()
    |> Task.Supervisor.async(module, fun, args)
    |> Task.await()
  end

  def remote_supervisor(recipient) do
    {Chat.TaskSupervisor, recipient}
  end
end
