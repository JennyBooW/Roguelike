import Roguelike.Basic
import Roguelike.Entity
import Roguelike.Environment

namespace Game

structure gameState where
  todo : String

open Entity
def move : Entity → Direction → Entity
  | entity, direction =>
    { entity with pos := moveTo direction entity.pos}

-- Testing
#eval (move (get_enemy_gob ⟨ 1, 1 ⟩ 1) Direction.N).pos
