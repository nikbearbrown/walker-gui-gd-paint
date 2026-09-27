extends SceneTree
var failures := 0
var checks := 0
func _initialize():
	call_deferred("run")
func check(ok: bool, label: String):
	checks += 1
	if not ok: failures += 1
	print("PASS " if ok else "FAIL ",label)
func move(pos: Vector2):
	var e := InputEventMouseMotion.new()
	e.position = pos
	e.global_position = pos
	Input.parse_input_event(e)
	await create_timer(0.03).timeout
func button(down: bool, pos: Vector2):
	var e := InputEventMouseButton.new()
	e.button_index = MOUSE_BUTTON_LEFT
	e.pressed = down
	e.position = pos
	e.global_position = pos
	Input.parse_input_event(e)
	await create_timer(0.03).timeout
func press(scene: Node, name: String):
	scene.get_node("ToolsPanel/" + name).grab_focus()
	var e := InputEventKey.new()
	e.keycode = KEY_ENTER
	e.pressed = true
	root.push_input(e)
	await process_frame
	e = InputEventKey.new()
	e.keycode = KEY_ENTER
	root.push_input(e)
	await create_timer(0.03).timeout
func run():
	root.size = Vector2i(1152,648)
	var scene: Node = load("res://paint_root.tscn").instantiate()
	root.add_child(scene)
	await create_timer(0.1).timeout
	var p: Node = scene.get_node("PaintControl")
	var rect: Rect2 = scene.get_node("DrawingAreaBG").get_global_rect()
	print("DIAG canvas ",rect)
	check(p.brush_data_list.is_empty(),"starts empty")
	var start := rect.position + Vector2(80,80)
	await move(start)
	await button(true,start)
	print("DIAG press cursor ",root.get_mouse_position()," down ",Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)," start ",p.mouse_click_start_pos," inside ",p.is_mouse_in_drawing_area," INF approx ",Vector2.INF.is_equal_approx(Vector2.INF))
	await move(start + Vector2(40,30))
	await button(false,start + Vector2(40,30))
	check(p.brush_data_list.size() > 0,"mouse stroke adds brush data")
	await press(scene,"ButtonUndo")
	check(p.brush_data_list.is_empty(),"GUI Undo removes stroke")
	await press(scene,"ButtonToolRectangle")
	check(p.brush_mode == p.BrushMode.RECTANGLE_SHAPE,"GUI selects rectangle")
	await move(start)
	await button(true,start)
	await move(start + Vector2(50,40))
	await button(false,start + Vector2(50,40))
	check(p.brush_data_list.size() == 1,"one rectangle on release")
	if p.brush_data_list.size() == 1:
		check(p.brush_data_list[0].brush_shape_rect_pos_BR - p.brush_data_list[0].brush_pos == Vector2(50,40),"rectangle geometry")
	await press(scene,"ButtonClear")
	check(p.brush_data_list.is_empty(),"GUI Clear empties data")
	await press(scene,"ButtonUndo")
	check(p.brush_data_list.is_empty(),"Undo after shape Clear stays empty")
	await press(scene,"ButtonToolCircle")
	await move(start)
	await button(true,start)
	await move(start + Vector2(60,40))
	await button(false,start + Vector2(60,40))
	check(p.brush_data_list.size() == 1,"circle adds one record")
	if p.brush_data_list.size() == 1:
		check(p.brush_data_list[0].brush_pos.is_equal_approx(start + Vector2(30,20)) and is_equal_approx(p.brush_data_list[0].brush_shape_circle_radius,20),"circle center and radius")
	await press(scene,"ButtonUndo")
	check(p.brush_data_list.is_empty(),"Undo circle")
	await press(scene,"ButtonToolEraser")
	await move(start)
	await button(true,start)
	await move(start + Vector2(40,30))
	await button(false,start + Vector2(40,30))
	check(not p.brush_data_list.is_empty() and p.brush_data_list[-1].brush_type == p.BrushMode.ERASER,"eraser command recorded")
	await press(scene,"ButtonClear")
	await press(scene,"ButtonUndo")
	check(p.brush_data_list.is_empty(),"Undo after eraser Clear stays empty")
	await move(Vector2(10,620))
	await button(true,Vector2(10,620))
	await move(start)
	await button(false,start)
	check(p.brush_data_list.is_empty(),"outside-start drag ignored")
	await press(scene,"ButtonToolPencil")
	await press(scene,"BrushSettings/ButtonShapeBox")
	check(p.brush_shape == p.BrushShape.RECTANGLE,"GUI selects box brush")
	var slider: HScrollBar = scene.get_node("ToolsPanel/BrushSettings/HScrollBarBrushSize")
	var old_size: float = slider.value
	var slider_point := slider.get_global_rect().get_center() + Vector2(70,0)
	await move(slider_point)
	await button(true,slider_point)
	await button(false,slider_point)
	check(slider.value > old_size and p.brush_size == ceili(slider.value),"mouse slider updates brush size")
	var size_label: String = scene.get_node("ToolsPanel/BrushSettings/LabelBrushSize").text
	print("DIAG size label ",size_label)
	check(size_label.begins_with("Brush size: ") and size_label.ends_with("px") and is_equal_approx(size_label.trim_prefix("Brush size: ").trim_suffix("px").to_float(),p.brush_size),"size label follows slider")
	await move(start)
	await button(true,start)
	await move(start + Vector2(40,30))
	await button(false,start + Vector2(40,30))
	if not p.brush_data_list.is_empty():
		print("DIAG configured brush record ",p.brush_data_list[-1])
		check(p.brush_data_list[-1].brush_shape == p.BrushShape.RECTANGLE and p.brush_data_list[-1].brush_size == p.brush_size,"stroke stores selected shape and size")
	else:
		check(false,"stroke stores selected shape and size")
	await press(scene,"BrushSettings/ButtonShapeCircle")
	check(p.brush_shape == p.BrushShape.CIRCLE,"GUI restores circle brush")
	scene.queue_free()
	await process_frame
	print("RESULT ",checks," checks; ",failures," failures")
	quit(1 if failures else 0)
