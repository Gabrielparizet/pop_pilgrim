defmodule PopPilgrim.Storage.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "users" do
    field(:id, :binary_id)
    field(:username, :string)
    field(:hashed_password, :string)
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:birthday, :utc_datetime)
    field(:country_code, :string)

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :first_name, :last_name, :country_code])
    |> validate_required([:username, :email, :first_name, :last_name, :country_code])
    |> validate_length(:username, min: 1, max: 20)
    |> validate_length(:email, max: 160)
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> unique_constraint([:username, :email])
  end

end
