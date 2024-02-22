defmodule PopPilgrimWeb.UsersController do
  use PopPilgrimWeb, :controller

  alias PopPilgrim.Users

  def index(conn, _params) do
    all_users = Users.get_all_users()
    json(conn, all_users)
  end
end
