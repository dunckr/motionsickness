describe "Model: Point" do
  before do
    @point = Point.new 'Test', 50.85, 4.35, 'Description'
  end

  it "should have name" do
    @point.name.should == 'Test'
  end

  it "should have coordinate" do
    @point.coordinate.should == CLLocationCoordinate2D.new(50.85, 4.35)
  end

  it "should have info" do
    @point.info.should == 'Description'
  end

end
