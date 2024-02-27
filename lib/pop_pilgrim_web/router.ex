defmodule PopPilgrimWeb.Router do
  use PopPilgrimWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PopPilgrimWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PopPilgrimWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PopPilgrimWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/users", UsersController, :index
    get "/users/username/:username", UsersController, :get_user_by_username
    get "/users/email/:email", UsersController, :get_user_by_email
    get "/users/id/username/:username", UsersController, :get_user_id
    get "/users/id/email/:email", UsersController, :get_user_id
  end

  # Other scopes may use custom stacks.
  # scope "/api", PopPilgrimWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:pop_pilgrim, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PopPilgrimWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
