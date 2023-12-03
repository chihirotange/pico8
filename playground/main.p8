pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _update()
    if (btn(0)) then
        rec_1.x -= 2
    end
    if (btn(1)) then
        rec_1.x += 2
    end
    if (btn(2)) then
        rec_1.y -= 2
    end
    if (btn(3)) then
        rec_1.y += 2
    end
    printh(col(rec_1, rec_2))
end
function _draw()
    cls(1)
    rec_1:draw()
    rec_2:draw()
end

function _init()
    
    rec = setmetatable({
        x = 0,
        y = 0,
        w = 0,
        h = 0,
        col = 0,
        new = function(_ENV, input_tbl)
            local tbl = input_tbl or {}
            setmetatable(tbl, {
                __index = _ENV
            })
            return tbl
        end,
        draw = function(_ENV)
            rectfill(x,y, x + w, y + h, col)
        end
    }, {__index = _ENV})
    rec_1 = rec:new({
        x = 10,
        y = 10,
        w = 15,
        h = 15,
        col = 7,
    })
    rec_2 = rec:new({
        x = 30,
        y = 30,
        w = 15,
        h = 15,
        col = 8,
    })
end
_gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000