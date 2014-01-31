class TabTwoController < UIViewController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle 'Tab 2', image:nil, tag:1
    end
    self
  end

  def viewDidLoad
    view.backgroundColor = UIColor.yellowColor
  end

  def viewWillAppear(animated)
    parentViewController.title = 'Tab 2 Title'
    parentViewController.navigationItem.leftBarButtonItem = nil
    parentViewController.navigationItem.rightBarButtonItem = nil
  end


end
