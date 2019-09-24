using System;

namespace ConsoleCredito.Domain.Entities
{
    public class Credito
    {
        public int TipoCredito { get; set; }
        public decimal ValorCredito { get; set; }
        public int QuantidadeParcelas { get; set; }
        public DateTime DataPrimeiroVencimento { get; set; }
    }
}
