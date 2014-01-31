class TabTwoView < UIView

  def initWithFrame(frame)
    if super
      @button = UIButton.buttonWithType UIButtonTypeRoundedRect
      @button.setTitle 'Mail', forState: UIControlStateNormal
      @button.frame = [[100,100], [100,50]]
      # @button.addTarget self, action: :click, forControlEvents: UIControlEventTouchUpInside
      @button.when UIControlEventTouchUpInside do
        self.click()
      end
      addSubview @button


      @button2 = UIButton.buttonWithType UIButtonTypeRoundedRect
      @button2.setTitle 'Deferred', forState: UIControlStateNormal
      @button2.frame = [[100,200], [100,50]]
      @button.when UIControlEventTouchUpInside do
        self.deferred()
      end
      addSubview @button2

    end
    self
  end

  def click
    p 'clicked...'
    # BW::Mail.compose {
    #   delegate: self,
    #   to: ['test@test.com']
    # } do | result, error |
    #   p error
    #   p result
    # end
  end


  def deferred
    d = EM::DefaultDeferrable.new

    d.callback { |what| p "Great #{what}!" }

    d.succeed 'justice'
  end
end
