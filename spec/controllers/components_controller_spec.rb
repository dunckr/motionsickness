describe "Controller: ComponentsController" do
  tests ComponentsController

  it "should have tests" do
    controller.instance_variable_get('@test').should == 'we are here'

  end
end
