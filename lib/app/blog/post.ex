defmodule App.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :excerpt, :string
    field :featured_image, :string
    field :published, :boolean, default: false
    field :slug, :string
    field :title, :string
    belongs_to :author, App.Accounts.User
    many_to_many :tags, App.Blog.Tag, join_through: "posts_tags"

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:slug, :title, :excerpt, :featured_image, :content, :published, :author_id])
    |> Slugy.slugify([:title])
    |> validate_required([:title, :excerpt, :featured_image, :content, :published, :author_id])
    |> assoc_constraint(:author_id)
  end
end
