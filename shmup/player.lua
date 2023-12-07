player = entity:new({
    is_abstract = false,
    max_lives = 4,
    current_lives = 4,
    score = 1000,
    on_spaceship_collides_enemy = function(_ENV)
        current_lives -= 1
    end
})