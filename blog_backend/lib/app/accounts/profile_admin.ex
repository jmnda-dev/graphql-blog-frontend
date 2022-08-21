defmodule App.Accounts.ProfileAdmin do
  import Ecto.Query
  import AppWeb.Upload

  def form_fields(_) do
    [
      avatar: %{create: :readonly, update: :readonly},
      avatar_upload: %{type: :file},
      about: nil,
      description: nil,
      occupation: nil,
      company: nil,
      github: nil,
      linkedin: nil,
      twitter: nil
    ]
  end

  def custom_show_query(_conn, _schema, query) do
    from(p in query, preload: [:user])
  end

  def before_insert(conn, changeset) do
    current_user = conn.assigns[:current_user]

    img_path =
      case handle_upload(conn, "profile", "avatar_upload") do
        nil ->
          changeset.data.avatar

        img_path ->
          img_path
      end

    {
      :ok,
      changeset
      |> Ecto.Changeset.put_assoc(:user, current_user)
      |> Ecto.Changeset.put_change(:avatar, img_path)
    }
  end

  def before_update(conn, changeset) do
    current_user = conn.assigns[:current_user]

    img_path =
      case handle_upload(conn, "profile", "avatar_upload") do
        nil ->
          changeset.data.avatar

        img_path ->
          img_path
      end

    {
      :ok,
      changeset
      |> Ecto.Changeset.put_assoc(:user, current_user)
      |> Ecto.Changeset.put_change(:avatar, img_path)
    }
  end
end
