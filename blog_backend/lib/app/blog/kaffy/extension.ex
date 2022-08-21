defmodule App.Blog.Kaffy.Extension do
  def stylesheets(_conn) do
    # [
    #   {:safe,
    #    ~s("<link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">"})}
    # ]
  end

  def javascripts(_conn) do
    # [
    #   {:safe,
    #    ~s(<script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>)},
    #   {:safe, "<script>new SimpleMDE();</script>"}
    # ]
  end
end
