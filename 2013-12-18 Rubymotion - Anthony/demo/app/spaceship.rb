
class Spaceship

	def initialize(universe)
		@universe = universe

		img = UIImage.imageNamed('spaceship.png')
		@ship = UIImageView.alloc.initWithImage( img )

		x = rand * universe.frame.size.width
    	y = rand * universe.frame.size.height
		size = 30
		@ship.frame = CGRectMake( x, y , size, size)
		
		@travel_time = (0.5 * rand) + 1
		
		@universe.addSubview(@ship)
	end
	

	def move(destination)

		# calculate rotation
		delta_y = @ship.center.y - destination.y
		delta_x = @ship.center.x - destination.x
		angle = Math.atan2(delta_y, delta_x)


	  	# animate to new location
	  	UIView.animateWithDuration(
	    	@travel_time,
	    	delay: 0.0,
	    	options: UIViewAnimationCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState,
	    	animations: lambda do
	    		@ship.center = destination
	    		@ship.transform = CGAffineTransformMakeRotation(angle)
	    	end,
	  		completion: lambda do |finished|
	  		end )

	end

end