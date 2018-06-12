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
            using (qubits = Qubit[2])
            {
                H(qubits[0]);
                H(qubits[1]);
                let q1 = M(qubits[0]);
                let q2 = M(qubits[1]);
                if (q1 == One && q2 == One) {
                    Message("11");
                } elif (q1 == One && q2 == Zero) {
                    Message("10");
                } elif (q1 == Zero && q2 == One) {
                    Message("01");
                } else {
                    Message("00");
                }
            }
            CNOT(x, y);
        }
    }

    operation f1 (x: Qubit, y: Qubit): ()
    {
        body
        {
            Message("calling f1");
            // f(x) = Zero no matter what x is
            // so just leave what y is.
        }        
    }

    operation f2 (x: Qubit, y: Qubit): ()
    {
        body
        {
            Message("calling f2");
            CNOT(x, y);
        }        
    }

    operation f3 (x: Qubit, y: Qubit): () 
    {
        body
        {
            Message("calling f3");
            X(x);
            CNOT(x, y);
        }
    }

    operation f4 (x: Qubit, y: Qubit): ()
    {
        body 
        {
            Message("calling f4");
            X(y);
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
