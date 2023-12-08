sound = {
<<<<<<< HEAD
    on_event_received = function(self,id)
        if id == on_bullet_collide_enemy then
            sfx(1)
        elseif id == on_spaceship_shoot then
=======
    on_event_received = function(self,tbl)
        if tbl.event_id == event_system.on_bullet_collide_enemy then
            sfx(2)
        elseif tbl.event_id == event_system.on_spaceship_shoot then
>>>>>>> 384ffccc371cdafef7265ee133d6e40fbaff76bd
            sfx(0)
        elseif tbl.event_id == event_system.on_spaceship_collides_enemy then
            sfx(1)
        end
    end
}