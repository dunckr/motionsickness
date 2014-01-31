class TabFourController < UIViewController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle 'Tab 1', image:nil, tag:1
    end
    self
  end

  def loadView
    self.view = TabOneView.alloc.init
  end

  def viewDidLoad
    view.backgroundColor = UIColor.orangeColor
  end

  def viewWillAppear(animated)
    parentViewController.title = 'Tab 1 Title'
    parentViewController.navigationItem.leftBarButtonItem = nil
    parentViewController.navigationItem.rightBarButtonItem = nil
  end
end
