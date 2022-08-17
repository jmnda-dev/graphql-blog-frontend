defmodule App.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :photo, :string
      add :about, :string
      add :description, :text
      add :github, :string
      add :twitter, :string
      add :linkedin, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:profiles, [:user_id])
  end
end
