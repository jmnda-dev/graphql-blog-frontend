defmodule AppWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(AppWeb.Schema.BlogTypes)
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

    @desc "Get a user"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.find_user/3)
    end

    field :comments, list_of(:comment) do
      resolve(&Resolvers.Blog.list_comments/3)
    end
  end

  mutation do
    @desc "Creates a comment for a post"
    field :create_comment, :comment do
      arg(:post_id, non_null(:id))
      arg(:comment, non_null(:string))
      resolve(&Resolvers.Blog.create_post_comment/3)
    end

    @desc "Update a post comment"
    field :update_comment, :comment do
      arg(:id, non_null(:id))
      arg(:post_id, non_null(:id))
      arg(:comment, non_null(:string))
      resolve(&Resolvers.Blog.update_post_comment/3)
    end

    @desc "Delete a post comment"
    field :delete_comment, :comment do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Blog.delete_post_comment/3)
    end

    @desc "Create a user account"
    field :signup, :session do
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:username, :string)
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Accounts.signup/3)
    end
  end

  def context(ctx) do
    current_user = Accounts.get_user(2)
    ctx = Map.put(ctx, :current_user, current_user)

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
