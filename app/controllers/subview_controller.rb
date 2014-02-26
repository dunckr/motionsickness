class SubviewController < UIViewController

  def loadView
    self.view = UIScrollView.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight
    view.autoresizesSubviews = true
    view.backgroundColor = UIColor.whiteColor
  end

  def detail(name)
    @name = name
    navigationItem.title = @name
  end

end
