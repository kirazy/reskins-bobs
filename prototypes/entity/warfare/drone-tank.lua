local function reskin_tank_drone_animation(scale, tint)
  local hr_versions = true
  if scale <= 0.5 then
    hr_versions = false --disable hr_versions when drone is too small
  end

  local layerbase = {
    width = 136,
    height = 106,
    frame_count = 2,
    direction_count = 64,
    shift = util.by_pixel(scale * 0, scale * -10),
    animation_speed = 0.1,
    max_advance = 1,
    stripes = {
      {
        filename = "__base__/graphics/entity/tank/tank-base-1.png",
        width_in_frames = 2,
        height_in_frames = 16
      },
      {
        filename = "__base__/graphics/entity/tank/tank-base-2.png",
        width_in_frames = 2,
        height_in_frames = 16
      },
      {
        filename = "__base__/graphics/entity/tank/tank-base-3.png",
        width_in_frames = 2,
        height_in_frames = 16
      },
      {
        filename = "__base__/graphics/entity/tank/tank-base-4.png",
        width_in_frames = 2,
        height_in_frames = 16
      }
    },
    scale = scale,
    hr_version = hr_versions and {
      width = 270,
      height = 212,
      frame_count = 2,
      direction_count = 64,
      shift = util.by_pixel(scale * 0, scale * -10),
      animation_speed = 0.1,
      max_advance = 1,
      stripes = {
        {
          filename = "__base__/graphics/entity/tank/hr-tank-base-1.png",
          width_in_frames = 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/tank/hr-tank-base-2.png",
          width_in_frames = 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/tank/hr-tank-base-3.png",
          width_in_frames = 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/tank/hr-tank-base-4.png",
          width_in_frames = 2,
          height_in_frames = 16
        }
      },
      scale = scale * 0.5,
    } or nil
  }

  local layermask = {
    width = 104,
    height = 83,
    frame_count = 2,
    tint = tint,
    direction_count = 64,
    shift = util.by_pixel(scale * 0, scale * -21.5),
    max_advance = 1,
    line_length = 2,
    stripes = util.multiplystripes
    (
      2,
      {
        {
          filename = "__base__/graphics/entity/tank/tank-base-mask-1.png",
          width_in_frames = 1,
          height_in_frames = 22
        },
        {
          filename = "__base__/graphics/entity/tank/tank-base-mask-2.png",
          width_in_frames = 1,
          height_in_frames = 22
        },
        {
          filename = "__base__/graphics/entity/tank/tank-base-mask-3.png",
          width_in_frames = 1,
          height_in_frames = 20
        }
      }
    ),
    scale = scale,
    hr_version = hr_versions and {
      width = 208,
      height = 166,
      frame_count = 2,
      tint = tint,
      direction_count = 64,
      shift = util.by_pixel(scale * 0, scale * -21.5),
      max_advance = 1,
      line_length = 2,
      stripes = util.multiplystripes
      (
        2,
        {
          {
            filename = "__base__/graphics/entity/tank/hr-tank-base-mask-1.png",
            width_in_frames = 1,
            height_in_frames = 22
          },
          {
            filename = "__base__/graphics/entity/tank/hr-tank-base-mask-2.png",
            width_in_frames = 1,
            height_in_frames = 22
          },
          {
            filename = "__base__/graphics/entity/tank/hr-tank-base-mask-3.png",
            width_in_frames = 1,
            height_in_frames = 20
          }
        }
      ),
      scale = scale * 0.5,
    } or nil
  }

  local layertoploop1 = {}
  for i=1,64 do
    table.insert(layertoploop1, {
      filename = "__reskins-bobs__/graphics/entity/warfare/drone-tank/drone-tank-top.png",
      width_in_frames = 1,
      height_in_frames = 1
    })
  end

  local layertoploop2 = {}
  for i=1,64 do
    table.insert(layertoploop2, {
      filename = "__reskins-bobs__/graphics/entity/warfare/drone-tank/hr-drone-tank-top.png",
      width_in_frames = 1,
      height_in_frames = 1
    })
  end

  local layertoplightloop1 = {}
  for i=1,64 do
    table.insert(layertoplightloop1, {
      filename = "__reskins-bobs__/graphics/entity/warfare/drone-tank/drone-tank-top-light.png",
      width_in_frames = 1,
      height_in_frames = 1
    })
  end

  local layertoplightloop2 = {}
  for i=1,64 do
    table.insert(layertoplightloop2, {
      filename = "__reskins-bobs__/graphics/entity/warfare/drone-tank/hr-drone-tank-top-light.png",
      width_in_frames = 1,
      height_in_frames = 1
    })
  end

  local layertop = {
    --filename = "__reskins-bobs__/graphics/entity/warfare/drone-tank/drone-tank-top.png",
    stripes = util.multiplystripes
    (
      2,
      layertoploop1
    ),
    width = 49,
    height = 83,
    frame_count = 2,
    direction_count = 64,
    --repeat_count = 64,
    shift = util.by_pixel(scale * 0, scale * -10),
    max_advance = 1,
    scale = scale,
    hr_version = hr_versions and {
      --filename = "__reskins-bobs__/graphics/entity/warfare/drone-tank/hr-drone-tank-top.png",
      stripes = util.multiplystripes
      (
        2,
        layertoploop2
      ),
      width = 98,
      height = 166,
      frame_count = 2,
      direction_count = 64,
      --repeat_count = 64,
      shift = util.by_pixel(scale * 0, scale * -10),
      max_advance = 1,
      scale = scale * 0.5,
    } or nil
  }

  local layertoplight = {
    --filename = "__reskins-bobs__/graphics/entity/warfare/drone-tank/drone-tank-top.png",
    stripes = util.multiplystripes
    (
      2,
      layertoplightloop1
    ),
    draw_as_glow = true,
    tint = tint,
    width = 49,
    height = 83,
    frame_count = 2,
    direction_count = 64,
    --repeat_count = 64,
    shift = util.by_pixel(scale * 0, scale * -10),
    max_advance = 1,
    scale = scale,
    hr_version = hr_versions and {
      --filename = "__reskins-bobs__/graphics/entity/warfare/drone-tank/hr-drone-tank-top.png",
      stripes = util.multiplystripes
      (
        2,
        layertoplightloop2
      ),
      draw_as_glow = true,
      tint = tint,
      width = 98,
      height = 166,
      frame_count = 2,
      direction_count = 64,
      --repeat_count = 64,
      shift = util.by_pixel(scale * 0, scale * -10),
      max_advance = 1,
      scale = scale * 0.5,
    } or nil
  }

  local layershadow = {
    width = 151,
    height = 98,
    frame_count = 2,
    draw_as_shadow = true,
    direction_count = 64,
    shift = util.by_pixel(scale * 22.5, scale * 7),
    max_advance = 1,
    stripes = util.multiplystripes
    (
      2,
      {
        {
          filename = "__base__/graphics/entity/tank/tank-base-shadow-1.png",
          width_in_frames = 1,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/tank/tank-base-shadow-2.png",
          width_in_frames = 1,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/tank/tank-base-shadow-3.png",
          width_in_frames = 1,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/tank/tank-base-shadow-4.png",
          width_in_frames = 1,
          height_in_frames = 16
        }
      }
    ),
    scale = scale,
    hr_version = hr_versions and {
      width = 302,
      height = 194,
      frame_count = 2,
      draw_as_shadow = true,
      direction_count = 64,
      shift = util.by_pixel(scale * 22.5, scale * 7),
      max_advance = 1,
      stripes = util.multiplystripes
      (
        2,
        {
          {
            filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-1.png",
            width_in_frames = 1,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-2.png",
            width_in_frames = 1,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-3.png",
            width_in_frames = 1,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-4.png",
            width_in_frames = 1,
            height_in_frames = 16
          }
        }
      ),
      scale = scale * 0.5,
    } or nil
  }

  return
  {
    layers =
    {
      layerbase,
      layermask,
      layertop,
      layertoplight,
      layershadow,
    }
  }
