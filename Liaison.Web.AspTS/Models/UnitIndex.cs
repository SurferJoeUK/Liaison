namespace Liaison.Web.AspTS.Models
{
    public class UnitIndex
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public int UnitId { get; set; }
        public bool IsSortIndex { get; set; }
        public bool IsDisplayIndex { get; set; }
        public bool IsAlt { get; set; }
        public bool IsPlaceholder { get; set; }
        public int DisplayOrder { get; set; }
    }
}