defmodule AppWeb.Upload do
  alias AppWeb.Router.Helpers, as: Routes

  def handle_upload(%{params: params} = conn, schema_name, field) do
    upload =
      Map.get(params, schema_name)
      |> Map.get(field)

    case upload do
      nil ->
        nil

      %Plug.Upload{path: temp_path, content_type: content_type} ->
        new_filename = "#{generate_unique_filename()}.#{get_file_extension(content_type)}"
        dest = Path.join("priv/static/images", new_filename)
        File.cp(temp_path, dest)

        Routes.static_path(conn, "/images/#{new_filename}")
    end
  end

  defp generate_unique_filename() do
    Ecto.UUID.generate()
  end

  def get_file_extension(content_type) do
    [ext | _] = MIME.extensions(content_type)
    ext
  end
end
