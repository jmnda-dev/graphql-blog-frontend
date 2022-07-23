defmodule AppWeb.Schema.BlogTypes do
  use Absinthe.Schema.Notation

  object :post do
    field :id, :id
    field :slug, :string
    field :title, :string
    field :excerpt, :string
    field :featured_image, :string
    field :content, :string
    field :published, :boolean
    field :comments, list_of(:comment)
    field :user, :user
  end

  object :comment do
    field :id, :id
    field :comment, :string
    field :post, :post
    field :user, :user
  end
end
