defmodule PopPilgrimWeb.UsersController do
  use PopPilgrimWeb, :controller

  alias PopPilgrim.Users

  def index(conn, _params) do
    all_users = Users.get_all_users()
    json(conn, all_users)
  end

  def get_user_by_username(conn, %{"username" => username}) do
    IO.inspect(conn, label: "conn")
    user = Users.get_user_by_username(username)
    json(conn, user)
  end

  def get_user_by_email(conn, %{"email" => email}) do
    user = Users.get_user_by_email(email)
    json(conn, user)
  end

  def get_user_id(conn, %{"username" => username}) do
    id = Users.get_user_id(%{username: username})
    json(conn, id)
  end

  def get_user_id(conn, %{"email" => email}) do
    id = Users.get_user_id(%{email: email})
    json(conn, id)
  end
end
