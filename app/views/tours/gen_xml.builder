xml.instruct!
xml.tourlist do
  xml.tours do
    for tour in @tours
      xml.id(tour.id)
      xml.name(tour.name)
      xml.size(tour.size) 
      xml.desc(tour.desc) 
      xml.url(tour.zipurl) 
    end
  end
end
  
