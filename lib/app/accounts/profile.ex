defmodule App.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :about, :string
    field :description, :string
    field :occupation, :string
    field :company, :string
    field :github, :string
    field :linkedin, :string
    field :avatar, :string
    field :twitter, :string
    belongs_to :user, App.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:avatar, :about, :occupation, :company, :description, :github, :twitter, :linkedin])
    |> validate_required([:avatar, :about, :occupation, :company])
  end
end
