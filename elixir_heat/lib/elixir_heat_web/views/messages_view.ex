defmodule ElixirHeatWeb.MessagesView do
  use ElixirHeatWeb, :view

  def render("create.json", %{message: message}) do
    %{
      result: "Message created!",
      message: message
    }
  end
end
