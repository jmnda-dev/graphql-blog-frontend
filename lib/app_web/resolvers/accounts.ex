defmodule AppWeb.Resolvers.Accounts do
  alias App.Accounts

  def find_user(_parent, %{id: id}, _resolution) do
    case Accounts.get_user(id) do
      nil ->
        {:error, "User ID #{id} not found"}

      user ->
        {:ok, user}
    end
  end
end
