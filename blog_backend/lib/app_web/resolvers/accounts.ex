defmodule AppWeb.Resolvers.Accounts do
  alias App.Accounts

  def get_author_profile(_parent, _, _resolution) do
    {:ok, Accounts.author_profile!()}
  end
end
