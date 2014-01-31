class TapController < UIViewController

  def viewDidLoad
    super

    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.setTitle('Test me title', forState:UIControlStateNormal)
    @button.accessibilityLabel = 'Test me!'
    @button.sizeToFit
    self.view.addSubview(@button)

    # @button.addTarget(self, action:'tapped', forControlEvents:UIControlEventTouchUpInside)    # 
    @button.when(UIControlEventTouchUpInside) do
      self.tapped()
    end
  end

  def tapped
    p "I'm tapped"
    @was_tapped = true
    App.alert 'Quit tapping me!'
  end

end
