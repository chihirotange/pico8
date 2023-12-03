function col(a,b)
    col_x = abs(a.x + a.w/2 - b.x - b.w/2) < (a.w + b.w)/2
    col_y = abs(a.y + a.h/2 - b.y - b.h/2) < (a.h + b.h)/2
    return col_y and col_x
end