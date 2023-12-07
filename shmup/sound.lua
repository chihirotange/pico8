sound = {
    on_spaceship_shoot = function(self)
        sfx(0)
    end,
    on_spaceship_collides_enemy = function(self, enemy)
        sfx(1)
    end,
    on_bullet_collide_enemy = function(self)
        sfx(2)
    end
}