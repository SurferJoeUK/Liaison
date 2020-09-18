namespace Liaison.BLL.Languages
{
   // https://en.wikipedia.org/wiki/Language_localisation#Language_tags_and_codes
    public interface ILanguage
    {
        string GetDivisionName(Models.Unit.Division division);
        string GetBrigadeName(Models.Unit.Brigade brigade);
        string GetBattalionName(Models.Unit.Battalion battalion);
        string GetCompanyName(Models.Unit.Company company);
        string GetArmySquadronName(Models.Unit.ArmySquadron armySquadron);
        string ToOrdinal(int? input, bool useOrdinal);
    }
}