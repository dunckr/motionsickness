class ComponentsController < UIViewController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle 'Components', image:nil, tag:1
    end
    self
  end

  def loadView
    self.view = ComponentsView.alloc.init
  end

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
  end

  def viewWillAppear(animated)
    parentViewController.title = 'Components'
    parentViewController.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle('Lefty', style:UIBarButtonItemStylePlain, target:self, action:'click')
    parentViewController.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle('Righty', style:UIBarButtonItemStylePlain, target:self, action:'click')
  end

  def click
    p 'we are clicking the testing button'
  end
end
