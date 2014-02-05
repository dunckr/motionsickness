class TabFourController < UIViewController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle 'Tab 4', image:nil, tag:1
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
    parentViewController.title = 'Tab 4 Title'
    parentViewController.navigationItem.leftBarButtonItem = nil
    parentViewController.navigationItem.rightBarButtonItem = nil
  end
end
