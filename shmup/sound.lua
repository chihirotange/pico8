sound = {
    on_event_received = function(self,tbl)
        if tbl.event_id == event_system.on_bullet_collide_enemy then
            sfx(2)
        elseif tbl.event_id == event_system.on_spaceship_shoot then
            sfx(0)
        elseif tbl.event_id == event_system.on_spaceship_collides_enemy then
            sfx(1)
        end
    end
}