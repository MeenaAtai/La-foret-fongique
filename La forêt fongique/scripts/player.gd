extends CharacterBody2D
class_name Player

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

var jump_count = 0
var health = 5

var is_dead := false
var is_hurt := false
var alive := true
var hurt_duration := 0.4

var hearts_list : Array[TextureRect]

@onready var audioJump = $audioJump
@onready var audiodeath = $audioDeath
@onready var sprite := $AnimatedSprite2D


func _ready() -> void:
	var hearts_parent = $health_bar/HBoxContainer
	for child in hearts_parent.get_children():
		hearts_list.append(child)


#DÉGÂTS
func take_damage():
	if is_dead or is_hurt:
		return

	health -= 1
	is_hurt = true

	sprite.play("hurt")
	update_heart_display()
	
	$HurtTimer.start(hurt_duration)

func _on_hurt_timer_timeout():
	is_hurt = false


func update_heart_display():
	for i in range(hearts_list.size()):
		hearts_list[i].visible = i < health

	if health <= 0:
		mourir()


func _physics_process(delta: float) -> void:
	if is_dead:
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	# SAUT SIMPLE + DOUBLE SAUT
	if Input.is_action_just_pressed("jump") and jump_count == 1:
		velocity.y = JUMP_VELOCITY
		audioJump.play()
		jump_count = 2

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		audioJump.play()
		jump_count = 1

	if not Input.is_action_just_pressed("jump") and is_on_floor():
		jump_count = 0

	var direction := Input.get_axis("move_left", "move_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	animations(direction)

	if direction == 1:
		sprite.flip_h = false
	elif direction == -1:
		sprite.flip_h = true


func animations(direction):
	if is_dead:
		sprite.play("death")
		return

	if is_hurt:
		sprite.play("hurt")
		return

	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		if velocity.y < 0:
			sprite.play("jump")
		elif velocity.y > 0:
			sprite.play("fall")


# MORT
func mourir():
	if is_dead:
		return

	is_dead = true
	velocity = Vector2.ZERO
	audiodeath.play()
	sprite.play("death")
	get_tree().change_scene_to_file("res://scenes/jeu_level_game_over.tscn")

func activate_lever(lever):
	print("Lever activé :", lever.link_code)
	# ici tu peux faire quelque chose, par ex. ouvrir une porte
