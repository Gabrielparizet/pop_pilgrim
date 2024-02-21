defmodule PopPilgrim.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false, prefix: "public") do
      add(:id, :uuid, primary_key: true, default: fragment("gen_random_uuid()"))
      add(:username, :string)
      add(:hashed_password, :string)
      add(:email, :string)
      add(:first_name, :string)
      add(:last_name, :string)
      add(:birthday, :utc_datetime)
      add(:country_code, :string)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:users, [:id, :username, :email])
  end
end
