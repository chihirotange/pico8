pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
ball_r = 2
ball_x = 10 + ball_r
ball_y = 1 + ball_r
ball_dx = 2
ball_dy = 2

pad_x = 10
pad_y = 97 -- will be calculated on update
pad_w = 30
pad_h = 70
pad_dx = 15
pad_s = 4
pad_gap = 20
is_collide = false
function _update()
    pad_y = 127 - pad_h - pad_gap
    if btn(0) then
        pad_dx = -pad_s;
    end
    if btn(1) then
        pad_dx = pad_s;
    end
    pad_x += pad_dx 
    --limit pad to the left and right bound
    pad_x = min(max(0, pad_x), 127 - pad_w)
    ball_x += ball_dx
    ball_y += ball_dy
    -- check if ball hits pad
    if ball_box(pad_x, pad_y, pad_w, pad_h) then
        if not is_collide then
            -- ball_dy = -ball_dy
            if ball_edge(pad_x, pad_y, pad_w, pad_h) then
                ball_dx = -ball_dx
            else
                ball_dy = -ball_dy
            end
        end
        is_collide = true
    else
        is_collide = false
    end
    if ball_x > 127 - ball_r or ball_x < 0 + ball_r then
        ball_dx = -ball_dx
    end
    if ball_y > 127 - ball_r or ball_y < 0 + ball_r then
        ball_dy = -ball_dy
    end
    pad_dx *= 0.7
end

function _draw()
    cls(1)
    circfill(ball_x, ball_y, ball_r, 10)
    rectfill(pad_x, pad_y, pad_x + pad_w, pad_y + pad_h, 7)
end

-- ball collision check
function ball_box(box_x, box_y, box_w, box_h)
    if ball_y - ball_r >= box_y + box_h then
        return false
    end
    if ball_y + ball_r <= box_y then
        return false
    end
    if ball_x - ball_r >= box_x + box_w then
        return false
    end
    if ball_x + ball_r <= box_x then
        return false
    end
    return true
end

function ball_edge(box_x, box_y, box_w, box_h)
    local slp = ball_dy / ball_dx
    local dx, dy
    -- down right
    if slp > 0 and ball_dx > 0 then
        dx = box_x - ball_x
        dy = box_y - ball_y
        if dx <= 0 then return false
        elseif dy/dx < slp then
            return true
        end
    -- up left
    elseif slp > 0 and ball_dx < 0 then 
        dx = box_x + box_w - ball_x
        dy = box_y + box_h - ball_y
        if dx >= 0 then return false
        elseif dy/dx < slp then
            return true
        end
    -- up right
    elseif slp < 0 and ball_dx > 0 then
        dx = box_x - ball_x
        dy = box_y + box_h - ball_y
        if dx <= 0 then return false
        elseif dy/dx > slp then
            return true
        end
    -- down left
    elseif slp < 0 and ball_dx < 0 then
        dx = box_x + box_w - ball_x
        dy = box_y - ball_y
        if dx < 0 then return false
        elseif dy/dx > slp then
            return true
        end
    end
    return false
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100001605016050160501605016050160500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
