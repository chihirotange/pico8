-- @TODO OPTIMIZE COLLIDER DETECTION LOGICS (QUADTREE)
function col(a,b)
    if (a == b) then
        return false
    end
    col_x = abs(a.loc.x + a.w/2 - b.loc.x - b.w/2) < (a.w + b.w)/2
    col_y = abs(a.loc.y + a.h/2 - b.loc.y - b.h/2) < (a.h + b.h)/2
    return col_y and col_x
end



-- bucket hash lib - by github.com/selfsame

_9 = {}
function point(x,y) return {x=x,y=y} end
for x=-1,1 do for y=-1,1 do add(_9,point(x,y)) end end
function p_str(p) return p.x..","..p.y end
function coords(p, s) return point(flr(p.x*(1/s)),flr(p.y*(1/s))) end

function str_p(s)
  for i=1,#s do if sub(s,i,i) == "," then
    return point(sub(s, 1, i-1)+0, sub(s, i+1, #s)+0)
end end end

function badd(k,e,_b)
  _b[k] = _b[k] or {} 
  add(_b[k], e)
end

function bstore(_b,e)
  local p = p_str(coords(e[_b.prop],_b.size))
  local k = e._k
  if k then
    if (k != p) then
      local b = _b[k]
      del(b,e)
      if (#b == 0) _b[k]=nil
      badd(p,e,_b)
    end
  else badd(p,e,_b) end
  e._k = p
end

function bget(_b, p)
  local p = coords(p, _b.size)
  local _ = {}
  for o in all(_9) do
    local found = _b[p_str(point(p.x+o.x,p.y+o.y))]
    if found then for e in all(found) do add(_,e) end end
  end
  return _
end


-- usage
-- create a data 'store' {size=30,prop="pos"}
-- store.prop should match your entities' position property name, 
-- which should be a 'point' value like {x=0,y=0}
-- store.size should be tuned to the max neighbor distance you'll be finding

-- periodically call bstore(store, entity) to update their bucket membership

-- bget(store, point) returns stored entities from a 3x3 square of buckets around 
-- the given point, filter these by a distance function if you need more precision

-- remember you can maintain multiple stores based on the needs of your game!


-- demo

-- bugstore = {size=20,prop="loc"}
-- cam = point(0,0)
-- bugs = {}

-- function vmul(v, n) return point(v.x*n, v.y*n) end

-- function pline(a,b,color) line(a.x,a.y,b.x,b.y,color) end

-- function bug() return {pos=point(rnd(300),rnd(300))} end

-- function wander(e)
--   e.pos.x += rnd(4)-2
--   e.pos.y += rnd(4)-2
-- end

-- function show_neighbors(me)
--   for e in all(bget(bugstore,me.pos)) do
--     if (e != me) then
--       pline(me.pos,e.pos, 5)
--     end
--   end
-- end


-- for i=1,100 do 
--   add(bugs,bug()) 
-- end

-- function _update60()
--   if btn(0) then cam.x -= 2 end
--   if btn(1) then cam.x += 2 end
--   if btn(2) then cam.y -= 2 end
--   if btn(3) then cam.y += 2 end
--   foreach(bugs,wander)
--   for e in all(bugs) do
--     bstore(bugstore, e)
--   end
-- end

-- function _draw()
--   cls()
--   camera(cam.x,cam.y)
--   for k,v in pairs(bugstore) do -- bucket visualization
--     if(type(v) == "table") then
--       p = vmul(str_p(k),bugstore.size)
--       print(#v,p.x+2,p.y+2)
--       rect(p.x,p.y,p.x+bugstore.size,p.y+bugstore.size,1)
--     end
--   end
--   foreach(bugs,show_neighbors)
--   for e in all(bugs) do
--     spr(0,e.pos.x,e.pos.y,1,1)
--   end
-- end