end

local tint_drone_gun = {r = 1, g = 1, b = 0.5}
local tint_drone_laser = {r = 0.5, g = 0.8, b = 0.6}
local tint_drone_flamethrower = {r = 1, g = 0.6, b = 0.5}
local tint_drone_plasma = {r = 0.5, g = 0.8, b = 1}

if data.raw.unit["bob-robot-gun-drone"] then
  data.raw.unit["bob-robot-gun-drone"].attack_parameters.animation = reskin_tank_drone_animation(0.5, tint_drone_gun)
  data.raw.unit["bob-robot-gun-drone"].run_animation = reskin_tank_drone_animation(0.5, tint_drone_gun)
  data.raw.unit["bob-robot-gun-drone"].rotation_speed = 0.015
  data.raw.unit["bob-robot-gun-drone"].attack_parameters.projectile_center = {0, 5}
  data.raw.unit["bob-robot-gun-drone"].attack_parameters.projectile_creation_distance = 0.2

  data.raw.unit["bob-robot-gun-drone"].icon = "__reskins-bobs__/graphics/icons/warfare/drone-tank/bob-robot-gun-drone.png"
  data.raw.unit["bob-robot-gun-drone"].icon_size = 64
end

if data.raw.unit["bob-robot-laser-drone"] then
  data.raw.unit["bob-robot-laser-drone"].attack_parameters.animation = reskin_tank_drone_animation(0.5, tint_drone_laser)
  data.raw.unit["bob-robot-laser-drone"].run_animation = reskin_tank_drone_animation(0.5, tint_drone_laser)
  data.raw.unit["bob-robot-laser-drone"].rotation_speed = 0.015
  data.raw.unit["bob-robot-laser-drone"].attack_parameters.source_offset = {0, -0.5}

  data.raw.unit["bob-robot-laser-drone"].icon = "__reskins-bobs__/graphics/icons/warfare/drone-tank/bob-robot-laser-drone.png"
  data.raw.unit["bob-robot-laser-drone"].icon_size = 64
