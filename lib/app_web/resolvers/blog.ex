defmodule AppWeb.Resolvers.Blog do
  alias App.Blog

  def list_posts(_parent, _args, _resolution) do
    {:ok, Blog.list_posts()}
  end

  def list_comments(_parent, _args, _resolution) do
    {:ok, Blog.list_comments()}
  end

  def get_post_by_slug(_parant, %{slug: slug}, _resolution) do
    case Blog.get_post(slug) do
      nil ->
        {:error, "Post with slug '#{slug}' not found"}

      post ->
        {:ok, post}
    end
  end
end
