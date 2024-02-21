defmodule PopPilgrim.Users.Storage do

  alias PopPilgrim.Users
  alias PopPilgrim.Users.Storage.User
  alias PopPilgrim.Repo

  import Ecto.Query

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  def get_all_users do
    query =
      from(
        u in User,
        select: u
      )

    query
    |> Repo.all()
    |> to_context_struct()
  end

  def get_user_by_username(username) do
    query =
      from(
        u in User,
        where: u.username == ^username,
        select: u
      )

    query
    |> Repo.one()
    |> to_context_struct()
  end

  defp to_context_struct(%User{} = index_db) do
    struct(Users.User, Map.from_struct(index_db))
  end

  def convert_date(date) do
    values = String.split(date, "/")
    [month, day, year] = Enum.map(values, &String.to_integer/1)
    Date.new!(year, month, day)
  end

end
