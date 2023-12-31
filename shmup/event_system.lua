all_listeners = {}
-- event ids

on_spaceship_shoot = 0     
on_spaceship_collides_enemy = 1
on_bullet_collide_enemy = 2 
on_player_died = 3 

fire_event = function(event_id, tbl)
    for listener in all(all_listeners) do
        if listener.on_event_received == nil then
            return
        end
        listener:on_event_received(event_id, tbl) 
    end
end