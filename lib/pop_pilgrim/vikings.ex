defmodule PopPilgrim.Vikings do
  @moduledoc """
  The Context for the Vikings' Road
  """

  alias PopPilgrim.Roads.Storage

  defmodule Viking do
    @moduledoc """
    The Viking module describes the struct of a point of interest of the Vikings' Road
    """

    @derive Jason.Encoder

    defstruct [
      :id,
      :name,
      :region,
      :city,
      :road,
      :historical_period,
      :geographical_zone,
      :archeological_historical_site,
      :religious_site,
      :touristic_site,
      :museum,
      :university,
      :hike,
      :national_parc,
      :battle_site,
      :reconstitution,
      :activities,
      :events,
      :travel_agency,
      :administrative_entity,
      :association,
      :shops,
      :dva_members,
      :website,
      :lattitude,
      :longitude
    ]

    @type t :: %__MODULE__{
            id: String.t(),
            name: String.t(),
            region: String.t(),
            city: String.t(),
            road: String.t(),
            historical_period: String.t(),
            geographical_zone: String.t(),
            archeological_historical_site: boolean(),
            religious_site: boolean(),
            touristic_site: boolean(),
            museum: boolean(),
            university: boolean(),
            hike: boolean(),
            national_parc: boolean(),
            battle_site: boolean(),
            reconstitution: boolean(),
            activities: boolean(),
            events: boolean(),
            travel_agency: boolean(),
            administrative_entity: boolean(),
            association: boolean(),
            shops: boolean(),
            dva_members: boolean(),
            website: boolean(),
            lattitude: float(),
            longitude: float()
          }
  end

  def get_all_points_of_interests do
    Storage.get_all_points_of_interests()
  end
end
