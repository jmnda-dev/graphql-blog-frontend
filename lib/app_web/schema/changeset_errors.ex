defmodule AppWeb.Schema.ChangesetErrors do
  @doc """
  Traverse the changeset errors and returns a map of field names wiith error messages.
  """

  def error_details(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
