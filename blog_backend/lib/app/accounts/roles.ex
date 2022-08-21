defmodule App.Accounts.Roles do
  def has_role?(nil, _), do: false

  def has_role?(user_roles, roles) do
    Enum.all?(user_roles || [], &(&1 in roles))
  end
end
