entities = {
    entities_update_list = {},
    entities_draw_list = {},
    update = function(self)
        for ent in all(self.entities_update_list) do
            ent:update()
        end
    end,
    draw = function(self)
        for ent in all(self.entities_draw_list) do
            if (ent.draw_order != -1) then
                ent:draw()
            end
        end
    end
}

class = setmetatable( {
    -- objects that is_abstract are meant to be inherited
    is_abstract = true,
    new = function(_ENV, tbl)
        tbl = tbl or {}
        setmetatable(tbl,{
            __index = _ENV
        })
        if not tbl.is_abstract then
            add(entities.entities_update_list,tbl)
        end
        return tbl
    end,
    update = function(_ENV)
    end
}, {__index = _ENV})

entity = class:new({
        x = 0,
        y = 0,
        -- object with draw_order = -1 will not be drawn
        draw_order = -1,
        new = function(_ENV, input_tbl)
            local tbl = class.new(_ENV, input_tbl)
            for i = 1,#entities.entities_draw_list do
                local current_ent = entities.entities_draw_list[i]
                if tbl.is_abstract then
                    return tbl
                end
                if tbl.draw_order > current_ent.draw_order then

                    add(entities.entities_draw_list, tbl, i + 1)
                    break
                else 
                    add(entities.entities_draw_list, tbl, i)
                    break
                end
            end
            if count(entities.entities_draw_list) == 0 and tbl.draw_order != -1 then
                printh("first")
                add(entities.entities_draw_list, tbl)
            end
            return tbl
        end,
        draw = function(_ENV)
        end
    })

-- sprite entities
entity_spr = entity:new({
    sprid = 0,
    draw = function(_ENV)
        spr(sprid, x, y)
    end
})

entity_txt = entity:new({
    draw_order = 1000,
    txt = "",
    txt_color = 7,
    new = function(_ENV, input_tbl)
        local tbl = entity.new(_ENV,input_tbl)
        tbl.tick_enabled = false
        return tbl
    end,
    draw = function(_ENV)
        print(txt, x, y, txt_color)
    end
})