/-
Basic functions, structures and types for the game.
-/

structure Position where
  x : Nat
  y : Nat
deriving BEq

def Position.toString : Position → String
  | pos => s!"[{pos.x}, {pos.y}]"

instance : ToString Position where
  toString := Position.toString

inductive Direction where
  | N | NW | W | SW | S | SE | E | NE

def moveTo : Direction → Position → Position
  | .N,  p => ⟨ p.x,     p.y + 1 ⟩
  | .NW, p => ⟨ p.x + 1, p.y + 1 ⟩
  | .W,  p => ⟨ p.x + 1, p.y     ⟩
  | .SW, p => ⟨ p.x + 1, p.y - 1 ⟩
  | .S,  p => ⟨ p.x,     p.y - 1 ⟩
  | .SE, p => ⟨ p.x - 1, p.y - 1 ⟩
  | .E,  p => ⟨ p.x - 1, p.y     ⟩
  | .NE, p => ⟨ p.x + 1, p.y - 1 ⟩

def Direction.toString : Direction → String
  | .N  => "North"
  | .NW => "North-West"
  | .W  => "West"
  | .SW => "South-West"
  | .S  => "South"
  | .SE => "South-East"
  | .E  => "East"
  | .NE => "North-East"

instance : ToString Direction where
  toString := Direction.toString
