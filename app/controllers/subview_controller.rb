class SubviewController < UIViewController

  def loadView
    self.view = MKMapView.alloc.init
  end

  def viewDidLoad
    region = MKCoordinateRegionMake(CLLocationCoordinate2D.new(50.85, 4.35), MKCoordinateSpanMake(3.1, 3.1))
    self.view.setRegion region
  end

  def setPoint(point)
    @name = point.name
    @coordinate = point.coordinate
    @info = point.info
    self.view.addAnnotation point
  end

end
