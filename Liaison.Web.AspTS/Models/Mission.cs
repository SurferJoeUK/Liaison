namespace Liaison.Web.AspTS.Models
{
    public class Mission
    {
        public int MissionId { get; set; }
        public string SortOrder { get; set; }
        public string Structure { get; set; }
        public string MainMission { get; set; }
        public string MissionVariant { get; set; }
        public string DisplayName { get; set; }
        public string FullName { get; set; }
        public string ShortForm { get; set; }
        public string AltShortForm { get; set; }
        public string Notes { get; set; }
    }
}