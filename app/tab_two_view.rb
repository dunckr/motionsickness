class TabTwoView < UIView

  def initWithFrame(frame)
    if super
      @button = UIButton.buttonWithType UIButtonTypeRoundedRect
      @button.setTitle 'Mail', forState: UIControlStateNormal
      @button.frame = [[100,100], [100,50]]
      @button.addTarget self, action: 'click', forControlEvents: UIControlEventTouchUpInside
      # @button.when UIControlEventTouchUpInside do
      #   self.click()
      # end
      addSubview @button


      @button2 = UIButton.buttonWithType UIButtonTypeRoundedRect
      @button2.setTitle 'Compose', forState: UIControlStateNormal
      @button2.frame = [[100,200], [100,50]]
      @button2.addTarget self, action: 'compose', forControlEvents: UIControlEventTouchUpInside

      # @button.when UIControlEventTouchUpInside do
      #   self.compose()
      # end
      addSubview @button2

    end
    self
  end

  def click
    p 'clicked...'
    @button.animateWithDuration(2,
      animations: lambda {
        @button.frame = [[100,400], [100,50]]
      },
      completion: lambda {
      }
    )
  end

  def compose
    p 'in the mail'
    BW::SMS.compose (
      {
        message: 'hrre'
      }) {|result, error|
      p 'sent...'
    }
  end
end
