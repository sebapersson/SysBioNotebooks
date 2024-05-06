# SysBioNotebooks
*Example Jupyter Notebooks for working with PEtab.jl and SBMLImporter.jl*

This repository contains example Jupyter Notebooks for working with the Julia packages [SBMLImporter.jl](https://github.com/sebapersson/SBMLImporter.jl) and [PEtab.jl](https://github.com/sebapersson/PEtab.jl).

## Installation

To set up the notebooks, first clone the repository:

```bash
git clone https://github.com/sebapersson/SysBioNotebooks.git
```

Next, navigate into the cloned repository, start Julia, and in the Julia REPL enter:

```julia
] instantiate
```

or alternatively

```julia
import Pkg; Pkg.instantiate
```

For best performance, we strongly recommend using the latest version of Julia, which currently is Julia 1.10.

## SBMLImporter.jl examples

[SBMLImporter.jl](https://github.com/sebapersson/SBMLImporter.jl) is a Julia importer for dynamic models defined in the [Systems Biology Markup Language (SBML)](https://sbml.org/). It supports most SBML features such as events and dynamic compartment sizes. Imported models are converted into a [Catalyst](https://github.com/SciML/Catalyst.jl) `ReactionSystem`. This `ReactionSystem` can then be transformed into various problem types, such as a `JumpProblem` for Gillespie simulations, a `SDEProblem` for Langevin SDE simulations, or an `ODEProblem` for deterministic simulations.

In the *SBMLImporter* folder of this repository, you'll find notebooks covering a range of topics:

- Importing a SBML model as a `JumpProblem` for Gillespie simulations, and subsequently evaluate the performance of different stochastic simulators on this problem.
- Importing a SBML model as an `ODEProblem`, and subsequently evaluate the performance of different ODE solvers on this problem. A Google Colab of this notebook can also be found [here](https://colab.research.google.com/drive/1OMhiEtMmArptiRriv-_1jEc5NbMlupGC#scrollTo=29m1mQkj1sI1).

## PEtab.jl examples

[PEtab.jl](https://github.com/sebapersson/PEtab.jl) is a Julia package for constructing parameter estimation or Bayesian inference problems for ODE models. It allows for the direct importation of problems formatted in the [PEtab standard](https://petab.readthedocs.io/en/latest/), alternatively the problem can be directly coded in Julia where the dynamic model can be provided either as a [ModelingToolkit.jl](https://github.com/SciML/ModelingToolkit.jl) `ODESystem` or a [Catalyst](https://github.com/SciML/Catalyst.jl) `ReactionSystem`.

In the *PEtab* directory of this repository, you'll find notebooks covering a range of topics:

- Setting up a PEtab problem in Julia. A Google Colab of this notebook can also be found [here](https://colab.research.google.com/drive/1zhkKfxO8C9nEo4Igu0_om3BhXb2Hnq0G#scrollTo=GIeFXS0F0zww)
- Importing and simulating the ODE dynamic models in a PEtab problem. 
- Benchmarking different ODE solvers for a PEtab problem.
- Benchmarking different gradient computation methods, such as forward and adjoint methods, for a PEtab problem.
- Performing parameter estimation for a PEtab problem.
- Performing Bayesian inference for a PEtab problem, using either Adaptive Metropolis-Hastings methods or Hamiltonian Monte Carlo techniques (such as NUTS, which is used in Turing.jl).
