class HtmlController < UIViewController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle 'HTML', image:nil, tag:1
    end
    self
  end

  def loadView
    background = UIColor.blackColor
    self.view = UIView.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    self.view.backgroundColor = background
    webFrame = UIScreen.mainScreen.applicationFrame
    webFrame.origin.y = 0.0
    @webView = UIWebView.alloc.initWithFrame(webFrame)
    @webView.backgroundColor = background
    @webView.scalesPageToFit = true
    @webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
    @webView.delegate = self
    @webView.loadRequest(NSURLRequest.requestWithURL(NSURL.fileURLWithPath(NSBundle.mainBundle.pathForResource('index', ofType:'html'))))
  end

  def webViewDidFinishLoad(webView)
    self.view.addSubview(@webView)
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    if UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPad
      if interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown
        return false
      end
    end
    true
  end

  def webView(inWeb, shouldStartLoadWithRequest:inRequest, navigationType:inType)

    bridge inRequest.URL.absoluteString

    if inType == UIWebViewNavigationTypeLinkClicked && inRequest.URL.scheme != 'file'
      UIApplication.sharedApplication.openURL(inRequest.URL)
      return false
    end
    true
  end

  def bridge(command)
    parts = command.split(':')
    if parts[1] == 'bridge'
      App.alert command.split(':')[2]
    end
  end
end
