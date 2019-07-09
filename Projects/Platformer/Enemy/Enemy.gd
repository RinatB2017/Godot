extends RigidBody2D

var Bullet = preload("res://bullet/Bullet.tscn" )

var energy = 100
var timer = 0


#
# получение урона от врага
#
func get_damage(damage):
	energy -= damage
	if energy <= 0:
		queue_free()

func shoot():
	var bul = Bullet.instance()
	get_node("../").add_child(bul)

	bul.position = position + Vector2(-50, 0)
	bul.apply_impulse(Vector2(), Vector2(-800, 0))

func _physics_process(delta):
	timer += delta
	if timer > 1:
		timer = 0
		shoot()
