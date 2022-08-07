defmodule App.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :slug, :string
      add :title, :string, null: false
      add :excerpt, :string, null: false
      add :featured_image, :string, null: false
      add :content, :text, null: false
      add :published, :boolean, default: false, null: false
      add :tags, {:array, :string}
      add :author_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:posts, [:author_id])
  end
end
