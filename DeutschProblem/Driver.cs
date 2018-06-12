using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace DeutschProblem
{
    class Driver
    {
        static void Main(string[] args)
        {
            using (var sim = new QuantumSimulator())
            {
                sim.OnLog += (msg) => { System.Console.WriteLine(msg); };
                // Try initial values
                var res = DeutschProblemTest.Run(sim).Result;
                System.Console.WriteLine(
                    $"Result:{res,-4}");
            }
            System.Console.WriteLine("Press any key to continue...");
            System.Console.ReadKey();
        }
    }
}
