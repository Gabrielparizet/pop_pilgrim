defmodule PopPilgrimWeb.UsersController do
  use PopPilgrimWeb, :controller

  alias PopPilgrim.Users

  def index(conn, _params) do
    all_users = Users.get_all_users()
    json(conn, all_users)
  end

  def get_by_username(conn, %{"username" => username}) do
    user = Users.get_user_by_username(username)
    json(conn, user)
  end
end
