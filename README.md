# microsoft_quantum_challange

operation Oracle_Zero (x : Qubit[]) : Unit{
    
}

open Microsoft.Quantum.Math;
operation Oracle_One(x : Qubit[]) : Unit{
    R(PauliI, 2.0 * PI(), x[0]);
}

operation Oracle_Xmod2(x : Qubit[]) : Unit{
    Z(x[Length(x) - 1]);
}
operation DeutchJozsaAlgorithm (N : Int, oracle : (Qubit[] => Unit)) : Bool {
    // aboolean variable for storing the return value 
    mutable isBaLanced = false;
    // array of N quibits for input regitser y
    use y = Qubit[N];
    ApplyToEach(H, y);
    oracle(y);
    ApplyToEach(H, y);
    for q in y{
        if(M(q) == One){
            set isBaLanced = true;
        }

    }
    return isBaLanced;
}

operation RunDeutschJozsaAlgorithm(): String {
      Fact(DeutchJozsaAlgorithm(4 , Oracle_Zero) == true, "f(x) = 0 not indentified as constant");


      
      return "Success!";

}
