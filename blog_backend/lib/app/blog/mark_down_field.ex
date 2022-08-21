defmodule App.Blog.MarkDownField do
  use Ecto.Type

  def type, do: :string

  def cast(text) when is_binary(text) do
    {:ok, text}
  end

  def cast(_), do: :error

  def load(data), do: {:ok, data}

  def dump(text) when is_binary(text), do: {:ok, text}
  def dump(_), do: :error

  def render_form(_conn, _changeset, form, field, _opts) do
    [
      {:safe, ~s(<div>)},
      Phoenix.HTML.Form.textarea(
        form,
        field,
        data_simplemde: true
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
end
