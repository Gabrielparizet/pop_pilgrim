defmodule PopPilgrim.Roads.VikingsImporter do
@moduledoc """
Module for importing the Vikings' Road point_of_interests in 'public.vikings' table
"""

  alias PopPilgrim.Roads.Storage

  def run do
    case File.read("/Users/gabrielparizet/workspace/pop_pilgrim/priv/roads/vikings.csv") do
      {:ok, file} ->
        file
        |> String.split(~r/\r?\n/)
        |> List.delete_at(0)
        |> Enum.map(&String.trim(&1))
        |> Enum.map(&String.split(&1, ","))
        |> Enum.map(&make_map/1)
        |> Enum.map(&Storage.insert_points_of_interests/1)

      {:error, _reason} ->
        IO.puts("Error reading file")
    end
  end

  def make_map([
    name,
    country,
    region,
    city,
    road,
    historical_period,
    geographical_zone,
    archeological_historical_site,
    religious_site,
    touristic_site,
    museum,
    university_research_institute,
    hike,
    national_parc,
    battle_site,
    reconstitution,
    activities,
    events,
    travel_agency,
    administrative_entity,
    association,
    shops,
    dva_members,
    website,
    lattitude,
    longitude
  ]) do
    %{
      name: name,
      country: country,
      region: region,
      city: city,
      road: road,
      historical_period: historical_period,
      geographical_zone: geographical_zone,
      archeological_historical_site: string_to_bool(archeological_historical_site),
      religious_site: string_to_bool(religious_site),
      touristic_site: string_to_bool(touristic_site),
      museum: string_to_bool(museum),
      university_research_institute: string_to_bool(university_research_institute),
      hike: string_to_bool(hike),
      national_parc: string_to_bool(national_parc),
      battle_site: string_to_bool(battle_site),
      reconstitution: string_to_bool(reconstitution),
      activities: string_to_bool(activities),
      events: string_to_bool(events),
      travel_agency: string_to_bool(travel_agency),
      administrative_entity: string_to_bool(administrative_entity),
      association: string_to_bool(association),
      shops: string_to_bool(shops),
      dva_members: string_to_bool(dva_members),
      website: website,
      lattitude: String.to_float(lattitude),
      longitude: String.to_float(longitude)
    }
  end

  def string_to_bool("true"), do: true
  def string_to_bool(""), do: false
end
