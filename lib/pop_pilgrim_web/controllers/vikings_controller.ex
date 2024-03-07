defmodule PopPilgrimWeb.VikingsController do
  use PopPilgrimWeb, :controller

  alias PopPilgrim.Vikings

  def index(conn, _params) do
    point_of_interests = Vikings.get_all_points_of_interests()
    json(conn, point_of_interests)
  end
end
