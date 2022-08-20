defmodule AppWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(AppWeb.Schema.BlogTypes)
  import_types(AppWeb.Schema.TagTypes)
  import_types(AppWeb.Schema.AccountTypes)

  alias AppWeb.Resolvers
  alias App.{Accounts, Blog}

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.Blog.list_posts/3)
    end

    @desc "Get a post by slug"
    field :post, :post do
      arg(:slug, non_null(:string))
      resolve(&Resolvers.Blog.get_post_by_slug/3)
    end

    @desc "Get all tags"
    field :tags, list_of(:tag) do
      resolve(&Resolvers.Blog.list_tags/3)
    end

    @desc "Get a tag by slug"
    field :tag, :tag do
      arg(:name, non_null(:string))
      resolve(&Resolvers.Blog.get_tag_by_name/3)
    end

    @desc "Get the Profile for the Blog owner"
    field :author_profile, :user do
      # middleware(Authenticate)
      resolve(&Resolvers.Accounts.get_author_profile/3)
    end
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Blog, Blog.datasource())
      |> Dataloader.add_source(Accounts, Accounts.datasource())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
