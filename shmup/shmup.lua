-- #include starfield.lua
function _init()
    raw_speed = 2
    current_x = 0
    current_y = 0
    ship_spr = 2
    ship_current_spr = ship_spr
    ship_x = 64
    ship_y = 100

    ship_flame_spr = 5
    current_flame_spr = ship_flame_spr

    bull_x = 0
    bull_y = 0
    bull_spr = 16
    bull_speed = -5
    
    --muzzle
    muzzle_size = 14
    muzzle_speed = 3
    current_muzzle_size = muzzle_size
    
    --score
    score = 5000

    --current_lives
    max_lives = 7
    current_lives = 4

    --starfield
    stars_x = {}
    stars_y = {}
    stars_sp = {}

    for i=1,100 do
        add(stars_x,rnd(127))
        add(stars_y,rnd(127))
        add(stars_sp,rnd(1.5)+0.5)
    end
end

function _update()
    current_x = 0
    current_y = 0
    ship_current_spr = ship_spr
    
    if (current_muzzle_size > 0) then
        current_muzzle_size -= muzzle_speed
    end
    if btn(0) then
        current_x = -raw_speed
        ship_current_spr = ship_spr + 1
    end
    if btn(1) then 
        current_x = raw_speed
        ship_current_spr = ship_spr - 1
    end

    if btn(2) then
        current_y = -raw_speed
    end

    if btn(3) then
        current_y = raw_speed
    end

    if btnp(4) then 
        bull_y = ship_y - 2
        bull_x = ship_x
        sfx(0)

        current_muzzle_size = muzzle_size
    end

    -- update ship position
    ship_x = ship_x + current_x
    ship_y = ship_y + current_y

    -- stop when touch edge
    if (ship_x < 0) then
        ship_x = 120
    end

    if (ship_x > 120) then
        ship_x = 0
    end

    if (ship_y > 120) then
        ship_y = 0
    end

    if (ship_y < 0) then
        ship_y = 120
    end

    --update bull position
    bull_y += bull_speed

    --starfield
    Starfield_Update()
end

function _draw()
    cls(1)
    spr(ship_current_spr,ship_x,ship_y)
    Starfield_Draw()

    --flame
    current_flame_spr += 1
    if (current_flame_spr > ship_flame_spr + 4) then
        current_flame_spr = ship_flame_spr
    end
    spr(current_flame_spr,ship_x,ship_y+8)
    
    --muzzle
    if (current_muzzle_size > 0) then
        circfill(ship_x + 4, ship_y - muzzle_size/3, current_muzzle_size/2, 7)
    end

    --enemy
    -- enemy:draw()

    --bullet
    spr(bull_spr,bull_x,bull_y)

    --lives
    for i = 0,max_lives - 1 do
        if current_lives > i then
            spr(12, 1 + i*9,2)
        else
            spr(11, 1 + i *9,2)
        end
    end

    --starfield

    print("score: "..score, 80,2, 8)

    for ent in all(entites) do
        ent:draw()
    end
    debug(80,110)

end

function debug(x,y)
    print("ship x: " .. ship_x, x, y, 11)
    print("ship y: " .. ship_y)
    print(count(entites))
end