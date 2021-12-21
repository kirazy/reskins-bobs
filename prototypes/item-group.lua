local group = data.raw ["item-group"]

if group["bob-logistics"] and group["logistics"] then
  group["bob-logistics"].icon = "__reskins-bobs__/graphics/item-group/bob-logistics.png"
  group["bob-logistics"].icon_size = 128

  group["logistics"].icon = "__reskins-bobs__/graphics/item-group/logistics.png"
  group["logistics"].icon_size = 128
end

if group["bob-fluid-products"] then
  group["bob-fluid-products"].icon = "__reskins-bobs__/graphics/item-group/bob-fluid-products.png"
  group["bob-fluid-products"].icon_size = 128
end

if group["bob-resource-products"] then
  group["bob-resource-products"].icon = "__reskins-bobs__/graphics/item-group/bob-resource-products.png"
  group["bob-resource-products"].icon_size = 128
end

if group["bob-intermediate-products"] and group["intermediate-products"] then
  group["bob-intermediate-products"].icon = "__reskins-bobs__/graphics/item-group/bob-intermediate-products.png"
  group["bob-intermediate-products"].icon_size = 128

  group["intermediate-products"].icon = "__reskins-bobs__/graphics/item-group/intermediate-products.png"
  group["intermediate-products"].icon_size = 128
end

if group["bob-gems"] then
  group["bob-gems"].icon = "__reskins-bobs__/graphics/item-group/bob-gems.png"
  group["bob-gems"].icon_size = 128
end
