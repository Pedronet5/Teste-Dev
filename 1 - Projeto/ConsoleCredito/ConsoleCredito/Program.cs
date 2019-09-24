using ConsoleCredito.Domain.Comum;
using ConsoleCredito.Domain.Entities;
using ConsoleCredito.Domain.Enums;
using System;

namespace ConsoleCredito
{
    class Program
    {
        #region Aplicação

        static void Main(string[] args)
        {
            try
            {
                Credito credito = new Credito();
                CreditoResponse creditoResponse = new CreditoResponse();

                credito.TipoCredito = CarregarTipoCredito();
                credito.ValorCredito = CarregarValorCredito(credito.TipoCredito);
                credito.QuantidadeParcelas = CarregarQuantidadeParcelas();
                credito.DataPrimeiroVencimento = CarregarDataPrimeiroVencimento();

                creditoResponse = RetornarResultado(credito);

                string StatusCredito = creditoResponse.StatusCredito == 1 ? Comum.ObterDescription(EStatusCredito.StatusAprovado) : Comum.ObterDescription(EStatusCredito.StatusRecusado);

                Console.WriteLine("Status do Crédito: " + StatusCredito);
                Console.WriteLine("Valor Total com Juros: " + creditoResponse.ValorTotalComJuros);
                Console.WriteLine("Valor do Juros: " + creditoResponse.ValorJuros);
                Console.ReadKey();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        #endregion Aplicação

        #region Métodos

        static void CarregarConsole(int tipoOpcao)
        {
            switch (tipoOpcao)
            {
                case 1:
                    //Exibe o Titulo 
                    Console.WriteLine("Simulação de Crédito.\r");
                    Console.WriteLine("------------------------\n");

                    //Solicita ao usuário para digitar o tipo do crédito a ser simulado
                    Console.WriteLine("Digite o tipo do crédito a ser simulado:");
                    Console.WriteLine("1 - Credito Direto - Taxa de 2% ao mês.");
                    Console.WriteLine("2 - Credito Consignado - Taxa de 1% ao mês.");
                    Console.WriteLine("3 - Credito Pessoa Jurídica - Taxa de 5% ao mês.");
                    Console.WriteLine("4 - Credito Pessoa Física - Taxa de 3% ao mês.");
                    Console.WriteLine("5 - Credito Imobiliário - Taxa de 9% ao ano.");

                    break;
                case 2:
                    //Solicita ao usuário para digitar o valor total do crédito
                    Console.WriteLine("Digite o valor total do crédito:");
                    break;
                case 3:
                    //Solicita ao usuário para digitar a quantidade de parcelas
                    Console.WriteLine("Digite a quantidade de parcelas desejada:");
                    Console.WriteLine("A quantidade minima de parcela é de 5x e a máxima de 72x.");
                    break;
                case 4:
                    //Solicita ao usuário para digitar a data do primeiro vencimento
                    Console.WriteLine("Digite a Data do primeiro vencimento da parcela:");
                    break;

                default:
                    Console.WriteLine("Case Default");
                    break;
            }
        }

        static int CarregarTipoCredito()
        {
            bool IsValid = true;
            int val = 0;

            //Chama a rotina que preenche as opções do console
            CarregarConsole(1);

            try
            {
                while (IsValid)
                {
                    if (!Int32.TryParse(Console.ReadLine(), out val))
                    {
                        RetornaMensagemConsole("Por favor digite um número válido!", 1);
                    }
                    else if (val < 1 || val > 5)
                    {
                        RetornaMensagemConsole("Por favor digite um valor de 1 a 5!", 1);
                    }
                    else
                    {
                        //Sai do looping
                        IsValid = false;
                    }
                }
                //Limpa o console.
                Console.Clear();

                return val;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return val;
            }
        }

        static decimal CarregarValorCredito(int tipoCredito)
        {
            bool IsValid = true;
            decimal val = 0;
            //Chama a rotina que preenche as opções do console
            CarregarConsole(2);

            try
            {
                while (IsValid)
                {
                    if (!decimal.TryParse(Console.ReadLine(), out val))
                    {
                        RetornaMensagemConsole("Por favor digite um valor válido!", 2);
                    }
                    else if (tipoCredito == Convert.ToInt32(ETipoCredito.CreditoPessoaJuridica))
                    {
                        if (Convert.ToDouble(val) < 15000.00)
                        {
                            RetornaMensagemConsole("Para o crédito de pessoa jurídica, o valor mínimo é de R$ 15.000,00!", 2);
                        }
                        else if (Convert.ToDouble(val) > 1000000.00)
                        {
                            RetornaMensagemConsole("O valor máximo liberado para empréstimo é de R$ 1.000.000,00!", 2);
                        }
                        else
                        {
                            //Sai do looping
                            IsValid = false;
                        }
                    }
                    else if (Convert.ToDouble(val) > 1000000.00)
                    {
                        RetornaMensagemConsole("O valor máximo liberado para empréstimo é de R$ 1.000.000,00!", 2);
                    }
                    else
                    {
                        //Sai do looping
                        IsValid = false;
                    }
                }

                //Limpa o console.
                Console.Clear();

                return val;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return val;
            }
        }

        static int CarregarQuantidadeParcelas()
        {
            bool IsValid = true;
            int val = 0;
            //Chama a rotina que preenche as opções do console
            CarregarConsole(3);

            try
            {
                while (IsValid)
                {
                    if (!int.TryParse(Console.ReadLine(), out val))
                    {
                        RetornaMensagemConsole("Digite um valor inteiro!", 3);
                    }
                    else if (val < 5)
                    {
                        RetornaMensagemConsole("A quantidade minima da parcela é de 5x!", 3);
                    }
                    else if (val > 72)
                    {
                        RetornaMensagemConsole("A quantidade máxima da parcela é de 72x!", 3);
                    }
                    else
                    {
                        //Sai do looping
                        IsValid = false;
                    }
                }

                //Limpa o console.
                Console.Clear();

                return val;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return val;
            }
        }

        static DateTime CarregarDataPrimeiroVencimento()
        {
            bool IsValid = true;
            DateTime val = DateTime.MinValue;
            //Chama a rotina que preenche as opções do console
            CarregarConsole(4);

            try
            {
                while (IsValid)
                {
                    if (!DateTime.TryParse(Console.ReadLine(), out val))
                    {
                        RetornaMensagemConsole("Digite uma data válida!", 4);
                    }
                    else if (val < DateTime.Now.AddDays(15))
                    {
                        RetornaMensagemConsole("A data minima da primeira parcela é de 15 dias!", 4);
                    }
                    else if (val > DateTime.Now.AddDays(40))
                    {
                        RetornaMensagemConsole("A data máxima da primeira parcela é de 40 dias!", 4);
                    }
                    else
                    {
                        //Sai do looping
                        IsValid = false;
                    }
                }

                //Limpa o console.
                Console.Clear();

                return val;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return val;
            }
        }

        static void RetornaMensagemConsole(string mensagem, int OpcaoConsole)
        {
            //Limpa o console
            Console.Clear();
            //Emite um som quando exibe um alerta ao usuário.
            Console.Beep();
            //Exibe a mensagem de erro ao usuário.
            Console.Write(mensagem);
            //Pula uma linha.
            Console.WriteLine("");
            //Chama a rotina que preenche as opções do tipo do crédito no console.
            CarregarConsole(OpcaoConsole);
        }

        public static CreditoResponse RetornarResultado(Credito credito)
        {
            CreditoResponse creditoResponse = new CreditoResponse();

            switch (credito.TipoCredito)
            {
                case 1:
                    creditoResponse.StatusCredito = 1;
                    creditoResponse.ValorJuros = (credito.ValorCredito * 2 / 100) * credito.QuantidadeParcelas;
                    creditoResponse.ValorTotalComJuros = (credito.ValorCredito + creditoResponse.ValorJuros);
                    break;
                case 2:
                    creditoResponse.StatusCredito = 1;
                    creditoResponse.ValorJuros = (credito.ValorCredito * 1 / 100) * credito.QuantidadeParcelas;
                    creditoResponse.ValorTotalComJuros = (credito.ValorCredito + creditoResponse.ValorJuros);
                    break;
                case 3:
                    creditoResponse.StatusCredito = 1;
                    creditoResponse.ValorJuros = (credito.ValorCredito * 5 / 100) * credito.QuantidadeParcelas;
                    creditoResponse.ValorTotalComJuros = (credito.ValorCredito + creditoResponse.ValorJuros);
                    break;
                case 4:
                    creditoResponse.StatusCredito = 1;
                    creditoResponse.ValorJuros = (credito.ValorCredito * 3 / 100) * credito.QuantidadeParcelas;
                    creditoResponse.ValorTotalComJuros = (credito.ValorCredito + creditoResponse.ValorJuros);
                    break;
                case 5:
                    creditoResponse.StatusCredito = 1;
                    double percentualMes = 0.75 / 100;
                    creditoResponse.ValorJuros = Math.Round((credito.ValorCredito * Convert.ToDecimal(percentualMes)) * credito.QuantidadeParcelas);
                    creditoResponse.ValorTotalComJuros = Math.Round(credito.ValorCredito + creditoResponse.ValorJuros);
                    break;
                default:
                    Console.WriteLine("Case Default");
                    break;
            }

            return creditoResponse;

        }

        #endregion Métodos

    }
}
