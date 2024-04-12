**Deutsch-Jozsa algorithm resource estimation using Q#.**

We implemented Deutsch-Jozsa algorithm using Q# for resource estimation. The Deutsch-Jozsa algorithm is a quantum algorithm designed to determine whether a given Boolean function, is constant or balanced. This algorithm evaluates a number of queries to the oracle. With help of this algorithm, it is possible to decide whether a function has certain peroperty with single call of the function, instead of two calls that are necessary classically. This implementation includes three oracle functions to demonstrate the algorithm's application.

Output of the algorithm
Function 0 is constant.
Function 1 is constant.
Function 2 is balanced.
Result: "()"
Finished shot 1 of 1

**Features**

**Deutsch-Jozsa Algorithm Implementation:** Core implementation of the quantum algorithm.

**Multiple Oracles:** Includes three oracle functions, one for a constant function that always outputs 0, another for a constant function that always outputs 1, and a balanced function.

**Quantum Simulation:** Utilizes Microsoft's Quantum Development Kit for simulation.

Q# simulation completed.


We collected following resource estimation
Results 
![Results](https://github.com/barnotas/microsoft_quantum_challange/assets/61534987/bd773297-110e-476e-b464-f00b40acf837)

Space diagram
![Space diagram](https://github.com/barnotas/microsoft_quantum_challange/assets/61534987/0bce23e7-b3f1-428f-b350-749a5e56674c)

Histogram
![Histogram](https://github.com/barnotas/microsoft_quantum_challange/assets/61534987/2429a683-c60f-444b-ad23-7ea6793e9248)



