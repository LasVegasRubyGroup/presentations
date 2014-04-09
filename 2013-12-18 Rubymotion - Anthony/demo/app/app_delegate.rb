
class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)

  	# initialize main controller
	window_frame = UIScreen.mainScreen.bounds
    @window = UIWindow.alloc.initWithFrame(window_frame)
    @window.rootViewController = MainController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    true
  end

end
