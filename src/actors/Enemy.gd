extends KinematicBody2D


func _physics_process(delta):
	var player = get_parent().get_node("Player")
	
	position += (player.position - position) / 50
	look_at(player.position)
	
	