end

if data.raw.unit["bob-robot-flamethrower-drone"] then
  data.raw.unit["bob-robot-flamethrower-drone"].attack_parameters.animation = reskin_tank_drone_animation(0.5, tint_drone_flamethrower)
  data.raw.unit["bob-robot-flamethrower-drone"].run_animation = reskin_tank_drone_animation(0.5, tint_drone_flamethrower)
  data.raw.unit["bob-robot-flamethrower-drone"].rotation_speed = 0.015
  data.raw.unit["bob-robot-flamethrower-drone"].attack_parameters.gun_center_shift = {0, -0.5}

  data.raw.unit["bob-robot-flamethrower-drone"].icon = "__reskins-bobs__/graphics/icons/warfare/drone-tank/bob-robot-flamethrower-drone.png"
  data.raw.unit["bob-robot-flamethrower-drone"].icon_size = 64
end

if data.raw.unit["bob-robot-plasma-drone"] then
  data.raw.unit["bob-robot-plasma-drone"].attack_parameters.animation = reskin_tank_drone_animation(0.75, tint_drone_plasma)
  data.raw.unit["bob-robot-plasma-drone"].run_animation = reskin_tank_drone_animation(0.75, tint_drone_plasma)
  data.raw.unit["bob-robot-plasma-drone"].rotation_speed = 0.007
  data.raw.unit["bob-robot-plasma-drone"].attack_parameters.projectile_center = {0, -0.5}
  data.raw.unit["bob-robot-gun-drone"].attack_parameters.projectile_creation_distance = 0

  data.raw.unit["bob-robot-plasma-drone"].icon = "__reskins-bobs__/graphics/icons/warfare/drone-tank/bob-robot-plasma-drone.png"
  data.raw.unit["bob-robot-plasma-drone"].icon_size = 64
end
