defmodule PopPilgrim.Users do

  alias PopPilgrim.Users.Storage

  defmodule User do
    @moduledoc """
    User module defines the struct for a user
    """

    @derive Jason.Encoder

    defstruct [
      :id,
      :username,
      :hashed_password,
      :email,
      :first_name,
      :last_name,
      :birthday,
      :country_code
    ]

    @type t :: %__MODULE__{
            id: String.t(),
            username: String.t(),
            hashed_password: String.t(),
            email: String.t(),
            first_name: String.t(),
            last_name: String.t(),
            birthday: String.t(),
            country_code: String.t()
          }
  end
  def create_user(attrs \\ %{}) do
    Storage.create_user(attrs)
  end

  def get_all_users do
    Storage.get_all_users()
  end

  def get_user(id) do
    Storage.get_user(id)
  end

  def get_user!(id) do
    Storage.get_user!(id)
  end

  def get_user_by(params) do
    Storage.get_user_by(params)
  end

  def get_user_id(params) do
    Storage.get_user_id(params)
  end

  def get_user_by_username(username) do
    Storage.get_user_by_username(username)
  end

  def get_user_by_email(email) do
    Storage.get_user_by_email(email)
  end

end
