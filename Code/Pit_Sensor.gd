extends Area2D

# Pit sensor
func _on_Pit_sensor_body_entered(body):
	if body.get_name() == "Player":        # if the body's name is player, the scene will reload
		$"Transition Timer".start()
		$Transition.interpolate_property(get_parent(), "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.35,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Transition.start()

func _on_Transition_Timer_timeout():
	if get_tree().reload_current_scene() != OK:
		print_debug("An error occured when trying to reload the current scene at Pit_Sensor.gd.")