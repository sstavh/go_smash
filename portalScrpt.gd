extends Area2D
var destination



func _ready():
	destination = get_node("PortalDesination").global_position


func _on_body_entered(body):
	if body is Node2D and body.is_in_group("Player"):
		body.global_position = destination
