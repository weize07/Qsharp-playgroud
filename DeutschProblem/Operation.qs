namespace DeutschProblem
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;

    operation Set (desired: Result, q1: Qubit) : ()
    {
        body
        {
            let current = M(q1);

            if (desired != current)
            {
                X(q1);
            }
        }
    }

    operation Uf (x: Qubit, y: Qubit) : ()
    {
        body
        {
            CNOT(x, y);
        }
    }

    operation DeutschProblemTest () : (Int)
    {
        body
        {
                mutable res = 0;
                using (qubits = Qubit[2])
                {
                    Set (One, qubits[0]);
                    Set (Zero, qubits[1]);
                    Uf (qubits[0], qubits[1]);
                    let y = M (qubits[1]);
                    if (y == One)
                    {
                        set res = 1;
                    }
                    Set(Zero, qubits[0]);
                    Set(Zero, qubits[1]);
                }
                return (res);
        }
    }
}
