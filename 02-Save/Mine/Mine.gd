extends Area2D

var Explosion = load("res://Explosion/Explosion.tscn")
onready var Explosions = get_node_or_null("/root/Game/Explosions")

var damage = 10

func _on_Mine_body_entered(body):
	if body.name == "Player":
		if Explosions != null:
			var explosion = Explosion.instance()
			explosion.position = position
			Explosions.add_child(explosion)
			explosion.playing = true
		Global.update_health(-damage)
		queue_free()
