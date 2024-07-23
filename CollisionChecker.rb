require 'ruby2d'
require_relative 'CommonParameter'
#require_relative 'GameMap'

module CCHECK
  def checkTile(entity, map)
    entityLeftWorldX = entity.worldX + entity.solidArea.x 
    entityRightWorldX = entity.worldX + entity.solidArea.x + entity.solidArea.width
    entityTopWorldY = entity.worldY + entity.solidArea.y 
    entityBottomWorldY = entity.worldY + entity.solidArea.y + entity.solidArea.height

    entityLeftCol = entityLeftWorldX / CP::TILE_SIZE
    entityRightCol = entityRightWorldX / CP::TILE_SIZE
    entityTopRow = entityTopWorldY / CP::TILE_SIZE
    entityBottomRow = entityBottomWorldY / CP::TILE_SIZE

    tileNum1 = nil
    tileNum2 = nil

    if entity.upDirection == true
      entityTopRow = (entityTopWorldY - entity.speed) / CP::TILE_SIZE
      tileNum1 = map.tileManager[entityTopRow][entityLeftCol]
      tileNum2 = map.tileManager[entityTopRow][entityRightCol]
      if(map.tile[tileNum1].isSolid == true || map.tile[tileNum2].isSolid == true)
          entity.collisionOn = true
      end

    elsif entity.downDirection == true
      entityBottomRow = (entityBottomWorldY + entity.speed) / CP::TILE_SIZE
      tileNum1 = map.tileManager[entityBottomRow][entityLeftCol]
      tileNum2 = map.tileManager[entityBottomRow][entityRightCol]
      if(map.tile[tileNum1].isSolid == true || map.tile[tileNum2].isSolid == true)
          entity.collisionOn = true
      end

    elsif entity.leftDirection == true
      entityLeftCol = (entityLeftWorldX - entity.speed) / CP::TILE_SIZE
      tileNum1 = map.tileManager[entityTopRow][entityLeftCol]
      tileNum2 = map.tileManager[entityBottomRow][entityLeftCol]
      if(map.tile[tileNum1].isSolid == true || map.tile[tileNum2].isSolid == true)
          entity.collisionOn = true
      end

    elsif entity.rightDirection == true
      entityRightCol = (entityRightWorldX + entity.speed) / CP::TILE_SIZE
      tileNum1 = map.tileManager[entityTopRow][entityRightCol]
      tileNum2 = map.tileManager[entityBottomRow][entityRightCol]
      if(map.tile[tileNum1].isSolid == true || map.tile[tileNum2].isSolid == true)
          entity.collisionOn = true
      end
    end
  end
end





