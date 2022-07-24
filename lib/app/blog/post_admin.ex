defmodule App.Blog.PostAdmin do
  import Ecto.Query, warn: false

  def before_insert(conn, changeset) do
    {:ok,
     changeset
     |> Ecto.Changeset.put_assoc(:user, conn.assigns.current_user)}
  end

  def form_fields(_) do
    [
      slug: %{create: :readonly, update: :readonly},
      title: %{type: nil},
      excerpt: nil,
      content: %{type: :richtext},
      featured_image: nil,
      published: %{type: :boolean}
    ]
  end
end
