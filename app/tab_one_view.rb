class TabOneView < UIView

  def initWithFrame(frame)
    if super
      addButton()
      addLabel()
      addIndicator()
    end
    self
  end

  def addButton
    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.setTitle 'HELLO', forState: UIControlStateNormal
    @button.frame = [[100,100], [100,50]]
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

  def click
    p 'we be clicking'
    App.alert 'click!!'
  end

# UIActivityIndicatorView
# ProgressView
# UIStepper
# UISegmentControl
# UITextView
# UITextField
# UISlider
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

