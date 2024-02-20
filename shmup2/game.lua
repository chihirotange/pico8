function _init()
    printh("hello")
end

function _update60()
    update_all_objects()
end

function _draw()
    cls(1)
    draw_debug()
    draw_all_objects()
end

function draw_debug()
    text_debug("objs", count(all_objects))
end