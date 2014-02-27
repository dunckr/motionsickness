class Point

  def initialize(name,lat,long,info)
    @name = name
    @coordinate = CLLocationCoordinate2D.new
    @coordinate.latitude = lat
    @coordinate.longitude = long
    @info = info
  end

  def name; @name; end
  def coordinate; @coordinate; end
  def info; @info; end

  All = [
    Point.new('We', 50.016667, 4.316667, 'Chimay'),
    Point.new('have',49.639722, 5.348889, 'Orval'),
    Point.new('alot',50.178162, 5.219879, 'Rochefort'),
    Point.new('to',51.284720, 4.656670, 'Westmalle'),
    Point.new('try',50.895942, 2.721262, 'Westvleteren'),
    Point.new('out',51.298800, 5.488570, 'Achel')
  ]
end
