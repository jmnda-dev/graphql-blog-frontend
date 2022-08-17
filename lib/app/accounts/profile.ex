defmodule App.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :about, :string
    field :description, :string
    field :github, :string
    field :linkedin, :string
    field :photo, :string
    field :twitter, :string
    belongs_to :user, App.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:photo, :about, :description, :github, :twitter, :linkedin])
    |> validate_required([:photo, :about, :description, :github, :twitter, :linkedin])
  end
end
