namespace Sample {
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation Main() : Unit   {
        // A Boolean function is a function that maps bitstrings to a bit:
        //     𝑓 : {0, 1}^n → {0, 1}.

        // We say that 𝑓 is constant if 𝑓(𝑥⃗) = 𝑓(𝑦⃗) for all bitstrings 𝑥⃗ and
        // 𝑦⃗, and that 𝑓 is balanced if 𝑓 evaluates to true for exactly half of
        // its inputs.

        // If we are given a function 𝑓 as a quantum operation 𝑈 |𝑥〉|𝑦〉 =
        // |𝑥〉|𝑦 ⊕ 𝑓(𝑥)〉, and are promised that 𝑓 is either constant or is
        // balanced, then the Deutsch–Jozsa algorithm decides between these
        // cases with a single application of 𝑈.

        // Here, we demonstrate the use of the Deutsch-Jozsa algorithm by
        // determining the type (constant or balanced) of a couple of functions.
    
     Message($"f0 is {DeutschJozsa(5, OracleF0) ? "constant" | "balanced"}.");
     Message($"f1 is {DeutschJozsa(5, OracleF1) ? "constant" | "balanced"}.");
     Message($"f2 is {DeutschJozsa(5, OracleF2) ? "constant" | "balanced"}.");

    }

    /// # Summary
    /// This operation implements the DeutschJozsa algorithm.
    /// It returns the query register measurement results. If all the measurement
    /// results are `Zero`, the function is constant. If at least one measurement
    /// result is `One`, the function is balanced.
    /// It is assumed that the function is either constant or balanced.
    ///
    /// # Input
    /// ## Uf
    /// A quantum operation that implements |𝑥〉|𝑦〉 ↦ |𝑥〉|𝑦 ⊕ 𝑓(𝑥)〉, where 𝑓 is a
    /// Boolean function, 𝑥 is an 𝑛 bit register and 𝑦 is a single qubit.
    /// ## n
    /// The number of bits in the input register |𝑥〉.
    ///
    /// # Output
    /// An array of measurement results for the query reguster.
    /// All `Zero` measurement results indicate that the function is constant.
    /// At least one `One` measurement result in the array indicates that the
    /// function is balanced.
    ///
    /// # See Also
    /// - For details see Section 1.4.3 of Nielsen & Chuang.
    ///
    /// # References
    /// - [ *Michael A. Nielsen , Isaac L. Chuang*,
    ///     Quantum Computation and Quantum Information ]
    /// (http://doi.org/10.1017/CBO9780511976667)
    operation DeutschJozsa(n : Int, oracle : ((Qubit[], Qubit) => Unit)) : Bool {
    mutable isFunctionConstant = true;
    use (qn, q2) = (Qubit[n], Qubit());
    X(q2);
    ApplyToEachA(H, qn);                                
    H(q2);

    oracle(qn, q2);                       

    ApplyToEachA(H, qn);                                

    // |00...0> means the functions is constant
    if (MeasureAllZ(qn) != Zero) {
        set isFunctionConstant = false;
    }

    ResetAll(qn);       
    Reset(q2);       
    return isFunctionConstant;
    }


    // Simple constant Boolean function
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
