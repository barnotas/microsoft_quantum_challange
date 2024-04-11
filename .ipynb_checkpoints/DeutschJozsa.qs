namespace DeutschJozsaAlgoritm {
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main() : Unit   {
    
     Message($"Function 0 is {DeutschJozsa(5, OracleF0) ? "constant" | "balanced"}.");
     Message($"Function 1 is {DeutschJozsa(5, OracleF1) ? "constant" | "balanced"}.");
     Message($"Function 2 is {DeutschJozsa(5, OracleF2) ? "constant" | "balanced"}.");

    }

    /// This operation implements the DeutschJozsa algorithm.
    // true if function is constant, or false if fuction is balanced
    operation DeutschJozsa(n : Int, oracle : ((Qubit[], Qubit) => Unit)) : Bool {
    mutable isBalanced = true;
    use (qn, q2) = (Qubit[n], Qubit());
    X(q2);
    ApplyToEachA(H, qn);                                
    H(q2);

    oracle(qn, q2);                       

    ApplyToEachA(H, qn);                                

    if (MeasureAllZ(qn) == One) {
        set isBalanced = false;
    }

    ResetAll(qn);       
    Reset(q2);       
    return isBalanced;
    }



    operation OracleF0(q1 : Qubit[], q2 : Qubit) : Unit is Adj {
    // constant 0
    // f(0) = f(1) = 0
}

operation OracleF1(q1 : Qubit[], q2 : Qubit) : Unit is Adj  {
    // constant 1
    // f(0) = f(1) = 1
    X(q2);
}
operation OracleF2(qn : Qubit[], q2 : Qubit) : Unit is Adj  {
    // balanced
    // f(n..m) = 0 when n ⊕ ... ⊕ m = 0
    // f(n..m) = 1 when n ⊕ ... ⊕ m = 1
    for q in qn {
        CNOT(q, q2);
    }
}
}
