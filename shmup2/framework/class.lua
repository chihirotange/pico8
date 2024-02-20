--_G is global env variable
_G = _ENV
_G.__index = _G
all_objects = {}
all_collider_object = {}
pending_destroy_object = {}
pending_add_objects = {}

object_base = setmetatable ({
    x = 0,
    y = 0,
    col_enable = false,
    w = 8,
    h = 8,
    tags = {},
    init = function(self)
    end,
    on_overlap = function(self, other_obj)
    end,
    detect_collision = function(self)
        for obj in all(all_collider_object) do
            if col(self, obj) and not contains(pending_destroy_object, obj) then
                self:on_overlap(obj)
            end
        end
    end,
    update = function(self)
    end,
    destroy = function(self)
        self.pending_destroy = true
        add(pending_destroy_object, self)
    end
}, _G)
object_base.__index = object_base

update_all_objects = function()
    --add pending add to object list
    for pa_obj in all(pending_add_objects) do
        add(all_objects, pa_obj)
        if pa_obj.have_collider then
            add(all_collider_object, pa_obj)
        end
    end
    pending_add_objects = {}
    
    --destroy objects
    for pd_obj in all(pending_destroy_object) do
        del(all_objects, pd_obj)
        del(all_collider_object, pd_obj)
    end
    pending_destroy_object = {}
    -- collision update and object update
    for obj in all(all_objects) do
        obj:update()
    end 
    for obj in all(all_collider_object) do
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

function create_object(tbl, have_collider)
    local obj = tbl or {}
    setmetatable (obj, object_base)
    add(pending_add_objects, obj)
    obj:init()
    if have_collider then
        obj.have_collider = true
    end
    return obj
end