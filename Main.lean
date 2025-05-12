import Roguelike.Renderer
import Roguelike.Game

open Render in
def main : IO Unit :=
  IO.println (render_world empty_world)
