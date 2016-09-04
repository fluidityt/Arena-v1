import SpriteKit


func handleDirection ( 	current_angle		:CGFloat = _curA,
												previous_y			:CGFloat = _prevY,
												current_y				:CGFloat
										 ) 																			{
	
	// Locals:
		let
			clock_spin 		:CGFloat = 6.281,
			counter_spin 	:CGFloat = -6.281,
			no_spin 			:CGFloat = 0
	
		var next_angle = (current_angle) + (no_spin)
	
	
	// Utilities
		func rotateIt() {
			_central?.runAction(SKAction.rotateToAngle(next_angle, duration: 0))
		}
	
	
	// Handle touch
		doLogic() {
			
			// Drag up
			if (current_y > previous_y) {
			
				next_angle += clock_spin
				rotateIt()
			}
		
			// Drag down
			else if (current_y < previous_y) {
				
				next_angle += counter_spin
				rotateIt()
			}
			
			// Paused (lateral)
			else if (current_y == previous_y){
			
				_central?.removeAllActions()
			}
	
		}
	
	
	// Wrap up
		defer {
			
			// for sanity
			let finished_y = current_y
			
			// Update globes for next entry
			_prevY = finished_y
			_curY  = current_y
			_curA  = next_angle
		}
	
	
}


