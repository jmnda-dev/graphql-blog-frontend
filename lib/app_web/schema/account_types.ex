defmodule AppWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  @desc "A user of the blog"
  object :user do
    field :id, :id
    field :email, :string
    field :posts, list_of(:post)
  end
end
