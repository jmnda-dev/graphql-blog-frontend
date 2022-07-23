defmodule AppWeb.Middleware.Authenticate do
  @behaviour Absinthe.Middleware

  def call(resolution, _) do
    case resolution.context do
      %{current_user: _current_user} ->
        resolution

      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, "Please signin first"})
    end
  end
end
