# Epidemic Simulator (Spatial SIR Model)

This project contains a Fortran-based agent simulation of an infectious disease spreading through a population. It utilizes a spatial Susceptible-Infected-Recovered (SIR) model where individuals move randomly on a 2D discrete grid subject to periodic boundary conditions.

## Project Layout

    project/
    ├── Makefile                # Build automation script
    ├── Project-Report.pdf      # Detailed academic report of the simulation
    ├── README.md               # This file
    ├── src/
    │   ├── mtfort90.f90        # Mersenne Twister random number generator module
    │   ├── utils.f90           # Core simulation subroutines
    │   └── epidemic_simulator.f90 # Main program
    ├── run/
    │   ├── README.md           # Documentation for output data
    │   └── output.dat          # (Generated) Population time-series outputs
    ├── build/                  # (Generated) Object files (*.o) and modules (*.mod)
    └── bin/                    # (Generated) Compiled executable

## Compilation

The project uses make for build automation. The Makefile is configured for the gfortran compiler.

To compile the simulation, run the following command from the project root:

`make`

This will automatically create the build/ and bin/ directories, compile the source files, and generate the executable at bin/epidemic_simulator.

To remove all compiled objects and the executable, run:
Bash

`make clean`

Usage

The simulation must be executed from the project root to ensure it can locate the required `run/` output directory. It requires exactly eight positional arguments:

`./bin/epidemic_simulator <sim_len> <box_len> <n_walk> <n_sick> <n_imm> <seed> <p_sick> <p_heal>`

## Argument Definitions

- sim_len (Integer): Maximum number of time steps. The simulation terminates early if the infected count reaches zero.
- box_len (Integer): Side length of the square 2D simulation grid.n_walk (Integer): Total number of walkers.
- n_sick (Integer): Initial number of infected individuals ($t=0$).
- n_imm (Integer): Initial number of immune individuals ($t=0$). (Note: n_sick + n_imm $\le$ n_walk)
- seed (Integer): Initial seed for the pseudo-random number generator.- p_sick (Real): Probability ($0.0 - 1.0$) of transmission when a susceptible and infected walker share a coordinate.
- p_heal (Real): Probability ($0.0 - 1.0$) per time step that an infected walker recovers.

## Outputs

The program generates two files per run:

- Time-Series Data (run/<params>.txt): A CSV file logging the aggregate number of infected and immune walkers at each time step. The filename is dynamically generated from the input parameters.

- Trajectory File (epidemic.xyz): An XYZ-formatted spatial history file saved to the project root. Visualization software may interpret the health condition parameter ($0$=Susceptible, $1$=Infected, $2$=Immune) as the Z-coordinate.

## Video of the Simulation

Visualized with ovito

![icon](https://raw.githubusercontent.com/terkol/epidemic-simulator/main/simulation.gif)