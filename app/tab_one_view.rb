class TabOneView < UIView

  def initWithFrame(frame)
    if super
      addButton()
      addLabel()
      addIndicator()
      addTextView()
      addSlider()
    end
    self
  end

  def addButton
    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.setTitle 'HELLO', forState: UIControlStateNormal
    @button.frame = [[100,400], [100,50]]
    @button.addTarget self, action: :click, forControlEvents: UIControlEventTouchUpInside
    addSubview @button
  end

  def addLabel
    @label = UILabel.alloc.init
    @label.frame = [[100,200], [100,50]]
    @label.text = 'THIS IS A LABEL'
    @label.textColor = UIColor.greenColor
    @label.numberOfLines = 1
    @label.adjustsFontSizeToFitWidth = true
    addSubview @label
  end

  def addIndicator
    @indicator = UIActivityIndicatorView.alloc.initWithFrame [[100,300], [100,50]]
    addSubview @indicator
    @indicator.startAnimating
    p "is indicator animating? #{@indicator.isAnimating}"
    App.run_after(3) { @indicator.stopAnimating }
  end

  def addTextView
    @textView = UITextView.alloc.initWithFrame [[100,100], [100,50]]
    @textView.allowsEditingTextAttributes = true
    @textView.text = 'edit me...'
    addSubview @textView
  end

  def addSlider
    @slider = UISlider.alloc.initWithFrame [[100,450], [100,50]]
    @slider.continuous = true
    @slider.addTarget self, action: 'sliderChanged:', forControlEvents: UIControlEventValueChanged
    addSubview @slider
  end

  def sliderChanged(sender)
    p "slider changed to: #{sender.value}"
  end

  def click
    p 'we be clicking'
    App.alert 'click!!'
  end

# ProgressView
# UIStepper
# UISegmentControl
# UITextView
# UITextField
# UISwitch
# UISearchbar
# UIPageControl
# UICollectionView
# UIImageView
# UIWebView
# UIToolbar
# UIBarButtonItem (for UIToolbar or UINavigationItem)
# MKMapView

end

