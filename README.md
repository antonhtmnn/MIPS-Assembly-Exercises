## MIPS Assembly Exercises

This repository contains solutions to MIPS assembly programming exercises focused on simulating maze navigation algorithms using the MARS (MIPS Assembler and Runtime Simulator). The exercises are part of a course on computer organization, designed to deepen understanding of low-level programming, memory management, and algorithmic problem-solving using MIPS assembly language.

### Table of Contents

- [Project Description](#project-description)
- [Installation](#installation)
- [Usage](#usage)
- [Exercise Descriptions](#exercise-descriptions)

### Project Description

This project consists of two main exercises that involve implementing algorithms to navigate mazes represented as arrays. The primary focus is on understanding and implementing the Lee algorithm and related maze traversal techniques using MIPS assembly.

### Installation

To set up the project on your local machine, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/antonhtmnn/MIPS-Assembly.git
    ```
2. Open the MIPS assembly files in MARS (MIPS Assembler and Runtime Simulator).

### Usage

To run the exercises:

1. Load the assembly file for the desired exercise in MARS.
2. Assemble the code.
3. Run the simulation and observe the output, which typically includes the visualization of the maze and the solution path.

### Exercise Descriptions

#### Exercise 1: Neighbor Fields in the Maze

In this exercise, an 8x8 maze is represented as a 64-element array, where each element is a byte representing a maze cell. The task is to implement a function that returns the index of a neighboring field in the specified direction or -1 if no neighbor exists. The function should consider boundaries and edge cases.

- **Function Signature:**
    ```mips
    int neighbor(int pos, int direction);
    ```

- **Details:**
    - `pos` is the current position in the maze.
    - `direction` indicates which neighboring field to check (0 = up, 1 = left, 2 = down, 3 = right).

#### Exercise 2: Pathfinding in the Maze

This exercise extends the work done in Exercise 1 by implementing the Lee algorithm to trace a path from a destination back to a start point in a maze, marking the path. The algorithm marks the shortest path in the maze by iteratively checking neighboring cells.

- **Function Signature:**
    ```mips
    int trace_back(unsigned char *maze, int dest);
    ```

- **Details:**
    - The function marks the path with a special value and returns the length of the path.
    - The maze is represented as an array, where each cell can be empty, blocked, or contain a distance value from the start.
