using System;
namespace Assignmentt
{
    public class FloatToBinary
    {
        static int BinaryToInt(string binary)
        {
            int result = 0;
            int power = 1;
            for (int i = binary.Length - 1; i >= 0; i--)
            {
                if (binary[i] == '1')
                {
                    result += power;
                }
                power *= 2;
            }
            return result;
        }
        static string IntToBinary(int value, int bits = 8)
        {
            string binary = "";
            int n = value;
            while (n > 0)
            {
                int remainder = n % 2;
                binary = remainder + binary;
                n /= 2;
            }
            if (binary == "")
                binary = "0";
            if (binary.Length < bits)
                binary = binary.PadLeft(bits, '0');
            return binary;
        }
        static string FloatToBin(float num)
        {
            int signBit = num < 0 ? 1 : 0;
            num = Math.Abs(num);
            int integerPart = (int)num;
            float fractionPart = num - integerPart;
            string intBin = "";
            if (integerPart == 0)
            {
                intBin = "0";
            }
            else
            {
                while (integerPart > 0)
                {
                    intBin = (integerPart % 2) + intBin;
                    integerPart /= 2;
                }
            }
            string fracBinary = "";
            int precision = 30;
            while (fractionPart > 0 && fracBinary.Length < precision)
            {
                fractionPart *= 2;
                int bit = (int)fractionPart;
                fracBinary += bit;
                if (bit == 1) fractionPart -= 1;
            }
            return (signBit + " " + Normalise(intBin, fracBinary));
        }
        static string Normalise(string intBin, string fracBinary)
        {
            string normalized;
            int exponent;
            if (intBin != "0")
            {
                exponent = intBin.Length - 1;
                normalized = "1." + intBin.Substring(1) + fracBinary;
            }
            else
            {
                int index = fracBinary.IndexOf('1');
                if (index == -1)
                {
                    exponent = 0;
                    normalized = "1.";
                }
                else
                {
                    exponent = -(index + 1);
                    normalized = "1." + fracBinary.Substring(index + 1);
                }
            }
            int biasedExp = exponent + 127;
            string expBinary = IntToBinary(biasedExp, 8);
            string mantissa = normalized.Length > 2 ? normalized.Substring(2) : "";
            mantissa = mantissa.PadRight(23, '0').Substring(0, 23);
            return $"{expBinary} {mantissa}";
        }
        static string AddMantissas(string m1, string m2, out int carry)
        {
            string result = "";
            carry = 0;
            int i = m1.Length - 1;
            int j = m2.Length - 1;
            while (i >= 0 || j >= 0)
            {
                int bitA = (i >= 0) ? m1[i] - '0' : 0;
                int bitB = (j >= 0) ? m2[j] - '0' : 0;

                int sum = bitA + bitB + carry;
                result = (sum % 2) + result;
                carry = sum / 2;

                i--; j--;
            }
            return result;
        }
        static void EqualExponents(ref string input1, ref string input2)
        {
            string[] parts1 = input1.Split(' ');
            string[] parts2 = input2.Split(' ');
            int exp1 = BinaryToInt(parts1[1]);
            int exp2 = BinaryToInt(parts2[1]);
            string mant1 = "1" + parts1[2];
            string mant2 = "1" + parts2[2];
            if (exp1 > exp2)
            {
                int diff = exp1 - exp2;
                for (int i = 0; i < diff; i++)
                    mant2 = "0" + mant2.Substring(0, mant2.Length - 1);
                exp2 = exp1;
            }
            else if (exp2 > exp1)
            {
                int diff = exp2 - exp1;
                for (int i = 0; i < diff; i++)
                    mant1 = "0" + mant1.Substring(0, mant1.Length - 1);
                exp1 = exp2;
            }
            parts1[1] = IntToBinary(exp1, 8);
            parts2[1] = IntToBinary(exp2, 8);
            parts1[2] = mant1;
            parts2[2] = mant2;
            input1 = parts1[0] + " " + parts1[1] + " " + parts1[2];
            input2 = parts2[0] + " " + parts2[1] + " " + parts2[2];
        }
        static string NormalizeAndPack(string sign, string exp, string mant, int carry)
        {
            int exponent = BinaryToInt(exp);
            if (carry == 1)
            {
                mant = "1" + mant;
                mant = mant.Substring(0, mant.Length - 1);
                exponent += 1;
            }
            if (mant[0] != '1')
            {
                int index = mant.IndexOf('1');
                if (index > 0)
                {
                    mant = mant.Substring(index);
                    exponent -= index;
                }
            }
            string expBinary = IntToBinary(exponent, 8);
            string finalMantissa = mant.Substring(1).PadRight(23, '0').Substring(0, 23);
            return sign + " " + expBinary + " " + finalMantissa;
        }
        static float BinToFloat(string s)
        {
            string[] sol = s.Split(" ");
            int signBit = int.Parse(sol[0]);
            int exp = BinaryToInt(sol[1]) - 127;
            string mantissaBits = sol[2];

            double mant = 1.0;
            for (int i = 0; i < mantissaBits.Length; i++)
            {
                if (mantissaBits[i] == '1')
                    mant += Math.Pow(2, -(i + 1));
            }
            double value = mant * Math.Pow(2, exp);
            return signBit == 0 ? (float)value : (float)-value;
        }
        static void Main(string[] args)
        {
            Console.WriteLine("Enter a float number:");
            float n = float.Parse(Console.ReadLine());
            Console.WriteLine("Enter a float number:");
            float m = float.Parse(Console.ReadLine());
            string input1 = FloatToBin(n);
            string input2 = FloatToBin(m);
            EqualExponents(ref input1, ref input2);
            string[] parts1 = input1.Split(' ');
            string[] parts2 = input2.Split(' ');
            Console.WriteLine("input 1 is " + input1);
            Console.WriteLine("input 2 is " + input2);
            int carry;
            string add = AddMantissas(parts1[2], parts2[2], out carry);
            Console.WriteLine("Added mantissas: " + add + " carry=" + carry);
            Console.WriteLine(parts1[0]+" "+parts1[1]+" "+add+" "+carry);
            string final = NormalizeAndPack(parts1[0], parts1[1], add, carry);
            Console.WriteLine("Final value is " + final);
            Console.WriteLine("Final float value: " + BinToFloat(final));
        }
    }
}