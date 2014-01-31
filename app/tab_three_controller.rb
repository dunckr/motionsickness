class TabThreeController < UITableViewController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle 'Tab 3', image: nil, tag:1
    end
    self
  end

  def viewWillAppear(animated)
    parentViewController.title = 'Tab 3'
    parentViewController.navigationItem.leftBarButtonItem = editButtonItem
    parentViewController.navigationItem.rightBarButtonItem = nil
  end

end
