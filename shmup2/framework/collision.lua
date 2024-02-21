-- @TODO OPTIMIZE COLLIDER DETECTION LOGICS (QUADTREE)
function col(a,b)
    if (a == b) then
        return
    end
    col_x = abs(a.loc.x + a.w/2 - b.loc.x - b.w/2) < (a.w + b.w)/2
    col_y = abs(a.loc.y + a.h/2 - b.loc.y - b.h/2) < (a.h + b.h)/2
    return col_y and col_x
end