defmodule AppWeb.Schema.BlogTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]
  alias App.{Accounts, Blog}

  object :post do
    field :id, :id
    field :slug, :string
    field :title, :string
    field :excerpt, :string
    field :featured_image, :string
    field :content, :string
    field :published, :boolean
    field :updated_at, :date

    field :author, :user, resolve: dataloader(Accounts)
    field :tags, list_of(:tag), resolve: dataloader(Blog)
  end
end
