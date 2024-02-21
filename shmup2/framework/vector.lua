
                
function vector(x,y) return {x=x or 0,y=y or 0} end

function v_rnd() return vector(sin(rnd()), cos(rnd())) end

-- function v_cpy(v)     return vector(v.x,v.y,v.z) end
-- function v_unpck(v)   return v.x, v.y, v.z end
-- function v_arr(v)     return {v_unpck(v)} end
-- function v_tostr(v,d) return "["..v.x..", "..v.y..(d and ", "..v.z or "").."]" end
-- function v_isvec(v)   return type(v)=="table" and type(v.x)=="number" and type(v.y)=="number" and type(v.z)=="number" end
-- function v_eq(a,b)    return a.x==b.x and a.y==b.y and a.z==b.z end

function v_add(a,b) return vector( a.x+b.x,  a.y+b.y) end
-- function v_sub(a,b) return vector( a.x-b.x,  a.y-b.y,  a.z-b.z) end
function v_mul(v,n) return vector( v.x*n,    v.y*n) end
function v_div(v,n) return vector( v.x/n,    v.y/n) end
-- function v_neg(v)   return vector(-v.x,     -v.y,     -v.z    ) end

function v_dot(a,b)   return a.x*b.x+a.y*b.y end
-- function v_cross(a,b) return vector(a.y*b.z-b.y*a.z, a.z*b.x-b.z*a.x, a.x*b.y-a.y*b.x) end
function v_magsq(v)   return v_dot(v,v)          end
function v_mag(v)     return sqrt(v_magsq(v))    end
-- function v_dstsq(a,b) return v_magsq(v_sub(b,a)) end
-- function v_dst(a,b)   return sqrt(v_dstsq(a,b))  end
function v_norm(v)    return v_div(v,v_mag(v))   end
-- function v_perp(v)    return vector(v.y, -v.x)   end
-- function v_sprj(a,b)  return v_dot(a,v_norm(b))  end
-- function v_proj(a,b)  return v_scl(v_norm(b),v_sprj(a,b)) end

-- function v_rot(v,t)    local s,c=sin(v_ang(v)-t),cos(v_ang(v)-t) return vector(v.x*c+v.y*s, -(s*v.x)+c*v.y) end
-- function v_ang(v)      return atan2(v.x,v.y)    end
-- function v_atwds(a,b)  return v_ang(v_sub(b,a)) end

-- function v_lerp(a,b,t) return vector(a.x+(b.x-a.x)*t, a.y+(b.y-a.y)*t, a.z+(b.z-a.z)*t) end
-- function v_flr(v)      return vector(flr(v.x),flr(v.y),flr(v.z)) end

v_right=vector( 1, 0)
v_left =vector(-1, 0)
v_down =vector( 0, 1)
v_up   =vector( 0,-1)

-- v_front=vector( 0, 0, 1)
-- v_back =vector( 0, 0,-1)
-- v_above=v_cpy(v_down)
-- v_below=v_cpy(v_up  )

v_zero=vector()
-- v_one =vector(1,1)

-- v_cntr=vector(64,64)