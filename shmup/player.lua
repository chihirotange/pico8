player = entity:new({
    is_abstract = false,
    max_lives = 4,
    current_lives = 4,
    score = 0,
    on_event_received = function(_ENV, id)
        if id == on_spaceship_collides_enemy then
            current_lives -= 1
        end
    end
})