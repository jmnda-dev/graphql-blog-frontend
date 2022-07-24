defmodule App.Blog.CommentAdmin do
  import Ecto.Query, warn: false

  def before_insert(conn, changeset) do
    {:ok,
     changeset
     |> Ecto.Changeset.put_assoc(:user, conn.assigns.current_user)}
  end

  def form_fields(_) do
    [
      comment: %{type: :textarea, rows: 5},
      post_id: nil,
      user_id: nil
    ]
  end
end
