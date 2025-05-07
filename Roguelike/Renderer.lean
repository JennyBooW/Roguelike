import Roguelike.Basic
import Roguelike.Entity
import Roguelike.Environment

/-
ASCII colors for pretty printing.
-/
namespace Colors

inductive Color where
  | Red    | Green | White
  | Black  | Blue  | Purple
  | Yellow | Gray  | Lapis
  | End

def Color.toString : Color → String
  | .Red    => "\x1b[31m"
  | .Green  => "\x1b[32m"
  | .White  => "\x1b[37m"
  | .Black  => "\x1b[30m"
  | .Blue   => "\x1b[34m"
  | .Purple => "\x1b[35m"
  | .Yellow => "\x1b[33m"
  | .Gray   => "\x1b[90m"
  | .Lapis  => "\x1b[94m"
  | .End    => "\x1b[0m"

instance : ToString Color where
  toString := Color.toString

def colored : Color → String → String
  | c, entity =>
    s!"{c}{entity}{Color.End}"

end Colors

namespace Render

open Entity in
open Colors in
def render_entity : Entity → String
  | entity =>
    match entity.t with
    | .Gob        => colored Color.Green  "g"
    | .Cork       => colored Color.Green  "C"
    | .Bogre      => colored Color.Green  "B"
    | .Demon      => colored Color.Red    "D"
    | .Necromance => colored Color.Yellow "N"
    | .Player     => colored Color.White  "@"
    | .Dead       => colored Color.Gray   "x"
    | .Structure  => colored Color.White  "█"
    | .Undead     => colored Color.Purple "U"
    | .Neutral    => colored Color.Blue   "@"
    | .Empty      =>                      " "

open World

-- Dirty
def render_world (world : World) : String := Id.run do
  let mut result := ""
  for i in world.entities do
    for j in i do
      result := result ++ render_entity j
    result := result ++ "\n"
  return result

def World.toString : World → String
  | w => render_world w

-- Testing
def empty_world := get_empty_world 3 3

end Render
