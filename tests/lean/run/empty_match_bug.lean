open nat

inductive Fin : nat → Type :=
| fz : Π n, Fin (succ n)
| fs : Π {n}, Fin n → Fin (succ n)

open Fin

definition case0 {C : Fin zero → Type} (f : Fin zero) : C f :=
match f with
end
