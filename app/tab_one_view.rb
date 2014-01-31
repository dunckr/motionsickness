class TabOneView < UIView

  def initWithFrame(frame)
    if super
      p 'we are in the tab one view'

      @button = UIButton.buttonWithType UIButtonTypeRoundedRect
      @button.setTitle 'HELLO', forState: UIControlStateNormal
      @button.frame = [[100,100], [100,50]]
      @button.addTarget self, action: :click, forControlEvents: UIControlEventTouchUpInside

      addSubview @button
    end
    self
  end

  def click
    p 'we be clicking'
    App.alert 'click!!'
  end
end
