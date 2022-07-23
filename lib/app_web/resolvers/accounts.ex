defmodule AppWeb.Resolvers.Accounts do
  alias App.Accounts
  alias AppWeb.Schema.ChangesetErrors
  alias AppWeb.AuthToken

  def find_user(_parent, %{id: id}, _resolution) do
    case Accounts.get_user(id) do
      nil ->
        {:error, "User ID #{id} not found"}

      user ->
        {:ok, user}
    end
  end

  def signup(_parent, args, _resolution) do
    case Accounts.register_user(args) do
      {:error, changeset} ->
        {:error,
         message: "Could not create account", details: ChangesetErrors.error_details(changeset)}

      {:ok, user} ->
        {:ok, %{user: user, token: AuthToken.sign(user)}}
    end
  end

  def signin(_, %{email: email, password: password}, _) do
    case Accounts.authenticate(email, password) do
      {:ok, user} ->
        {:ok, %{user: user, token: AuthToken.sign(user)}}

      :error ->
        {:error, "Invalid email or password"}
    end
  end
end
