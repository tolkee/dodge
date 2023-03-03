extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	
	var mob_types = $AnimatedSprite2D.get_sprite_frames().get_animation_names()
	var mob_type = mob_types[randi() % mob_types.size()]
	
	$AnimatedSprite2D.animation = mob_type

	# Pick the right hurtbox
	match mob_type:
		'walk':
			$WalkHitbox.disabled = false 
			$FlyHitbox.disabled = true 
			$SwimHitbox.disabled = true
		'swim':
			$WalkHitbox.disabled = true 
			$FlyHitbox.disabled = true 
			$SwimHitbox.disabled = false
		'fly':
			$WalkHitbox.disabled = true 
			$FlyHitbox.disabled = false 
			$SwimHitbox.disabled = true
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
