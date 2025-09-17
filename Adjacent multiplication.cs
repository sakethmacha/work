// See https://aka.ms/new-console-template for more information

namespace Assignment
{
    class AdjacentMultiplication
    {
        public static void Main(string[] args)
        {

            Console.WriteLine("Enter input string with numbers ");
            string s = Console.ReadLine();
            int max = 0;
            string o = "";
            for (int i = 0; i < s.Length - 4; i++)
            {
                int l = 1;
                int c = 0;
                string t = "";
                for (int k = i; k <= i + 3; k++)
                {
                    char ch = s[k];
                    l = l * ((int)ch - 48);
                    if (c == 0)
                    {
                        t = t + s[k];
                        c++;
                    }
                    else
                    {
                        t = t + "*" + s[k];
                    }
                }
                if (l > max)
                {
                    max = l;
                    o = t;
                }
            }
            Console.Write(o);
            Console.WriteLine("=" + max);
        }
    }
}

