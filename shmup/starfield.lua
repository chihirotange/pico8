function Starfield_Update()
   for i=1,#stars_y do
        local sy = stars_y[i]
        if(sy<128) then
            sy = sy + stars_sp[i]
        else
            sy = 0
        end
        stars_y[i] = sy
   end
end

function Starfield_Draw()
    for i=1,#stars_x do
        sp = stars_sp[i]
        sc = 7
        if (sp < 1) then
            sc = 5 
        elseif (sp < 1.5) then
            sc = 6
        end
        pset(stars_x[i], stars_y[i], sc)
    end
end