import SpriteKit


func rotateInDirectionWithAccel ( 	current_angle current_angle		:CGFloat,
												
                       	previous_y			:CGFloat,
												current_y				:CGFloat,
												
												previous_time		:NSTimeInterval,
												current_time		:NSTimeInterval
										 ) 																			{
	
	// Locals: \\
		let
			/// Mucho SPino
			accel_coef	 = accelerateTimer(previous_y,
																		 curY: current_y,
																		 prevT: previous_time,
																		 curT: current_time),
	
			clock_spin 		= (0 - accel_coef),
			counter_spin 	= (0 + accel_coef),
			no_spin 			:CGFloat = 0
	
		var next_angle = (current_angle + no_spin)
	
	// Utilities \\
		func rotateIt() {
			
			// Store action from accelerator
			let	action = SKAction.rotateToAngle(next_angle,
			   	                                duration: 0.0)
			
			// Run it
			_central?.runAction(action)
		 
		}
	
	
	// Handle touch \\
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
				///Reset
				printl("paused but didn't release")
				Hotfix() {
					_central?.removeAllActions()
					y1 = 0; y2 = 0; y3 = 0

				}
			}
	
		}
	
	
	// Wrap up \\
		defer {
			
			///for temporal sanity
			let finished_y = current_y
			let finished_time = current_time
			
			///Update globes for next entry
			_prevY = finished_y
			_curY  = current_y
			
			_curA  = next_angle
			
			_timeThen = finished_time
		}
	
	
}


