using System;
namespace Assignmentt
{
    public class Class2
    {
        static Class2 cl1 = new Class2();
        public Class2()
        {

        }
        public static void Main(string[] args)
        {

            Class2 c1 = new Class2();
            Class2 c2 = new Class2();
            Class2 c3 = new Class2();
            Class2 c4 = new Class2();
            Class2 c5 = new Class2();

            Console.WriteLine("cl1 generation " + GC.GetGeneration(cl1));
            Console.WriteLine("c1 generation " + GC.GetGeneration(c1));
            Console.WriteLine("c2 generation " + GC.GetGeneration(c2));
            Console.WriteLine("c3 generation " + GC.GetGeneration(c3));
            Console.WriteLine("c4 generation " + GC.GetGeneration(c4));
            Console.WriteLine("c5 generation " + GC.GetGeneration(c5));


            Console.WriteLine("c1 generation " + GC.GetGeneration(c1));
            Console.WriteLine("c2 generation " + GC.GetGeneration(c2));
            Console.WriteLine("c3 generation " + GC.GetGeneration(c3));
            Console.WriteLine("c4 generation " + GC.GetGeneration(c4));
            Console.WriteLine("c5 generation " + GC.GetGeneration(c5));
            Class2 c6 = new Class2();
            Class2 c7 = new Class2();
            Console.WriteLine("c1 generation " + GC.GetGeneration(c1));
            Console.WriteLine("c2 generation " + GC.GetGeneration(c2));
            Console.WriteLine("c3 generation " + GC.GetGeneration(c3));
            Console.WriteLine("c4 generation " + GC.GetGeneration(c4));
            Console.WriteLine("c5 generation " + GC.GetGeneration(c5));
            Console.WriteLine("c6 generation " + GC.GetGeneration(c6));
            Console.WriteLine("c7 generation " + GC.GetGeneration(c7));

            Console.WriteLine("c1 generation " + GC.GetGeneration(c1));
            Console.WriteLine("c2 generation " + GC.GetGeneration(c2));
            Console.WriteLine("c3 generation " + GC.GetGeneration(c3));
            Console.WriteLine("c4 generation " + GC.GetGeneration(c4));
            Console.WriteLine("c5 generation " + GC.GetGeneration(c5));
            Console.WriteLine("c6 generation " + GC.GetGeneration(c6));
            Console.WriteLine("c7 generation " + GC.GetGeneration(c7));

        }
    }
}
