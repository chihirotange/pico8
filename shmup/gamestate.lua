gamestate = {
    -- is_abstract = false,
    current_state = "start",
    update = function(self)
        if self.current_state == "game" then
            entities:update()
        elseif self.current_state == "start" then
            if btnp(4) or btnp(5) then
                self.current_state = "game"
            end
        elseif self.current_state == "end" then
            if btnp(4) or btnp(5) then
                self.current_state = "game"
            end
        end
    end,
    draw = function(self)
        if self.current_state == "game" then
            cls(1)
            entities:draw()
            debug(80,100, 
            {
                count(entities.entities_update_list),
                count(all_enemies)
            })
        elseif self.current_state == "start" then
            cls(1)
            print("press X or O to start", 20, 50)
        elseif self.current_state == "end" then
            cls(1)
            print("game over", 45, 50)
        end
    end,
    on_event_received = function(self, tbl)
       if tbl.event_id == event_system.on_player_died then 
            self.current_state = "end"
       end
    end
}