extends CharacterBody2D
class_name Enemy2

signal ennemi_elimine

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var soundHit: AudioStreamPlayer2D = $soundHit
@onready var soundExplode: AudioStreamPlayer2D = $soundExplode
@onready var explosion: CPUParticles2D = $explosion
@onready var soundDeath: AudioStreamPlayer2D = $soundDeath

const SPEED := 100.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction := Vector2.LEFT
var health := 1

var killed_by_player := false
var is_attacking := false


#  PHYSICS
func _physics_process(delta: float) -> void:
	if is_attacking:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = direction.x * SPEED
	move_and_slide()

	if is_on_wall():
		direction *= -1

	_set_animation()

	if health <= 0:
		_die()


#  ANIMATIONS
func _set_animation() -> void:
	if is_attacking:
		return
	sprite.flip_h = direction.x < 0
	animationPlayer.play("run")

#  HIT PLAYER
func _on_get_hit_body_entered(body: Node2D) -> void:
	if body is Player and not is_attacking:
		is_attacking = true
		velocity = Vector2.ZERO
		animationPlayer.play("attack2")
		body.take_damage()

#  PLAYER ATTACKS ENEMY
func _on_get_damaged_box_body_entered(body: Node2D) -> void:
	if body is Player:
		health -= 1
		killed_by_player = true
		soundHit.play()

#  DEATH
func _die() -> void:
	$CollisionShape2D.disabled = true
	$limite.disabled = true
	$getHit/CollisionShape2D.disabled = true
	$getHit/CollisionShape2D2.disabled = true
	set_physics_process(false)
	animationPlayer.play("death")

	if not killed_by_player:
		soundDeath.play()

#  ANIMATION END
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack2":
		is_attacking = false

	elif anim_name == "death":
		explosion.emitting = true
		soundExplode.play()
		emit_signal("ennemi_elimine")
		await get_tree().create_timer(0.5).timeout
		queue_free()
