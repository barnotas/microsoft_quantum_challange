# Deutsch-Jozsa algorithm resource estimation using Q#.

We implemented Deutsch-Jozsa algorithm using Q# for resource estimation. The Deutsch-Jozsa algorithm is a quantum algorithm designed to determine whether a given Boolean function, is constant or balanced. This algorithm evaluates a number of queries to the oracle. With help of this algorithm, it is possible to decide whether a function has certain peroperty with single call of the function, instead of two calls that are necessary classically. This implementation includes three oracle functions to demonstrate the algorithm's application.

Output of the algorithm
Function 0 is constant.
Function 1 is constant.
Function 2 is balanced.
Result: "()"
Finished shot 1 of 1

### Features

**Deutsch-Jozsa Algorithm Implementation:** Core implementation of the quantum algorithm.

**Multiple Oracles:** Includes three oracle functions, one for a constant function that always outputs 0, another for a constant function that always outputs 1, and a balanced function.

**Quantum Simulation:** Utilizes Microsoft's Quantum Development Kit for simulation.

Q# simulation completed.


We collected following resource estimation
Results 
![Results](https://github.com/barnotas/microsoft_quantum_challange/assets/61534987/bd773297-110e-476e-b464-f00b40acf837)
Gate Configurations: Comparing different gate configurations (e.g., qubit_gate_ns_e3 vs. qubit_gate_ns_e4) allowed us to identify which setups minimize resource usage while maintaining algorithmic integrity.

Space diagram
![Space diagram](https://github.com/barnotas/microsoft_quantum_challange/assets/61534987/0bce23e7-b3f1-428f-b350-749a5e56674c)
### Data Points:
- Each colored dot represents a different configuration or run of the quantum algorithm.
- The position of each dot indicates the balance between the number of qubits used and the time taken to execute the algorithm.

### Analysis:
- **Lower Left Quadrant**: Dots in this area would represent the most efficient configurations, using fewer qubits and less runtime.
- **Upper Right Quadrant**: Conversely, dots here are less efficient, consuming more qubits and longer runtimes.

### Observations:
- **Efficiency Variance**: The spread of the dots shows a variance in efficiency. Some configurations achieve a lower runtime with fewer qubits, while others require more of both.
- **Optimal Configurations**: If we assume that lower qubits and runtime are better, the green dot seems to be the most efficient configuration, but with a trade-off in terms of error robustness, because teh error correction code of more than 1 is ususally better for quantum computing applications that are error-prone.

Histogram
![Histogram](https://github.com/barnotas/microsoft_quantum_challange/assets/61534987/2429a683-c60f-444b-ad23-7ea6793e9248)
- **Total shots: 1000**: This indicates the number of times the quantum circuit was executed or simulated. 

- **1 unique result**: This suggests that across all 1000 shots, there was only one outcome observed.

The large blue area represents the probability distribution of results. Since it's uniform and fills the entire output space, it indicates that the same result was obtained in every single shot, with a probability of 1. For our alogirthm it means that it consistently determined the function to be either constant or balanced with 100% certainty. This is exactly what we would expect from Deutsch-Jozsa, as it's designed to give a definitive answer after just one execution on a quantum computer.
