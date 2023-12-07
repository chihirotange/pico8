player = entity:new({
    is_abstract = false,
    max_lives = 4,
    current_lives = 4,
    score = 0,
    on_spaceship_collides_enemy = function(_ENV)
        current_lives -= 1
    end,
    on_bullet_collide_enemy = function(_ENV)
        printh("in player")
        score += 1000
        printh(score)
    end
})