class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController generateTabs()
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end

  def generateTabs
    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [
        ComponentsController.alloc.init,
        HtmlController.alloc.init,
        TableController.alloc.init
    ]
    tabbar.selectedIndex = 0
    tabbar
  end

end
