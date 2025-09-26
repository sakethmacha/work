using System;
using System.Threading;
namespace Outparameter
{
    public class OutParameter
    {
        public void Increment(ref int x)
        {
            x++;
        }
        public void Decrement(out int x)
        {
            Thread.Sleep(5000);
            x = 10;
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            OutParameter outParameter = new OutParameter();
            int z = 20;
            int x = 50;
            Thread t1 = new Thread(() => outParameter.Decrement(out z));
            //Thread t2 = new Thread(() => outParameter.Increment(ref x));
            t1.Start();
            Console.WriteLine(z);
            t1.Join();
            Console.WriteLine(z);
            //Console.WriteLine(x);
        }
    }
}


