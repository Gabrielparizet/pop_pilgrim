defmodule PopPilgrim.Repo.Migrations.CreateVikingRoadsTable do
  use Ecto.Migration

  def change do
    create table(:vikings, primary_key: false, prefix: "public") do
      add(:id, :uuid, primary_key: true, default: fragment("gen_random_uuid()"))
      add(:name, :string)
      add(:region, :string)
      add(:city, :string)
      add(:road, :string)
      add(:historical_period, :string)
      add(:geographical_period, :string)
      add(:archeological_historical_site, :boolean)
      add(:religious_site, :boolean)
      add(:touristic_site, :boolean)
      add(:museum, :boolean)
      add(:university_research_institute, :boolean)
      add(:hike, :boolean)
      add(:national_parc, :boolean)
      add(:battle_site, :boolean)
      add(:reconstitution, :boolean)
      add(:activites, :boolean)
      add(:events, :boolean)
      add(:travel_agency, :boolean)
      add(:administrative_entity, :boolean)
      add(:association, :boolean)
      add(:shops, :boolean)
      add(:dva_members, :boolean)
      add(:website, :string)
      add(:lattitude, :numeric)
      add(:longitute, :numeric)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:vikings, :id)
  end
end
