defmodule ElixirHeat.Messages.Get do
  import Ecto.Query

  alias ElixirHeat.{Message,Repo}

  def today_messages do
    today = Date.utc_today()
    query = from message in Message, where: type(message.inserted_at, :date) == ^today

    Repo.all(query)
  end
end
