class ComponentsView < UIView

  def initWithFrame(frame)
    if super
      addButton()
      addLabel()
      addIndicator()
      addTextView()
      addSlider()
      addStepper()
      addSegment()
      addTextField()
      addSwitch()
      addSearchBar()
      addPageControl()

      # addImageView()
    end
    self
  end

  def addButton
    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.setTitle 'HELLO', forState: UIControlStateNormal
    @button.frame = [[0,50], [100,50]]
    @button.addTarget self, action: :animate, forControlEvents: UIControlEventTouchUpInside
    addSubview @button
  end

  def animate
    UIView.animateWithDuration(2,
      animations: -> {
        @button.frame = [[100,100], [100,50]]
      }
    )
  end

  def addTextView
    @textView = UITextView.alloc.initWithFrame [[100,50], [100,50]]
    @textView.allowsEditingTextAttributes = true
    @textView.text = '
      app = UIApplication.sharedApplciation
      app.keyWindow.addSubview **
    '
    addSubview @textView
  end

  def addLabel
    @label = UILabel.alloc.init
    @label.frame = [[200,50], [100,50]]
    @label.text = 'THIS IS A LABEL'
    @label.textColor = UIColor.greenColor
    @label.numberOfLines = 1
    @label.adjustsFontSizeToFitWidth = true
    addSubview @label
  end

  def addIndicator
    @indicator = UIActivityIndicatorView.alloc.initWithFrame [[0,100], [100,50]]
    addSubview @indicator
    @indicator.startAnimating
    p "is indicator animating? #{@indicator.isAnimating}"
    App.run_after(3) { @indicator.stopAnimating }
  end

  def addSlider
    @slider = UISlider.alloc.initWithFrame [[100,100], [100,50]]
    @slider.continuous = true
    @slider.addTarget self, action: 'sliderChanged:', forControlEvents: UIControlEventValueChanged
    addSubview @slider
  end

  def sliderChanged(sender)
    p "slider changed to: #{sender.value}"
  end

  def addStepper
    @stepper = UIStepper.alloc.initWithFrame [[200,100], [100,50]]
    @stepper.addTarget self, action: 'stepperChanged:', forControlEvents: UIControlEventValueChanged
    addSubview @stepper
  end

  def stepperChanged(sender)
    p "stepper changed to: #{sender.value}"
  end

  def addSegment
    # @segment = UISegmentControl.alloc.initWithFrame [[0,150],[100,50]]
    # addSubview @segment
  end

  def addTextField
    @textField = UITextField.alloc.initWithFrame [[100,150], [100,50]]
    addSubview @textField
  end

  def addSwitch
    @switch = UISwitch.alloc.initWithFrame [[200,150], [100,50]]
    @switch.addTarget self, action: 'switchChanged:', forControlEvents: UIControlEventValueChanged
    addSubview @switch
  end

  def switchChanged(sender)
    p "switch changed to: #{sender}"
  end

  def addSearchBar
    @searchBar = UISearchBar.alloc.initWithFrame [[0,250], [300,50]]
    @searchBar.showsCancelButton = true
    @searchBar.delegate = self
    addSubview @searchBar
  end

  def searchBarSearchButtonClicked(searchBar)
    p "search bar clicked with #{searchBar.text}"
  end
  def searchBarCancelButtonClicked(searchBar)
    p "search bar cancelled with #{searchBar.text}"
  end

  def addPageControl
    @pageControl = UIPageControl.alloc.initWithFrame [[100,200], [100,50]]
    addSubview @pageControl
  end

  def addCollectionView
    @collectionView = UICollectionView.alloc.initWithFrame [[200,200], [100,50]]
    addSubview @collectionView
  end

  def addImageView
    @image = UIImageView.alloc.initWithFrame [[0,300],[200,200]]
    @image.image = UIImage.imageNamed 'native.png'
    p @image.image.size.width
    # @image.frame = CGRectMake 0, 0, @image.image.size.width, @image.image.size.height
    @image.userInteractionEnabled = true
    addSubview @image
  end


# UIToolbar
# UIBarButtonItem (for UIToolbar or UINavigationItem)
# MKMapView

end

