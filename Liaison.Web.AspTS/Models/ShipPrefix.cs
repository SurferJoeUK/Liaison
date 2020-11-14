namespace Liaison.Web.AspTS.Models
{
    public class ShipPrefix
    {
        public int ShipPrefixId { get; set; }
        public string Prefix { get; set; }
        public string InFull { get; set; }

        public override string ToString()
        {
            return Prefix.ToString();
        }
    }
}