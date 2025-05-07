import Roguelike.Basic

/-
Simple entity type and additional util functions.
-/

namespace Entity

inductive EntityType where
  | Structure
  | Player
  | Gob | Cork | Bogre | Necromance | Demon
  | Neutral
  | Dead   | Undead
  | Empty

structure Entity where
  name   : String
  t      : EntityType
  pos    : Position
  hp     : Nat
  attack : Nat

def empty (pos : Position) : Entity where
  name   := ""
  t      := EntityType.Empty
  pos    := pos
  hp     := 1
  attack := 0

def get_player (center : Position) : Entity where
  name   := "Player"
  t      := EntityType.Player
  pos    := center
  hp     := 100
  attack := 4

def get_enemy_gob (pos : Position) (i : Nat) : Entity where
  name   := s!"Gob {i}"
  t      := EntityType.Gob
  pos    := pos
  hp     := 1
  attack := 1

def get_enemy_cork (pos : Position) (i : Nat) : Entity where
  name   := s!"Cork {i}"
  t      := EntityType.Cork
  pos    := pos
  hp     := 3
  attack := 2

def get_enemy_bogre (pos : Position) (i : Nat) : Entity where
  name   := s!"Bogre {i}"
  t      := EntityType.Bogre
  pos    := pos
  hp     := 5
  attack := 4

def get_enemy_demon (pos : Position) (i : Nat) : Entity where
  name   := s!"Demon {i}"
  t      := EntityType.Demon
  pos    := pos
  hp     := 8
  attack := 5

def get_enemy_necro (pos : Position) (i : Nat) : Entity where
  name   := s!"Necro {i}"
  t      := EntityType.Necromance
  pos    := pos
  hp     := 5
  attack := 1

def get_structure (pos : Position) (i : Nat) : Entity where
  name   := s!"Structure {i}"
  t      := EntityType.Structure
  pos    := pos
  hp     := 999999
  attack := 0

def get_entity (name : String) (t : EntityType)
  (pos : Position) (hp : Nat) (attack : Nat) :
  Entity where
    name   := name
    t      := t
    pos    := pos
    hp     := hp
    attack := attack

end Entity
