defmodule AppWeb.AuthToken do
  @user_signing_salt "lr^qmvFA$kob^oAFG"

  @doc """
  Encodes the given user and signs it, returning a token clients can use
  as identification when using the API.
  """

  def sign(user) do
    Phoenix.Token.sign(
      AppWeb.Endpoint,
      @user_signing_salt,
      %{
        id: Map.get(user, :id),
        username: Map.get(user, :username),
        email: Map.get(user, :email),
        first_name: Map.get(user, :first_name),
        last_name: Map.get(user, :last_name)
      }
    )
  end

  @doc """
  Decodes the given token and returns the user it represents.
  """

  def verify(token) do
    Phoenix.Token.verify(
      AppWeb.Endpoint,
      @user_signing_salt,
      token,
      max_age: 365 * 24 * 3600
    )
  end
end
