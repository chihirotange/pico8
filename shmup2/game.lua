function _init()
    printh("hello")
end

function _update()
    ship:update()
end

function _draw()
    cls()
    ship:draw()
end