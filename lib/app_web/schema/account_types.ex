defmodule AppWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]
  alias App.Accounts

  @desc "A user of the blog"
  object :user do
    field :id, :id
    field :email, :string
    field :posts, list_of(:post), resolve: dataloader(Accounts)
    field :comments, list_of(:comment), resolve: dataloader(Accounts)
  end
end
