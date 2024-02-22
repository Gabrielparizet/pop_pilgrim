defmodule PopPilgrim.Users.Storage.User do
  @moduledoc """
  The schema for a User
  """

  use Ecto.Schema
  import Argon2
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
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must be a valid email format")
    |> unique_constraint([:username, :email])
  end

  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, [:hashed_password])
    |> validate_required([:hashed_password])
    |> validate_length(:hashed_password, min: 8, max: 25)
    |> validate_format(:hashed_password, ~r/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9])/,
      message:
        "must contain at least one uppercase letter, one lowercase letter, one number, and one special symbol"
    )
    |> put_pass_hash()
    |> modify_birthday(params)
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{hashed_password: password}} ->
        put_change(changeset, :hashed_password, hash_pwd_salt(password))

      _ ->
        changeset
    end
  end

  defp modify_birthday(changeset, params) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        birthday =
          if Map.has_key?(params, :birthday) do
            convert_date(params[:birthday])
          else
            nil
          end

        put_change(changeset, :birthday, birthday)

      _ -> changeset
    end
  end

  defp convert_date(date) do
    values = String.split(date, "/")
    [month, day, year] = Enum.map(values, &String.to_integer/1)
    naive_date_time = NaiveDateTime.new!(year, month, day, 0, 0, 0)
    DateTime.from_naive!(naive_date_time, "Etc/UTC")
  end
end
