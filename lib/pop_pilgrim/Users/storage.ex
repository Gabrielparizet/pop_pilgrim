defmodule PopPilgrim.Users.Storage do
  @moduledoc """
  The module for DB access for Users context
  """

  alias PopPilgrim.Users
  alias PopPilgrim.Users.Storage.User
  alias PopPilgrim.Repo

  import Ecto.Query

  def create_user(attrs \\ %{}) do
    %User{}
    # |> Map.update(:birthday, nil, &convert_date/1)
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  def get_all_users do
    from(
      u in User,
      select: u
    )
    |> Repo.all()
    |> Enum.map(&to_context_struct/1)
  end

  def get_user(id) do
    Repo.get(User, id)
    |> to_context_struct()
  end

  def get_user!(id) do
    Repo.get!(User, id)
    |> to_context_struct()
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
    |> to_context_struct()
  end

  def get_user_id(params) do
    user = get_user_by(params)
    Map.get(user, :id, user.id)
  end

  def get_user_by_username(username) do
    User
    |> where(username: ^username)
    |> Repo.one()
    |> to_context_struct()
  end

  def get_user_by_email(email) do
    User
    |> where(email: ^email)
    |> Repo.one()
    |> to_context_struct()
  end

  defp to_context_struct(%User{} = index_db) do
    struct(Users.User, Map.from_struct(index_db))
  end

  defp to_context_struct(nil), do: nil

end
