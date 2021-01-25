using Liaison.BLL.Translators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Liaison.Beta.Reconfiger2
{
    class Program
    {
        static void Main(string[] args)
        {
            var liaisonSql = new LiaisonSql();
            liaisonSql.GetConfigs();
        }
    }
}
