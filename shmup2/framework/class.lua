--_G is global env variable
_G = _ENV
_G.__index = _G
local all_objects = {}
local pending_destroy_objects = {}

object_base = setmetatable ({
    x = 0,
    y = 0,
    w = 8,
    h = 8,
    tags = {},
    init = function(self)
    end,
    on_overlap = function(self, other_obj)
    end,
    detect_collision = function(self)
        for obj in all(all_objects) do
            if col(self, obj) then
                self:on_overlap(obj)
                obj:on_overlap(self)
            end
        end
    end,
    update = function(self)
    end,
    destroy = function(self)
        add(pending_destroy_objects, self)
    end
}, _G)
object_base.__index = object_base


update_all_objects = function()
    --destroy objects
    for pd_obj in all(pending_destroy_objects) do
        del(all_objects, pd_obj)
    end
    -- clear table
    pending_destroy_objects = {}

    -- collision update and object update
    for obj in all(all_objects) do
        obj:update()
        obj:detect_collision()
    end 
end

draw_all_objects = function()
    for obj in all(all_objects) do
        if obj.draw ~= nil then
            obj:draw()
        end
    end 
end

function create_object(tbl)
    local obj = tbl or {}
    setmetatable (obj, object_base)
    obj:init()
    add(all_objects, obj)
    return obj
end