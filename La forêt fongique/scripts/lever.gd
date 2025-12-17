extends Area2D

@export var link_code: int = 0
signal lever_turned(link_code: int)

const TEXTURES := {
	"right": preload("res://assets/levier/lever.png"),
	"left": preload("res://assets/levier/lever2.png")
}

var activated := false

@onready var sprite: Sprite2D = $Sprite2D


func _ready() -> void:
	sprite.texture = TEXTURES["left"]
	monitoring = true


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		var direction := 0

		if body.velocity.x > 0:
			direction = 1
		elif body.velocity.x < 0:
			direction = -1
		else:
			return

		turn_lever(direction)


func turn_lever(direction: int) -> void:
	if activated:
		return

	activated = true

	if direction == 1:
		sprite.texture = TEXTURES["right"]
	else:
		sprite.texture = TEXTURES["left"]

	emit_signal("lever_turned", link_code)

	await get_tree().create_timer(0.5).timeout
	activated = false
