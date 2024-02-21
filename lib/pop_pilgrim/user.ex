defmodule PopPilgrim.User do

  alias PopPilgrim.Storage.User
  alias PopPilgrim.Repo

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

end
