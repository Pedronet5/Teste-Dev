using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleCredito.Domain.Entities
{
    public class CreditoResponse
    {
        public int StatusCredito { get; set; }

        public decimal ValorTotalComJuros { get; set; }

        public decimal ValorJuros { get; set; }
    }
}
