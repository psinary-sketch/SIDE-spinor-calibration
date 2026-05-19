# SIDE-spinor-calibration v0.1

The arithmetic skeleton of the **Spinor Calibration**:

```
‖v‖² · ζ(-1) = -1
```

The Plancherel-restricted identity for the {2,3}-smooth Trivium fiber under the Γ₀(4)-equivariant projection from S₁/₂(Γ₀(4), χ_θ).

## Status

| | |
|---|---|
| Toolchain | `leanprover/lean4:v4.29.0-rc8` |
| Mathlib | not required (vanilla Lean 4) |
| Theorems | 20 |
| sorry | 0 |
| axioms | 0 |
| Author | J. York Seale (NaturalScience) |
| Programme | A PLACE TO STAND, Phase 2, May 2026 |

Companion manuscript: `THE_SPINOR_CALIBRATION_v0_1.md`.

## Build

```bash
lake build
```

That's the whole procedure. The kernel is fully self-contained — no Mathlib clone, no external dependencies. A clean build should take under 30 seconds on a typical machine.

## What's verified

The kernel verifies the **arithmetic skeleton** of the calibration. Each theorem is closed by `decide` on integer arithmetic.

### §2 — Trivium vector squared norm
- `normSquared_eq_twelve` — ‖v‖² = 12
- `normSquared_eq_doubled_triangular` — ‖v‖² = 2·(1+2+3)
- `normSquared_eq_two_times_six` — ‖v‖² = 2·6 (exhibiting the {2,3}-tower doubling)

### §3 — Formation tuple of ξ (Class A)
- `formation_count_seven` — n₁ + n₂ + n₃ + n₄ = 7
- `wallSquared_condition` — n₁ = n₃ (Wall² characteristic of Class A)

### §4 — Spectral Volume (Place to Stand Theorem 11)
- `spectralVolume_eq_twelve` — λ = 12
- `spectralVolume_eq_normSquared` — λ = ‖v‖²

### §5 — (ℤ/2)³ cube combinatorics
- `cube_euler_chi` — V − E + F = 2
- `edge_stratum_decomposition` — (3, 6, 3) edge strata sum to 12
- `cubeEdges_eq_spectralVolume` — cube edges = λ

### §7 — **The main theorem**
- `spinor_calibration` — calibrationProduct.beq negOne = true, i.e. ‖v‖² · ζ(-1) = -1

### §8 — Bosonic string critical dimension parallel
- `stringPaired_eq_twelve` — (D-2)/2 = 12 for D = 26
- `stringPaired_eq_spectralVolume` — (D-2)/2 = λ

### §9 — Cosmological manifestation
- `omegaB_num_eq_four` — Ω_b numerator = 4
- `wallSquared_eq_81` — wall² = 81
- `cosmoDeviationDen_eq_243` — cosmological deviation denominator = 243
- `cosmological_residual_identity` — Ω_b / 12 = 1 / 243 (kernel-form cross-mult: 4·243 = 12·81)

### §10 — The twelve unification
- `twelve_unification` — λ = ‖v‖² = cube edges = (D-2)/2

### §11 — The {2,3}-doubling tower
- `doubling_tower` — 6 → 12 → 24
- `tower_level_2_eq_spectralVolume` — level 2 = λ

## What's NOT verified

The kernel does **not** verify the structural (representation-theoretic) content. Specifically:

- ζ(-1) = -1/12 is **encoded** as an IntFrac literal, not proved from analytic continuation. (Mathlib has `riemannZeta` and the Bernoulli connection; a future version could import that and prove the value.)
- The Γ₀(4)-equivariance of the Trivium projection is in the manuscript, not the kernel.
- The metaplectic identification 𝖶⁴ = -Id is in the manuscript, not the kernel.
- The Mp₂(ℝ)-Plancherel identity and its Γ₀(4)-restriction are in the manuscript, not the kernel.

The discipline matches existing programme kernels: the kernel verifies the logical architecture and exact computations; manuscripts argue the structural content.

## Federation context

This kernel sits alongside the existing PLACE TO STAND federation:

| Kernel | Role | Status |
|---|---|---|
| SIDE-kernel | Core RH proof; ProductFormula chain | v1.1 (Zenodo 10.5281/zenodo.19937590) |
| SIDE-substrate-cluster | PairingObstruction | v0.4 |
| SIDE-coupling | Abstract framework | v0.1 |
| SIDE-orchestrator | Peer composite | v0.1 |
| SIDE-formation-arithmetic | Radial trace | v0.1 |
| SIDE-residual-bridge | 1/243 = Ω_b/12 | v0.1 |
| SIDE-class-coupling | Concrete instantiation | v0.1 |
| **SIDE-spinor-calibration** | **‖v‖² · ζ(-1) = -1** | **v0.1 (this kernel)** |

Each is independently auditable, own toolchain, own deposit. No Lake cross-dependencies; sister-kernel content is vendored with attribution when needed.

## License

CC-BY 4.0. Cite as:

> Seale, J. Y. (2026). *SIDE-spinor-calibration v0.1: The arithmetic skeleton of the Plancherel-restricted Spinor Calibration.* A PLACE TO STAND Research Programme.

## Acknowledgments

The heavy lifting was done by Weissman (2023) on covering groups and the metaplectic structure, Tate (1950) on the adelic construction of ξ(s), Størmer (1897) on consecutive smooth pairs, and von Staudt-Clausen (1840) on Bernoulli denominators. This kernel and its companion manuscript recognize that the pieces fit together to produce the calibration.

---

`:: → · ← ::`

*The Trivium is one cubit. The calibration is one identity. The signature is −1.*
