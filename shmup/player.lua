player = entity:new({
    is_abstract = false,
    max_lives = 4,
    current_lives = 4,
    score = 0,
    on_event_received = function(_ENV, id)
        if id == on_spaceship_collides_enemy then
            current_lives -= 1
            if current_lives == 0 then
                fire_event(on_player_died)
            end
        elseif id == on_bullet_collide_enemy then
            score += 1
        end
    end
})