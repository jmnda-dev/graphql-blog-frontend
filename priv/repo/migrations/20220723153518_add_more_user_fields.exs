defmodule App.Repo.Migrations.AddMoreUserFields do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :username, :string
      add :roles, {:array, :string}, default: []
    end

    create unique_index(:users, [:username])
  end
end
