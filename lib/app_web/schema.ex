defmodule AppWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(AppWeb.Schema.BlogTypes)
  import_types(AppWeb.Schema.AccountTypes)

  alias AppWeb.Resolvers
  alias App.{Accounts, Blog}
  alias AppWeb.Middleware.Authenticate

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

    @desc "Get a user"
    field :user, :user do
      arg(:id, non_null(:id))
      middleware(Authenticate)
      resolve(&Resolvers.Accounts.find_user/3)
    end

    @desc "Get the currently signed in user"
    field :me, :user do
      resolve(&Resolvers.Accounts.me/3)
    end
  end

  mutation do
    @desc "Create a user account"
    field :signup, :session do
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:username, :string)
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.Accounts.signup/3)
    end

    @desc "Signin a user"
    field :signin, :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Accounts.signin/3)
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
