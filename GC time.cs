using System;
using System.Diagnostics;

namespace Assignmentt
{
    class Program
    {

        static void Main(string[] args)
        {
            Stopwatch stopwatch = new Stopwatch();

            const int totalObjects = 1000000;


            stopwatch.Start();
            for (int i = 0; i < totalObjects; i++)
            {
                var temp = new MyClass();
            }
            stopwatch.Stop();
            Console.WriteLine($"Time for creating short-lived objects: {stopwatch.ElapsedMilliseconds} ms");


            var longLived = new MyClass();
            Console.WriteLine($"Generation before GC: {GC.GetGeneration(longLived)}");


            stopwatch.Restart();
            GC.Collect(0);
            GC.WaitForPendingFinalizers();
            stopwatch.Stop();
            Console.WriteLine($"Time for Gen 0 collection: {stopwatch.ElapsedMilliseconds} ms");
            Console.WriteLine($"Generation after Gen 0 collection: {GC.GetGeneration(longLived)}");


            stopwatch.Restart();
            GC.Collect(1);
            GC.WaitForPendingFinalizers();
            stopwatch.Stop();
            Console.WriteLine($"Time for Gen 1 collection: {stopwatch.ElapsedMilliseconds} ms");
            Console.WriteLine($"Generation after Gen 1 collection: {GC.GetGeneration(longLived)}");


            stopwatch.Restart();
            GC.Collect(2);
            GC.WaitForPendingFinalizers();
            stopwatch.Stop();
            Console.WriteLine($"Time for Gen 2 collection: {stopwatch.ElapsedMilliseconds} ms");
            Console.WriteLine($"Generation after Gen 2 collection: {GC.GetGeneration(longLived)}");

            Console.ReadLine();
        }
    }

    class MyClass { }
}

