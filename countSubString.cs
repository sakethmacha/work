using System;
namespace Assignmentt
{
    class countSubString
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Enter input string 1");
            string input1 = Console.ReadLine();
            Console.WriteLine("Enter input string 2");
            string input2 = Console.ReadLine();
            string s1 = "";
            for (int i = 0; i < input1.Length - input2.Length; i++)
            {
                string s2 = "";
                for (int j = i; j < i + input2.Length; j++)
                {
                    s2 = s2 + input1[j];
                }
                if (s2.Equals(input2))
                {
                    s1 = s1 + i + " ";

                }
            }
            Console.WriteLine(s1);
        }
    }
}
