
class MainController < UIViewController

  # called on instantiation
  def loadView

	# instantiate root view
    universe_frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.height, UIScreen.mainScreen.bounds.size.width)
    @universe = Universe.alloc.initWithFrame( universe_frame )
    self.view = @universe

  end


end