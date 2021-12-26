if data.raw["combat-robot"]["bob-laser-robot"] then
  local bot = data.raw["combat-robot"]["bob-laser-robot"]
  bot.icon = "__reskins-bobs__/graphics/icons/warfare/robots/bob-laser-robot.png"
  bot.icon_size = 64
  bot.idle = {
    filename = "__reskins-bobs__/graphics/entity/warfare/laser-robot/bob-laser-robot.png",
    width = 32,
    height = 32,
    frame_count = 1,
    direction_count = 1,
    hr_version = {
      filename = "__reskins-bobs__/graphics/entity/warfare/laser-robot/hr-bob-laser-robot.png",
      width = 64,
      height = 64,
      frame_count = 1,
      direction_count = 1,
      scale = 0.5
    }
  }
  bot.shadow_idle = {
    filename = "__reskins-bobs__/graphics/entity/warfare/laser-robot/bob-laser-robot-shadow.png",
    width = 32,
    height = 32,
    frame_count = 1,
    direction_count = 1,
    draw_as_shadow = true,
    hr_version = {
      filename = "__reskins-bobs__/graphics/entity/warfare/laser-robot/hr-bob-laser-robot-shadow.png",
      width = 64,
      height = 64,
      frame_count = 1,
      direction_count = 1,
      draw_as_shadow = true,
      scale = 0.5
    }
  }
  bot.in_motion = bot.idle
  bot.shadow_in_motion = bot.shadow_idle
end
