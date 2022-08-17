defmodule App.Blog.ManySelectField do
  use Ecto.Type

  def type, do: :array

  def cast(text) when is_binary(text) do
    {:ok, text}
  end

  def cast(_), do: :error

  def load(data), do: {:ok, data}

  def dump(text) when is_binary(text), do: {:ok, text}
  def dump(_), do: :error

  def render_form(_conn, changeset, form, field, opts) do
    related_field = Map.get(opts, :field)
    choices = Map.get(opts, :choices)
    choice_value = Map.get(opts, :value)

    relation_data =
      changeset.data
      |> Map.get(related_field)

    selected =
      relation_data
      |> create_choices(choice_value)

    [
      {:safe, ~s(<div>)},
      Phoenix.HTML.Form.multiple_select(
        form,
        field,
        choices,
        selected: selected,
        class: "custom-select"
      ),
      {:safe, ~s(</div>)}
    ]
  end

  def render_index(_conn, resource, field, _opts) do
    case Map.get(resource, field) do
      nil ->
        ""

      text ->
        text
    end
  end

  defp create_choices(data, choice_value) do
    Enum.map(data, &Map.get(&1, choice_value))
  end
end
