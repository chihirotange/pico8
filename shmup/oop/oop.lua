global = _ENV
entites = {}

class = setmetatable( {
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
        draw_order = -1,
        new = function(_ENV, tbl)
            tbl = class.new(_ENV, tbl)
            for i = 1,#entites do
                if tbl.draw_order > entites[i].draw_order then
                    add(entites, tbl, i + 1)
                    break
                else
                    if tbl.draw_order != -1 then
                        add(entites,tbl, i)
                    end
                    break
                end
            end
            if count(entites) == 0 and tbl.draw_order != -1 then
                add(entites,tbl)
            end
            return tbl
        end,
        update = function(_ENV)
        end,
        draw = function(_ENV)
        end
    }
)

entity_spr = entity:new
{
    sprid = 0,
    draw = function(_ENV)
        spr(sprid, x, y)
    end
}