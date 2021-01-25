using Liaison.BLL.Translators;
using System;

namespace Liaison.Beta.Reconfiger
{
    class Program
    {
        static void Main(string[] args)
        {
            var liaisonSql = new LiaisonSql();
            var configs = liaisonSql.GetConfigs();
        }
    }
}
