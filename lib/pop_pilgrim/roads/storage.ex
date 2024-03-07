defmodule PopPilgrim.Roads.Storage do
  @moduledoc """
  Database access for Roads Storage
  """

  import Ecto.Query

  alias PopPilgrim.Repo
  alias PopPilgrim.Roads.Storage.Viking
  alias PopPilgrim.Vikings

  def insert_points_of_interests(point_of_interest) do
    data =
      %Viking{
        name: point_of_interest.name,
        region: point_of_interest.region,
        city: point_of_interest.city,
        road: point_of_interest.road,
        historical_period: point_of_interest.historical_period,
        geographical_zone: point_of_interest.geographical_zone,
        archeological_historical_site: point_of_interest.archeological_historical_site,
        religious_site: point_of_interest.religious_site,
        touristic_site: point_of_interest.touristic_site,
        museum: point_of_interest.museum,
        university_research_institute: point_of_interest.university_research_institute,
        hike: point_of_interest.hike,
        national_parc: point_of_interest.national_parc,
        battle_site: point_of_interest.battle_site,
        reconstitution: point_of_interest.reconstitution,
        activites: point_of_interest.activities,
        events: point_of_interest.events,
        travel_agency: point_of_interest.travel_agency,
        administrative_entity: point_of_interest.administrative_entity,
        association: point_of_interest.association,
        shops: point_of_interest.shops,
        dva_members: point_of_interest.dva_members,
        website: point_of_interest.website,
        lattitude: point_of_interest.lattitude,
        longitute: point_of_interest.longitude
      }

    Repo.insert(data)
  end

  def get_all_points_of_interests do
    from(
      v in Viking,
      select: v
    )
    |> Repo.all()
    |> IO.inspect(label: "data")
    |> Enum.map(&to_context_struct/1)
  end

  def get_lattitude do
    from(
      v in Viking,
      select: v.lattitude
    )
    |> Repo.all()
  end

  defp to_context_struct(%Viking{} = index_db) do
    struct(Vikings.Viking, Map.from_struct(index_db))
  end

  defp to_context_struct(nil), do: nil
end
