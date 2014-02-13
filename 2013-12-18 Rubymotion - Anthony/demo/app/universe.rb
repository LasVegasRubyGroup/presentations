class Universe < UIView

  # overload uiview init method
  def initWithFrame(frame)
    super

    # add space background
    space_img = UIImage.imageNamed('space.jpg')
    space = UIImageView.alloc.initWithImage(space_img)
    space.frame = frame
    self.addSubview(space)
    
    # add spaceships
    @spaceships = Array.new
    @spaceships << Spaceship.new(self)
    
    return self
  end


  # capture on touch event
  def touchesBegan(touches, withEvent:event)
  	touch = touches.anyObject
  	location = touch.locationInView(self)

	  @spaceships.each do |spaceship|
		  spaceship.move(location)
	  end
  end

end