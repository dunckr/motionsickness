class ComponentsView < UIView

  def initWithFrame(frame)
    if super
      addButton()
      addLabel()
      addIndicator()
      addTextView()
      addSlider()
      addStepper()
      addTextField()
      addSwitch()
      addSearchBar()
      addPageControl()
      addProgress()
      addImageView()
      addToolbar()
    end
    self
  end

  def addButton
    @button1 = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button1.setTitle 'Animate', forState: UIControlStateNormal
    @button1.frame = [[0,50], [500,50]]
    @button1.addTarget self, action: :animate, forControlEvents: UIControlEventTouchUpInside
    addSubview @button1

    @button2 = UIButton.buttonWithType UIButtonTypeInfoDark
    @button2.setTitle 'Mail', forState: UIControlStateNormal
    @button2.frame = [[0,100], [100,50]]
    @button2.addTarget self, action: :sms, forControlEvents: UIControlEventTouchUpInside
    addSubview @button2

    @button3 = UIButton.buttonWithType UIButtonTypeContactAdd
    @button3.setTitle 'SMS', forState: UIControlStateNormal
    @button3.frame = [[0,150], [100,50]]
    @button3.addTarget self, action: :mail, forControlEvents: UIControlEventTouchUpInside
    addSubview @button3
  end

  def sms
    BW::SMS.compose({

    }) do |result,error|
      p result.sent?
      p result.canceled?
      p error
    end
  end

  def mail
    BW::Mail.compose({
      subject: 'Emailing',
      message: 'Does this overwrite the iPhone bit',
      animated: true
    }) do |result, error|
      p result.sent?
      p result.canceled?
      p error
    end
  end

  def animate
    UIView.animateWithDuration(2,
      animations: -> {
        @button1.frame = [[100,100], [100,50]]
      }
    )
  end

  def addLabel
    @label = UILabel.alloc.init
    @label.frame = [[0,50], [100,50]]
    @label.text = 'THIS IS A LABEL'
    @label.textColor = UIColor.greenColor
    @label.numberOfLines = 1
    @label.adjustsFontSizeToFitWidth = true
    addSubview @label
  end

  def addIndicator
    @indicator = UIActivityIndicatorView.alloc.initWithFrame [[0,150], [500,50]]
    addSubview @indicator
    @indicator.startAnimating
    p "is indicator animating? #{@indicator.isAnimating}"
    App.run_after(3) { @indicator.stopAnimating }
  end

  def addSlider
    @slider = UISlider.alloc.initWithFrame [[0,200], [300,50]]
    @slider.continuous = true
    @slider.value = 0.5
    @slider.addTarget self, action: 'sliderChanged:', forControlEvents: UIControlEventValueChanged
    addSubview @slider
  end

  def sliderChanged(sender)
    p "slider changed to: #{sender.value}"
  end

  def addStepper
    @stepper = UIStepper.alloc.initWithFrame [[200,300], [100,50]]
    @stepper.addTarget self, action: 'stepperChanged:', forControlEvents: UIControlEventValueChanged
    @stepper.value = 1
    addSubview @stepper

    @defer = EM::DefaultDeferrable.new
    @defer.callback {|what| p "what happened #{what}!"}
    @defer.errback {|what| p "oh no! what happened #{what}!"}
  end

  def stepperChanged(sender)
    p "stepper changed to: #{sender.value}"
    if sender.value == 0
      @defer.fail 'stepper too low'
    end
    if sender.value > 1
      @defer.succeed 'stepper high'
    end
  end

  def addTextField
    @textField = UITextField.alloc.initWithFrame [[100,100], [400,50]]
    @textField.text = 'text fielding'
    addSubview @textField
  end

  def addSwitch
    @switch = UISwitch.alloc.initWithFrame [[20,300], [100,50]]
    @switch.addTarget self, action: 'switchChanged:', forControlEvents: UIControlEventValueChanged
    addSubview @switch
  end

  def switchChanged(sender)
    p "switch changed to: #{sender}"
  end

  def addSearchBar
    @searchBar = UISearchBar.alloc.initWithFrame [[0,470], [300,50]]
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
    image = UIImage.imageNamed "native.png"
    @imageView = UIImageView.alloc.initWithImage image
    @imageView.contentMode = UIViewContentModeScaleToFill
    @imageView.frame = [[200,50], [100,50]]
    addSubview @imageView
  end

  def addTextView
    @textView = UITextView.alloc.initWithFrame [[0,370], [300,50]]
    @textView.allowsEditingTextAttributes = true
    @textView.text = '
      app = UIApplication.sharedApplciation
      app.keyWindow.addSubview **
    '
    addSubview @textView
  end

  def addToolbar
    @toolbar = UIToolbar.alloc.initWithFrame [[0,420], [300,50]]
    @toolbar.setBarStyle UIBarStyleBlackTranslucent

    flexButton = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemFlexibleSpace,target: self, action: nil)
    doneButton = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemDone,target: self, action: nil)
    @toolbar.setItems [flexButton, doneButton]

    addSubview @toolbar
  end

  def addProgress
    @progress = UIProgressView.alloc.initWithFrame [[0,250],[300,50]]
    @progress.progress = 0.0
    addSubview @progress

    count = 0
    timer = EM.add_periodic_timer 0.5 do
      count = count + 0.05
      @progress.progress = count
      ( count < 1) || EM.cancel_timer(timer)
    end
  end

end

