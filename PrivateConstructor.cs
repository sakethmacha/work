using System;
namespace Assignmentt
{
    class Privateproperty
    {
        public int h;
        public int g;
        public int y;
        public Privateproperty()
        {

            h = 30;
            g = 40;
            y = 20;
        }
        public static Privateproperty M1(int a)
        {
            if (a == 1234567)
            {
                return new Privateproperty();
            }
            return null;
        }
   
    
        public static void Main(string[] args)
        {

            var x = Privateproperty.M1(1234567);
            // Privateproperty x = new Privateproperty(30);
            Console.WriteLine(x.h);
            Console.WriteLine(x.g);
            Console.WriteLine(x.y);
        }
    }
}
