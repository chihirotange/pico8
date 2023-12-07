event_system = {
    listeners = {},
    fire_event = function(self,tbl)
        for listener in all(self.listeners) do
            if listener.on_event_received == nil then
                return
            end
            listener:on_event_received(tbl) 
        end
    end,
    on_spaceship_shoot = 0,     
    on_spaceship_collides_enemy = 1,
    on_bullet_collide_enemy = 2, 
    on_player_died = 3, 
}