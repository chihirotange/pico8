global = _ENV
entites = {
    entities_list = {},
    update = function(self)
        for ent in all(self.entities_list) do
            ent:update()
        end
    end,
    draw = function(self)
        for ent in all(self.entities_list) do
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
        return tbl
    end
}, {__index = _ENV})

entity = class:new(
    {
        -- @TODO: refactor, find better algorithm
        x = 0,
        y = 0,
        -- object with draw_order = -1 will not be drawn
        draw_order = -1,
        new = function(_ENV, tbl)
            local tbl = class.new(_ENV, tbl)
            for i = 1,#entites do
                if tbl.draw_order > entites[i].draw_order then
                    add(entites.entities_list, tbl, i + 1)
                    break
                else
                    if not is_abstract then
                        add(entites.entities_list,tbl, i)
                    end
                    break
                end
            end
            if count(entites) == 0 and not tbl.is_abstract then
                add(entites.entities_list,tbl)
            end
            return tbl
        end,
        update = function(_ENV)
        end,
        draw = function(_ENV)
        end
    }
)

-- sprite entities
entity_spr = entity:new
{
    sprid = 0,
    draw = function(_ENV)
        spr(sprid, x, y)
    end
}