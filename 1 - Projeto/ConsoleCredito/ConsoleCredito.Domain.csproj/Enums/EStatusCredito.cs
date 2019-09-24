using System.ComponentModel;

namespace ConsoleCredito.Domain.Enums
{
    public enum EStatusCredito
    {
        [Description("Aprovado")]
        StatusAprovado = 1,

        [Description("Recusado")]
        StatusRecusado = 2
    }
}
