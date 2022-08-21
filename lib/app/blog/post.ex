defmodule App.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :excerpt, :string
    field :featured_image, :string
    field :featured_image_upload, :any, virtual: true
    field :published, :boolean, default: false
    field :slug, :string
    field :title, :string
    field :post_tags, App.Blog.ManySelectField, virtual: true
    belongs_to :author, App.Accounts.User
    many_to_many :tags, App.Blog.Tag, join_through: "posts_tags", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [
      :slug,
      :title,
      :excerpt,
      :featured_image,
      :content,
      :published,
      :author_id,
      :featured_image_upload
    ])
    |> Slugy.slugify([:title])
    |> validate_required([:title, :excerpt, :featured_image, :content, :published])
  end
end
