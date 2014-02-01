class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds

    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [
        TabOneController.alloc.init,
        TabTwoController.alloc.init,
        TabThreeController.alloc.init,
        TabFourController.alloc.init
    ]

    tabbar.selectedIndex = 0

    @window.rootViewController = UINavigationController.alloc.initWithRootViewController tabbar
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    # @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    # @window.makeKeyAndVisible
    # @view_controller = TapController.alloc.initWithNibName(nil, bundle:nil)
    # @window.rootViewController = @view_controller


    # tabbar.viewControllers = [TapController.alloc.initWithNibName(nil, bundle:nil)]
    # tabbar.viewControllers = [BeerMapController.alloc.init, BeerListController.alloc.init]
    # tabbar.selectedIndex = 0
    # @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tabbar)
    # @window.rootViewController.wantsFullScreenLayout = true
    # @window.makeKeyAndVisible

    # p "#{App.name} #{App.documents_path} #{BW.create_uuid}"

    # @name = App.documents_path

    # p @name

    # App.run_after(0.5) {  p "It's #{Time.now}" }
    # p Device.iphone?

    # BW::HTTP.get("https://api.github.com/users/dunckr") do |response|
    #   # p response.body.to_str
    #   parsed = BW::JSON.parse response.body

    #   parsed.each do |element|
    #     p element
    #   end
    # end

    # @foreground_observer = App.notification_center.observe UIApplicationWillEnterForegroundNotification do |notification|
    #   loadAndRefresh
    # end
    # BW::Location.get do |result|
    # end

    true
  end

  def beer_details_controller
    @beer_details_controller ||= BeerDetailsController.alloc.init
  end

end
