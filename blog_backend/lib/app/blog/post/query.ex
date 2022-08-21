defmodule App.Blog.Post.Query do
  import Ecto.Query

  alias App.Blog.Post

  def base, do: Post

  def published_posts(query \\ base()) do
    from p in query, where: p.published == true
  end
end
