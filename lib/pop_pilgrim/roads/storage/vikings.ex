defmodule PopPilgrim.Roads.Storage.Vikings do
  @moduledoc """
  The schema for the locations of the Vikings' Road
  """

  use Ecto.Schema

  @primary_key false
  schema "vikings" do
    field(:id, :binary_id, primary_key: true)
    field(:name, :string)
    field(:region, :string)
    field(:city, :string)
    field(:road, :string)
    field(:historical_period, :string)
    field(:geographical_period, :string)
    field(:archeological_historical_site, :boolean)
    field(:religious_site, :boolean)
    field(:touristic_site, :boolean)
    field(:museum, :boolean)
    field(:university_research_institute, :boolean)
    field(:hike, :boolean)
    field(:national_parc, :boolean)
    field(:battle_site, :boolean)
    field(:reconstitution, :boolean)
    field(:activites, :boolean)
    field(:events, :boolean)
    field(:travel_agency, :boolean)
    field(:administrative_entity, :boolean)
    field(:association, :boolean)
    field(:shops, :boolean)
    field(:dva_members, :boolean)
    field(:website, :string)
    field(:lattitude, :float)
    field(:longitute, :float)

    timestamps()
  end

end
