settings = {
	speed = 0x.004,
	scale = .25
}

turns=0
function init_game()
	print("Called")
	init_planets()

end
function update_game()
	turns+=settings.speed
	update_planets()
	update_player()
end


