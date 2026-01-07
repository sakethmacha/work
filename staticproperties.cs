using System;
namespace Assignmentt
{
    public class Class1
    {
        static int a = 10;// constant throghout application
        int b;
        int c;
        public Class1(int b, int c)
        {
            this.c = c;
            this.b = b;
        }
        public static void M1()
        {
            Console.WriteLine("Hello");
        }
        static void Main(string[] args)
        {
            Class1 c1 = new Class1(2, 3);
            Class1 c2 = new Class1(4, 6);

            Console.WriteLine(Class1.a);
            
            Class1.M1();
        }
    }
}
