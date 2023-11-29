function Starfield_Update()
   for i=1,#stars_y do
        if(stars_y[i]<128) then
            stars_y[i] = stars_y[i] + 1
        else
            stars_y[i] = 0
        end
   end
end

function Starfield_Draw()
    for i=1,#stars_x do
        circfill(stars_x[i], stars_y[i], 1,2)
    end
end