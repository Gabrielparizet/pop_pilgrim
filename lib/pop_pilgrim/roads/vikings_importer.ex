defmodule PopPilgrim.Roads.VikingsImporter do

  def run do
    file = File.read!("/Users/gabrielparizet/workspace/pop_pilgrim/priv/roads/vikings.csv")
    |> String.split(["\n", "\r"])

    point_of_interests =
      file
      |> Enum.map(&String.split(&1, ","))
      |> make_map()
  end

  def make_map(
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
  ) do
    %{
      name: name,
      country: country,
      region: region,
      city: city,
      road: road,
      historical_period: historical_period,
      geographical_zone: geographical_zone,
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
    }
  end


  # ["Name", "Country", "Region", "City", "Road", "Historical Period",
   "Geographical zone", "Archeological/ Historical Site", "Religious Site",
   "Touristic Site", "Museum", "Univeristy/ Research Institute", "Hike",
   "National parc", "Battle site", "Reconstitution", "Activities", "Events",
   "Travel agency", "Administrative entity", "Association", "Shops",
   "DVA Members", "Website", "Lattitude", "Longitude"]
end
