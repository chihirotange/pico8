--_G is global env variable
_G = _ENV
_G.__index = _G
all_objects = {}
all_collider_object = {}
pool_objects = {}
pending_add_objects = {}

collider_bucket = {size = 10, prop = "loc"}

object_base = setmetatable ({
    loc = v_zero,
    col_enable = false,
    w = 8,
    h = 8,
    type, -- object MUST HAVE type to be able to spawn from pool
    tags = {},
    init = function(self)
    end,
    on_overlap = function(self, other_obj)
    end,
    detect_collision = function(self)
        local _ENV = self
        for i in all(bget(collider_bucket, loc)) do
            if col(self,i) and not i.pending_destroy and not self.pending_destroy then
                printh(self.type)
                printh(i.type)
                i:on_overlap(self)
            end
        end   
    end,
    update = function(self)
    end,
    destroy = function(self)
        self.pending_destroy = true
    end,
    draw = function(self)

    end
}, _G)
object_base.__index = object_base

update_all_objects = function()
    for i = #all_objects, 1, -1 do
        obj = all_objects[i]
        if obj.pending_destroy then
            -- obj.pending_destroy = false
            add(pool_objects, obj)
            del(all_objects, obj)
            goto continue
        end
        
        obj:update();
        if obj.have_collider then 
            bstore(collider_bucket, obj)
            obj:detect_collision()
        end
        ::continue::
    end
    for pa_obj in all(pending_add_objects) do
        add(all_objects, pa_obj)
        pa_obj:init()
        pa_obj.pending_destroy = false
        -- if pa_obj.have_collider then
        --     add(all_collider_object, pa_obj)
        -- end
    end
    pending_add_objects = {}
    -- for obj in all(all_objects) do
    --     if obj.pending_destroy then
    --         obj.pending_destroy = false
    --         add(pool_objects, obj)
    --     end
    -- end
    -- add pending add to object list
    -- for pd_obj in all(pool_objects) do
    --     del(all_objects, pd_obj)
    --     del(all_collider_object, pd_obj)
    --     pd_obj = nil
    -- end
    -- pool_objects = {}
    
    -- for obj in all(all_objects) do
    --     if not obj.pending_destroy then
    --         obj:update()
    --     end
    -- end 
    -- for obj in all(all_collider_object) do
    --     if not obj.pending_destroy then
    --         bstore(collider_bucket, obj)
    --         obj:detect_collision()
    --     end
    -- end
    
end

draw_all_objects = function()
    for obj in all(all_objects) do
        if not obj.pending_destroy then
            obj:draw()
        end
    end 
end

function create_object(tbl, have_collider)
    local sp_obj = tbl or {}
    -- check if available in pool 
    for obj in all(pool_objects) do
        if obj.type == tbl.type then
            sp_obj = obj
            del(pool_objects, obj)
            goto continue
        end
    end
    ::continue::
    setmetatable (sp_obj, object_base)
    add(pending_add_objects, sp_obj)
    if have_collider then
        sp_obj.have_collider = true
    end
    return sp_obj
end