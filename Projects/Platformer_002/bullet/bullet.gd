extends RigidBody2D

var tm = 0
var damage = 10

func _physics_process(delta):
	tm += delta
	if tm >= 1:
		queue_free()
		
func set_damage(value):
	damage = value

# не забудь установить для Bullet:
# Contact Monitor
# Contacts Reported
func _on_Bullet_body_entered(body):
	#print("_on_Bullet_body_entered")
	tm = 1
	if body.has_method("get_damage"):
		body.call("get_damage", damage)
	if body.has_method("kill"):
		body.call("kill")
