namespace SimonProblem
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

    // call OneTrial for n + 20 (which is O(n)) times, the probability to gain enough information for 
    // determining the number 'a' will be about 1 - 1 / 1Million, which is big enough
    operation find_A() : ()
    {
    
    }
    
    // every time we call OneTrial, we will get some information about combination of certain bits to be 0 or 1
    // (1) Uf(Hn|x>|0>) -> 1/2^0.5n sigma(|x> |f(x)>) = s1
    // (2) Hn(s1) -> 1/2^0.5(n-1) sigma[a.y=0]((-1)^x_0.y|y>)
    // (3) measure y -> y1, so, y1 
    operation OneTrial () : ()
    {
        
    }
}
