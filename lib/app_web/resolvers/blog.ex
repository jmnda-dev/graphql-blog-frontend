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

  def update_post_comment(
        _parent,
        %{id: id} = args,
        %{context: %{current_user: user}}
      ) do
    case Blog.get_comment(id) do
      nil ->
        {:error, "Post with id '#{id}' not found"}

      comment ->
        if allow_mutation?(comment.user_id, user.id) do
          case Blog.update_comment(comment, args) do
            {:error, changeset} ->
              {:error,
               message: "Could not update comment",
               details: ChangesetErrors.error_details(changeset)}

            {:ok, comment} ->
              {:ok, comment}
          end
        else
          {:error, "You are not allowed to update this comment"}
        end
    end
  end

  defp allow_mutation?(comment_user_id, user_id) do
    if comment_user_id == user_id do
      true
    else
      false
    end
  end
end
