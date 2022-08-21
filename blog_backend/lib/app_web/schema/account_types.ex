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
    field :profile, :profile, resolve: dataloader(Accounts)
    field :posts, list_of(:post), resolve: dataloader(Accounts)
  end

  object :session do
    field :user, :user
    field :token, :string
  end

  @desc "Profile info about blog owner"
  object :profile do
    field :avatar, :string
    field :about, :string
    field :description, :string
    field :company, :string
    field :occupation, :string
    field :github, :string
    field :linkedin, :string
    field :twitter, :string
    field :user, :user, resolve: dataloader(Accounts)
  end
end
