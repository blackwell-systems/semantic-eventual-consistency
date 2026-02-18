[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18677400.svg)](https://doi.org/10.5281/zenodo.18677400)

# Normalization Confluence for Registry-Governed Stream Processing

**Dayna Blackwell, 2026**

## Abstract

Coordination-free convergence in distributed systems has been achieved through two structural regimes: operation commutativity (CRDTs) and invariant confluence (I-confluence). This paper identifies a third regime - **normalization confluence** - where non-commutative operations that may violate invariants converge through compensation.

We formalize registry-governed stream processing, where an external registry of invariant predicates defines valid states and a compensation operator repairs violations. Two structural conditions - well-founded compensation (WFC) and compensation commutativity (CC) - ensure termination and confluence. Under both, Newman's Lemma guarantees unique normal forms: any two processors consuming the same events agree on a valid state, regardless of order.

**Key contributions:**
- Formalization of normalization confluence regime
- Proof of termination (WFC) and confluence (CC)
- Verification calculus reducing global CC to local checks
- Uniformly bounded compensation (UBC) for O(log n) total cost
- Product composition theorem for modular verification

## Citation

```bibtex
@techreport{blackwell2026normalization,
  title   = {Normalization Confluence for Registry-Governed Stream Processing},
  author  = {Blackwell, Dayna},
  year    = {2026},
  doi     = {10.5281/zenodo.18677400},
  note    = {Technical Report},
  license = {CC-BY-4.0}
}
```

## Files

- `normalization_confluence_2026.pdf` - Full technical report
- `normalization_confluence_2026.tex` - LaTeX source

## License

CC-BY-4.0
