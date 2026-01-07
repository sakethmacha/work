using System;
using System.Threading;
namespace Outparameter
{
    /// <summary>
    /// 
    /// </summary>
    public class Program
    {
        /// <summary>
        /// used for decrementing
        /// </summary>
        /// <param name="x">it is an out parameter</param>
        public void Decrement(out int x)
        {
            Thread.Sleep(5000);
            x = 10;
        }
        public static void Main(string[] args)
        {
            Program program=new Program();
            int z = 20;
            Thread t1 = new Thread(() => program.Decrement(out z));
            t1.Start();
            Console.WriteLine(z);
            t1.Join();
            Console.WriteLine(z);
        }
    }
}


