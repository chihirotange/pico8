ui = entity:new({
    is_abstract = false,
    draw_order = 1000,
    x = 1,
    y = 1,
    score_ui = entity_txt:new(
        {
            is_abstract = false,
            x = 80,
            y = 1,
            update = function(_ENV)
                txt = "score: " .. player.score .. "000"
            end

        }
    ),
    draw = function(_ENV)
        -- player's lives
        for i = 1, player.max_lives do
            if (i <= player.current_lives) then
                spr(12, x + (i - 1) * 9, y)
            else
                spr(11, x + (i - 1) * 9, y)
            end
        end
        -- player's score
        score_ui:draw()
    end
})