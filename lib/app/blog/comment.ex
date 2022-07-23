defmodule App.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :comment, :string
    belongs_to :user, App.Accounts.User
    belongs_to :post, App.Blog.Post

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:comment, :post_id])
    |> validate_required([:comment])
    |> validate_length(:comment, min: 2, max: 500)
    |> assoc_constraint(:post)
  end
end
