explosion = entity_spr_pool:new( {
    pool_id = "explosion",
    sprid = 64,
    draw_order = 100,
    explode_time = 10,
    w = 16,
    h = 16,
    update = function(_ENV)
        if reuse_ready == true then return end
        explode_time = max(0, explode_time - 1)
        if explode_time <= 0 then
            _ENV:_return_pool()
            printh("returned to pool")
            explode_time = 30
        end
    end
})