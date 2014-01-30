class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)


    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    # @window.makeKeyandVisible


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
end
