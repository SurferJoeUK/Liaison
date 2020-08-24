using Liaison.BLL.Models.Objects;

namespace Liaison.BLL.Models.Objects
{
	public class HCS
	{
		public enum HCSType
		{
			HCS,
			Pennant
		}
		public HCS(string hCS, int? hCSNumber, HCSType type)
		{
			this.Code = hCS;
			if (hCSNumber.HasValue)
			{
				this.Number = hCSNumber.Value;
			}
		}

		public string Code
		{
			get; set;
		}

		public int Number { get; set; }
		public HCSType Type { get; set; }
	}
}
namespace ExtensionMethods
{ 
	public static class ExtensionMethods
	{
		public static string ToStringy(this HCS hcs)
		{
			if (hcs==null)
			{
				return "NULL";
			}
			if (hcs.Type == HCS.HCSType.HCS)
			{
				return hcs.Code + "-" + hcs.Number;
			}
			else if (hcs.Type==HCS.HCSType.Pennant)
			{
				return hcs.Code + " " + hcs.Number;
			}
			return null;
		}
	}
}