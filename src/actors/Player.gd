extends KinematicBody2D

var bulletspeed = 2000
var bullet = preload("res://src/weapons/Bullet.tscn")
var movespeed = 500

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up"):
		motion.y-=1
	if Input.is_action_pressed("down"):
		motion.y+=1
	if Input.is_action_pressed("left"):
		motion.x-=1
	if Input.is_action_pressed("right"):
		motion.x+=1
	
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("fire"):
		fire()

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bulletspeed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
