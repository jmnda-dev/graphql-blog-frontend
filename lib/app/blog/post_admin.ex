defmodule App.Blog.PostAdmin do
  import Ecto.Query, warn: false
  alias AppWeb.Upload
  alias App.Repo
  alias App.Blog
  alias App.Blog.{Post, Tag}

  def custom_show_query(_conn, _schema, query) do
    from(r in query, preload: [:tags, :author])
  end

  def create_changeset(schema, attrs) do
    ids = attrs["post_tags"] || []
    tags = Enum.map(ids, &Repo.get(Tag, &1))

    Repo.preload(schema, [:tags])
    |> Post.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:tags, tags)
  end

  def update_changeset(schema, attrs) do
    ids = attrs["post_tags"] || []
    tags = Enum.map(ids, &Repo.get(Tag, &1))

    Post.changeset(schema, attrs)
    |> Ecto.Changeset.put_change(:tags, tags)
  end

  def index(_schema) do
    [
      title: nil,
      excerpt: nil,
      published: nil,
      updated_at: nil
    ]
  end

  def before_insert(conn, changeset) do
    current_user = conn.assigns[:current_user]

    img_path = save_upload(conn, changeset, "post", "featured_image_upload")

    {
      :ok,
      changeset
      |> Ecto.Changeset.put_assoc(:author, current_user)
      |> Ecto.Changeset.put_change(:featured_image, img_path)
    }
  end

  def before_update(conn, changeset) do
    img_path = save_upload(conn, changeset, "post", "featured_image_upload")

    {
      :ok,
      changeset
      |> Ecto.Changeset.put_change(:featured_image, img_path)
    }
  end

  def form_fields(_schema) do
    [
      slug: %{create: :readonly, update: :readonly},
      title: %{type: nil},
      excerpt: nil,
      content: %{type: :richtext},
      featured_image: nil,
      featured_image_upload: %{type: :file},
      published: %{type: :boolean},
      post_tags: %{choices: get_tag_choices(), field: :tags, value: :id}
    ]
  end

  defp get_tag_choices() do
    tags = Blog.list_tags()
    Enum.reduce(tags, [], fn tag, acc -> Keyword.put(acc, String.to_atom(tag.name), tag.id) end)
  end

  defp save_upload(conn, changeset, schema_name, field) do
    case Upload.handle_upload(conn, schema_name, field) do
      nil ->
        changeset.data.featured_image

      img_path ->
        img_path
    end
  end
end
