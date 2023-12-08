player = entity:new({
    is_abstract = false,
    max_lives = 4,
    current_lives = 4,
    score = 0,
    on_event_received = function(_ENV, id)
        if id == on_spaceship_collides_enemy then
            current_lives -= 1
            if current_lives == 0 then
                event_system:fire_event({
                    event_id = event_system.on_player_died
                })
            end
        elseif tbl.event_id == event_system.on_bullet_collide_enemy then
            score += 1
        end
    end
})