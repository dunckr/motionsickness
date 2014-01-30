describe "Application 'motionsickness'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "should have nil" do
    @app.nil?.should == false
  end

  it "has one window" do
    @app.windows.size.should == 1
  end

end
