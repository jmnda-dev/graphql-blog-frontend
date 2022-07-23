defmodule AppWeb.Resolvers.Blog do
  alias App.Blog
  alias AppWeb.Schema.ChangesetErrors

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

  def create_post_comment(
        _parent,
        args,
        %{context: %{current_user: user}}
      ) do
    case Blog.create_comment(user, args) do
      {:error, changeset} ->
        {:error,
         message: "Could not create comment", details: ChangesetErrors.error_details(changeset)}

      {:ok, comment} ->
        {:ok, comment}
    end
  end
end
