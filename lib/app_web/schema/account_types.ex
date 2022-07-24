defmodule AppWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]
  alias App.Accounts

  @desc "A user of the blog"
  object :user do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :email, :string
    field :posts, list_of(:post), resolve: dataloader(Accounts)
  end

  object :session do
    field :user, :user
    field :token, :string
  end
end
