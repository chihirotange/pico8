event_system = {
    listeners = {},
    on_spaceship_shoot = function(self)
        for listener in all(self.listeners) do
            if listener.on_spaceship_shoot == nil then
                return
            end
            listener:on_spaceship_shoot() 
        end
    end
}