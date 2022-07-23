defmodule AppWeb.Schema.BlogTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]
  alias App.{Blog}

  object :post do
    field :id, :id
    field :slug, :string
    field :title, :string
    field :excerpt, :string
    field :featured_image, :string
    field :content, :string
    field :published, :boolean

    field :comments, list_of(:comment), resolve: dataloader(Blog)

    field :user, :user, resolve: dataloader(Blog)
  end

  object :comment do
    field :id, :id
    field :comment, :string
    field :post, :post
    field :user, :user
  end
end
