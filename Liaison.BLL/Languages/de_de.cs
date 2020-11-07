using Liaison.BLL.Models.Unit;
using Liaison.BLL.Models.Unit.Abstracts;
using System;
using System.Text;

namespace Liaison.BLL.Languages
{
    public class de_de : ILanguage
    {
        System.Collections.Generic.Dictionary<string, string> _translations = null;

        public de_de()
        {
            if (_translations == null)
            {
                _translations = AUnit.GetTranslations("de_de");
            }
        }
        public string GetArmySquadronName(ArmySquadron armySquadron)
        {
            throw new NotImplementedException();
        }

        public string GetBattalionName(Battalion battalion)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(Translator(battalion.MissionName));
            sb.Append("bataillon ");
            sb.Append(battalion.Number);
            return sb.ToString();
        }

        private string Translator(string key)
        {
            return AUnit.DoTranslation(_translations, key, "de_de");
           // return _translations[english];
            //switch (english)
            //{
            //    case "Light Infantry":
            //        return "Jäger";
            //    case "Artillery":
            //        return "Artillerie";
            //    case "Armoured Engineer":
            //        return "Panzerpionier";
            //    default:
            //        throw new NotImplementedException(english + " not translated");
            //}
        }

        public string GetBrigadeName(Brigade brigade)
        {
            throw new NotImplementedException();
        }

        public string GetCompanyName(Company company)
        {
            StringBuilder sb = new StringBuilder();
            if (!string.IsNullOrWhiteSpace(company.MissionName))
            {
                sb.Append(Translator(company.MissionName));
                sb.Append("kompanie ");
                sb.Append(company.Number);
            }
            else if (!string.IsNullOrWhiteSpace(company.CommandName))
            {
                if (company.Number != null)
                {
                    sb.Append(ToOrdinal(company.Number, company.UseOrdinal) + "/");
                }
                sb.Append(company.CommandName);
            }

            return sb.ToString();
        }

        public string GetDivisionName(Division division)
        {
            throw new NotImplementedException();
        }

        public string ToOrdinal(int? input, bool useOrdinal)
        {
            return input == null 
                ? "" 
                : useOrdinal 
                    ? input.Value.ToString() + "." 
                    : input.Value.ToString();
        }
    }
}