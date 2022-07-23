defmodule AppWeb.Resolvers.Blog do
  alias App.Blog

  def list_posts(_parent, _args, _resolution) do
    {:ok, Blog.list_posts()}
  end

  def list_comments(_parent, _args, _resolution) do
    {:ok, Blog.list_comments()}
  end
end
