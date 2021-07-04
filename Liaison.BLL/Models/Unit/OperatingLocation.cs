namespace Liaison.BLL.Models.Unit
{
    public class OperatingLocation : Command
    {
        public OperatingLocation(Data.Sql.Edmx.Unit sqlUnit) : base(sqlUnit)
        {
        }

        public new int GetRankLevel()
        {
            return (int)RankLevel;
        }
    }
}