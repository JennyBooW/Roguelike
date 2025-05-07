import Roguelike.Basic
import Roguelike.Entity

/-
World structures that is really is just a map of the game world.
-/

namespace World

open Entity

abbrev Entites := Array (Array Entity)

structure World where
  width    : Nat
  height   : Nat
  entities : Entites

def get_world (width : Nat) (height : Nat) (entities : Entites) : World where
  width    := width
  height   := height
  entities := entities

def get_center : World → Position
  | w => ⟨ w.width / 2, w.height / 2  ⟩

def get_empty_entites (width : Nat) (height : Nat) : Entites := Id.run do
  let mut inner : Array Entity := #[]
  let mut outer : Entites := #[]

  for i in [0:width] do
    for j in [0:height] do
      inner := inner ++ #[ empty ⟨ i, j ⟩ ]
    outer := outer ++ #[ inner ]
    inner := #[]
  return outer

def get_empty_world (w : Nat) (h : Nat) : World where
  width     := w
  height    := h
  entities  := get_empty_entites w h

end World
