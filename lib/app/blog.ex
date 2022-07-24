defmodule App.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias App.Repo

  alias App.Blog.{Post, Post.Query}

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    query = Query.published_posts()
    Repo.all(query)
  end

  @doc """
  Gets a single post by its slug.

  Returns `nil` if the Post does not exist.

  ## Examples

      iex> get_post("my-post")
      %Post{}

      iex> get_post("post-does-not-exist")
      nil

  """
  def get_post(slug) do
    query = Query.published_posts()
    Repo.get_by(query, slug: slug)
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  def datasource do
    Dataloader.Ecto.new(App.Repo, query: &query/2)
  end

  def query(Post, _args) do
    Post
    |> where(published: true)
  end

  def query(queryable, _) do
    queryable
  end
end
