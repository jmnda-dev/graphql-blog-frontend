defmodule AppWeb.Schema.ChangesetErrors do
  @spec error_details(Ecto.Changeset.t()) :: %{optional(atom) => list}
  @doc """
  Traverse the changeset errors and returns a map of field names wiith error messages.
  """

  def error_details(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(inspect(value)))
      end)
    end)
  end
end
