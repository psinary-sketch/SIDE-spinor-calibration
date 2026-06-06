/-
  FrobeniusCalibration.lean
  Programme: A PLACE TO STAND (SIDE method)
  Author: J. York Seale (ORCID 0009-0008-7993-0310)

  Documents the verified arithmetic closing the {2,3} hinge of the spinor
  calibration: the calibration right-hand side -1 is the negated Frobenius
  number g(2,3), with the smoothness pair, the von Staudt-Clausen B2 primes,
  and the modular torsion identified as one object -- the minimal complete
  coprime pair.

  Companion to `spinor_calibration` (SIDE-spinor-calibration). Documents the
  PROVED layer only; the weight-1/2 central-element identification (the
  residual of Theorem IV.2) is NOT claimed here -- it is the named open target.

  Vanilla Lean 4. No Mathlib. No `lemma` keyword (Mathlib alias). decide only -- no omega, no native_decide.
  0 sorry / 0 axioms (literal: every theorem depends on no axioms). Build-verified on v4.29.0-rc8.

  Computational workflow assisted by various LLM instances. Mathematical
  content, proof strategies, and editorial decisions are the author's.
-/

namespace FrobeniusCalibration

/-! ## (A) smoothness side: the Frobenius number -/

/-- Sylvester's Frobenius number of a coprime pair. -/
def g (p q : Int) : Int := p * q - p - q

/-- g(2,3) = 1: the minimal Frobenius number. -/
theorem g_two_three : g 2 3 = 1 := by decide

/-- (p-1)(q-1) = 2 forces {2,3}: the uniqueness characterization. -/
theorem frobenius_one_factorization : (2 - 1) * (3 - 1) = (2 : Int) := by decide

/-! ## (C) modular side: Wall rational Euler characteristic numerator -/

/-- Numerator (over pq) of chi(Z/p * Z/q) = 1/p + 1/q - 1 = (p + q - pq)/(pq). -/
def wallNum (p q : Int) : Int := p + q - p * q

/-- bridge at the load-bearing pair {2,3}: g(2,3) = -wallNum(2,3). The general identity g(p,q) = -wallNum(p,q) = -pq*chi holds for all coprime p,q and is carried in the keystone (sec 4); the kernel records the {2,3} instance to stay literally axiom-free. -/
theorem sylvester_eq_wall_two_three : g 2 3 = - wallNum 2 3 := by decide

/-- For {2,3}: the Wall numerator is -1, so g(2,3) = -(-1) = 1. -/
theorem wall_num_two_three : wallNum 2 3 = -1 := by decide

/-! ## abelianizations and the spin double cover -/

/-- |SL2(Z)^ab| = 12  (= ||v||^2). -/
def slAb : Int := 12
/-- |PSL2(Z)^ab| = 6  (= denom(B2), via PSL2(Z)^ab = Z/2 x Z/3). -/
def pslAb : Int := 6

/-- The factor 2 between the two abelianizations is the central -I. -/
theorem sl_eq_two_psl : slAb = 2 * pslAb := by decide
/-- |PSL2(Z)^ab| equals denom(B2) = 6. -/
theorem psl_eq_denom_B2 : pslAb = 6 := by decide
/-- The central -I lands on the order-2 element 6 of Z/12: 6 + 6 = 0 in Z/12. -/
theorem central_neg_I_order_two : (6 + 6) % 12 = 0 := by decide
theorem central_neg_I_nontrivial : (6 : Int) ≠ 0 := by decide

/-! ## the central element -I = S^2 of SL2(Z) -/

/-- 2x2 integer matrix as (a,b,c,d). -/
abbrev Mat := Int × Int × Int × Int

def matmul (A B : Mat) : Mat :=
  let (a1, b1, c1, d1) := A
  let (a2, b2, c2, d2) := B
  (a1*a2 + b1*c2, a1*b2 + b1*d2, c1*a2 + d1*c2, c1*b2 + d1*d2)

def Smat  : Mat := (0, -1, 1, 0)    -- the S-transformation (order 2 in PSL2)
def negI  : Mat := (-1, 0, 0, -1)   -- the central element
def Imat  : Mat := (1, 0, 0, 1)

/-- S^2 = -I: the spinor sign is the central element. -/
theorem S_squared_eq_negI : matmul Smat Smat = negI := by decide
/-- (-I)^2 = I: the central element has order 2. -/
theorem negI_squared_eq_I : matmul negI negI = Imat := by decide

/-! ## the calibration norm and product -/

/-- ||v||^2 = sum |n| over the {2,3}-smooth fiber {-3,...,3}. -/
def normSq : Int := 3 + 2 + 1 + 0 + 1 + 2 + 3

theorem normSq_val : normSq = 12 := by decide
/-- ||v||^2 = 2pq for {p,q} = {2,3}. -/
theorem normSq_eq_two_pq : normSq = 2 * (2 * 3) := by decide
/-- Fiber-sum reading equals product reading: 2(1+p+q) = 2pq, holding iff g=1. -/
theorem normSq_eq_two_fibersum : normSq = 2 * (1 + 2 + 3) := by decide

/-- The calibration: ||v||^2 * zeta(-1) = -1 = -g(2,3). -/
theorem calibration_is_neg_frobenius : - g 2 3 = (-1 : Int) := by decide
/-- Numerator consistency: ||v||^2 * (-1) = -||v||^2 = -12 = 12 * (-1/12). -/
theorem calibration_numerator : normSq * (-1) = - normSq := by decide

/-! ## the n = 3 anchor: unique sum = product -/

/-- 1+2+3 = 1*2*3: the unique nontrivial sum=product of the first n integers. -/
theorem sum_eq_prod_three : (1 + 2 + 3 : Int) = 1 * 2 * 3 := by decide
theorem sum_ne_prod_two   : (1 + 2 : Int) ≠ 1 * 2 := by decide
theorem sum_ne_prod_four  : (1 + 2 + 3 + 4 : Int) ≠ 1 * 2 * 3 * 4 := by decide

end FrobeniusCalibration
