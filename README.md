# Epidemic Simulator

## Overview

This project simulates the spread of an infectious disease using an agent-based random-walk model on a 2D periodic grid. Each walker is in one of three states:

- `0`: susceptible

- `1`: infected

- `2`: immune (recovered / vaccinated)

The simulator writes a time series of infected and immune counts to a text file in `run/` named after the inputs. 

## Requirements

- A Fortran compiler (I used `gfortran 13.3.0`)

- `make` 

## Directory layout (example)

project/
    Makefile
    Project-Report.pdf
    README.md

    src/
        mtmod.f90
        utils.f90
        epidemic_simulation.f90

    run/
        README.md
        output.dat

    build/

    bin/

## Compilation

### Build with `make`

From the project root:

`$ make`

This produces the executable:

`bin/epidemic_simulation`

Build artifacts can be cleaned with:

`make clean`

## Input

The executable expects 7 command-line arguments in this order:

``sim_len`` (integer): maximum number of time steps

``box_len`` (integer): grid side length L (grid is L x L)

``n_walk`` (integer): number of walkers

``n_sick`` (integer): number of initially infected walkers

``n_imm`` (integer): number of initially immune walkers

``p_sick`` (real): probability a susceptible becomes infected when exposed

``p_heal`` (real): probability an infected recovers per step

`seed` (integer): seed for the random number generator

Example (from run/):

``../bin/epidemic_simulation 10000 100 1000 10 0 0.5 0.005 42``

## Output

The program writes data into file `sim_len`_ `box_len`_ `n_walk`_ `n_sick`_ `n_imm`_ `p_sick`_ `p_heal`_`seed.txt`.

Line 1: `inf,imm`

Lines $2..$`sim_len+1`: two integers per simulated step: the infected count (inf) and the immune count (imm). 

A second output `epidemic.xyz` exists but is currently commented out. If enabled, it would write walker positions and states each step for visualizing their motion and the spread of the epidemic. 

If the infected count becomes zero, the simulation ends early.


