defmodule PopPilgrim.User do

  alias PopPilgrim.Storage.User
  alias PopPilgrim.Repo

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

end
