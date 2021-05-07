(add-pvar-name "A" "B" "C" (make-arity))
(add-pvar-name "R" (make-arity (py "alpha")))
(add-var-name "x" (py "alpha"))

(set-goal (pf "(A -> B -> C) -> (A -> B) -> A -> C"))
(assume "u" "v" "w")
(use "u")
(use "w")
(use "v")
(cdp)

(set-goal (pf "A -> B -> A"))
(assume "u" "v")
(use "u")
(cdp)

(set-goal (pf "A & B -> A"))
(assume "u")
(use "u")
(cdp)

(set-goal (pf "A & B -> B"))
(assume "u")
(use "u")
(cdp)

(set-goal (pf "A -> B -> A & B"))
(assume "u" "w")
(split)
(use "u")
(use "v")
(cdp)

(set-goal (pf "A -> A ord B"))
(assume "a")
(intro 0)
(use "a")
(cdp)

(set-goal (pf "B -> A ord B"))
(assume "b")
(intro 1)
(use "b")
(cdp)

(set-goal (pf "(A -> C) -> (B -> C) -> A ord B -> C"))
(assume "u" "v" "w")
(elim "w")
(use "u")
(use "v")
(cdp)

(set-goal (pf "all x (R x) -> ex x (R x)"))
(assume "u")
(ex-intro (pt "x"))
(use "u" (pt "x"))
(cdp)

(set-goal (pf "all x (B -> (R x)) -> (B -> all x (R x))"))
(assume "u")
(assume "b")
(assume "x")
(use "u" (pt "x"))
(use "b")
(cdp)

(set-goal (pf "A -> A"))
(assume "a")
(use "a")
(cdp)

(set-goal (pf "all x (A -> B) -> ex x A -> B"))
(assume "u" "v")
(ex-elim "v")
(assume "x" "w")
(use "u" (pt "x"))
(use "w")
(cdp)

(set-goal (pf "all x ((R x) -> B) -> (ex x (R x) -> B)"))
(assume "u" "v")
(ex-elim "v")
(assume "x" "w")
(use "u" (pt "x"))
(use "w")
(cdp)

(set-goal (pf "F -> A"))
(assume "f")
(use "Stab")
(assume "u")
(use "f")
(cdp)

(set-goal (pf "F -> A"))
(use "Efq")
(cdp)

(set-goal (pf "((A -> F) -> F) -> A"))
(use "Stab")
(cdp)
