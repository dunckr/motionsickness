class SubviewController < UIViewController

  def loadView
    self.view = UIScrollView.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight
    view.autoresizesSubviews = true
    view.backgroundColor = UIColor.whiteColor
  end

  def detail(point)
    @name = point.name
    navigationItem.title = @name
  end

end
