using System.ComponentModel;
using System.Reflection;

namespace ConsoleCredito.Domain.Comum
{
    public static class Comum
    {
        public static string ObterDescription<T>(this T value)
        {
            FieldInfo fi = value.GetType().GetField(value.ToString());

            DescriptionAttribute[] attributes = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);

            if (attributes != null && attributes.Length > 0)
                return attributes[0].Description;
            else
                return value.ToString();
        }
    }
}
