defmodule AppWeb.Schema.TagTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]
  alias App.Blog

  object :tag do
    field :id, :id
    field :name, :string
    field :posts, list_of(:post), resolve: dataloader(Blog)
  end
end
