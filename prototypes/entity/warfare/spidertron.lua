local spidertrons = {
  "antron",
  "tankotron",
  "logistic-spidertron",
  "heavy-spidertron"
}

for _,name in pairs(spidertrons) do
  if data.raw["spider-vehicle"][name] then
    data.raw["spider-vehicle"][name].icon = "__reskins-bobs__/graphics/icons/warfare/spidertron/" .. name .. ".png"
    data.raw["spider-vehicle"][name].icon_size = 64
  end
end

if data.raw["spider-vehicle"]["tankotron"] then
  data.raw["spider-vehicle"]["tankotron"].graphics_set.animation = {
    layers = {
      {
        filename = "__base__/graphics/entity/tank/tank-turret.png",
        width = 90,
        height = 67,
        line_length = 8,
        direction_count = 64,
        shift = util.by_pixel(0, -9),
        hr_version = {
          filename = "__base__/graphics/entity/tank/hr-tank-turret.png",
          width = 179,
          height = 132,
          line_length = 8,
          direction_count = 64,
          scale = 0.5,
          shift = util.by_pixel(0, -9)
        }
      },
      --[[{
        filename = "__base__/graphics/entity/tank/tank-turret-mask.png",
        width = 36,
        height = 33,
        line_length = 8,
        direction_count = 64,
        apply_runtime_tint = true,
        shift = util.by_pixel(0, -10),
        hr_version = {
          filename = "__base__/graphics/entity/tank/hr-tank-turret-mask.png",
          width = 72,
          height = 66,
          line_length = 8,
          direction_count = 64,
          scale = 0.5,
          apply_runtime_tint = true,
          shift = util.by_pixel(0, -10)
        }
      },]]
      {
        filename = "__base__/graphics/entity/spidertron/torso/spidertron-body.png",
        width = 66,
        height = 70,
        line_length = 8,
        direction_count = 64,
        scale = 0.8,
        shift = util.by_pixel(0 * 0.8, -25 * 0.8),
        hr_version =
        {
          filename = "__base__/graphics/entity/spidertron/torso/hr-spidertron-body.png",
          width = 132,
          height = 138,
          line_length = 8,
          direction_count = 64,
          scale = 0.5 * 0.8,
          shift = util.by_pixel(0 * 0.8, -25 * 0.8)
        }
      },
      {
        filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-mask.png",
        width = 66,
        height = 50,
        line_length = 8,
        direction_count = 64,
        scale = 0.8,
        apply_runtime_tint = true,
        shift = util.by_pixel(0 * 0.8, -20 * 0.8),
        hr_version =
        {
          filename = "__base__/graphics/entity/spidertron/torso/hr-spidertron-body-mask.png",
          width = 130,
          height = 100,
          line_length = 8,
          direction_count = 64,
          scale = 0.5 * 0.8,
          apply_runtime_tint = true,
          shift = util.by_pixel(0 * 0.8, -20 * 0.8)
        }
      }
    }
  }
  data.raw["spider-vehicle"]["tankotron"].torso_rotation_speed = 0.02
  data.raw["spider-vehicle"]["tankotron"].drawing_box = {{-3 * 0.8, -4 * 0.8}, {3 * 0.8, 0 * 0.8}}

end

if data.raw.gun["spidertron-gatling-gun"] then
  data.raw.gun["spidertron-gatling-gun"].attack_parameters.projectile_center = {0, 2.3}
  data.raw.gun["spidertron-gatling-gun"].attack_parameters.projectile_creation_distance = 1.5
  data.raw.gun["spidertron-gatling-gun"].attack_parameters.projectile_orientation_offset = 1
end

if data.raw.gun["spidertron-cannon-1"] then
  data.raw.gun["spidertron-cannon-1"].attack_parameters.projectile_center = {0.3, 2}
  data.raw.gun["spidertron-cannon-1"].attack_parameters.projectile_creation_distance = 1.65
  data.raw.gun["spidertron-cannon-1"].attack_parameters.projectile_orientation_offset = 0 -- -1.65
end

if data.raw.gun["spidertron-cannon-2"] then
  data.raw.gun["spidertron-cannon-2"].attack_parameters.projectile_center = {-0.3, 2}
  data.raw.gun["spidertron-cannon-2"].attack_parameters.projectile_creation_distance = 1.65 -- 1.65
  data.raw.gun["spidertron-cannon-2"].attack_parameters.projectile_orientation_offset = 0 -- -1.65
end


--[[ turns out the game is bugged https://forums.factorio.com/viewtopic.php?f=28&t=100458&p=555629&hilit=source_offset#p555629
--if data.raw.gun["laser-rifle"] then
  --data.raw.gun["laser-rifle"].attack_parameters.source_direction_count = 64
  data.raw.gun["laser-rifle"].attack_parameters.source_offset = {60, 60}
  data.raw.gun["laser-rifle"].attack_parameters.source_offset = {0, -1.31439 }
  data.raw.gun["laser-rifle"].attack_parameters =
    {
      type = "beam",
      ammo_category = "laser-rifle",
      cooldown = 20,
      movement_slow_down_factor = 0.5,
      damage_modifier = 1.2,
      source_offset = {0, -1.31439},
      range = 20,
    }
--end

if data.raw.beam["bob-laser-beam-topaz-ammo"] then
  --data.raw.beam["bob-laser-beam-topaz-ammo"].head.shift = {-1,0}
  --data.raw.beam["bob-laser-beam-topaz-ammo"].body[1].shift = {-1,0}
end
]]
