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
                    Message("11: f1");
                    f1(x, y);
                } elif (q1 == One && q2 == Zero) {
                    Message("10: f2");
                    f2(x, y);
                } elif (q1 == Zero && q2 == One) {
                    Message("01: f3");
                    f3(x, y);
                } else {
                    Message("00: f4");
                    f4(x, y);
                }
                Set (Zero, qubits[0]);
                Set (Zero, qubits[1]);
            }
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
            CNOT(x, y);
            X(y);
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
            // we want to check whether Uf(0) == Uf(1) for random function Uf
            // prepare input state for Uf
            mutable res = 0;
            using (qubits = Qubit[2])
            {
                let x = qubits[0];
                let y = qubits[1];
                Set (One, x);
                Set (One, y);
                H (x);
                H (y);
                Uf (x, y);
                H (x);
                let input = M (x);
                if (input == One) {
                    Message("Uf(0) == Uf(1)");
                } else {
                     Message("Uf(0) != Uf(1)");
                }
                Set(Zero, qubits[0]);
                Set(Zero, qubits[1]);
            }
            return (res);
        }
    }
}
