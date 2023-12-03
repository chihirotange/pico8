sound = {
    on_spaceship_shoot = function(self)
        sfx(0)
    end,
    on_spaceship_collides_enemy = function(self, enemy)
        sfx(1)
    end
}