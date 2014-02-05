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
        TabOneController.alloc.init,
        TabTwoController.alloc.init,
        TabThreeController.alloc.init,
        TabFourController.alloc.init
    ]
    tabbar.selectedIndex = 0
    tabbar
  end

  def beer_details_controller
    @beer_details_controller ||= BeerDetailsController.alloc.init
  end

end
