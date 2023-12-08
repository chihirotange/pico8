sound = {
    on_event_received = function(self,id)
        if id == on_bullet_collide_enemy then
            sfx(1)
        elseif id == on_spaceship_shoot then
            sfx(0)
        end
    end
}