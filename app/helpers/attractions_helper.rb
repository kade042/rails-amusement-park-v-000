module AttractionsHelper
  def set_attr(attraction)
    attraction ||= Attraction.new
  end
end
