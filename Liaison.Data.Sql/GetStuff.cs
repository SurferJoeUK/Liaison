using System;
using Liaison.Data.Sql.Edmx;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Liaison.Data.Sql
{
    public class GetStuff 
    {
        public static Unit GetItWithContext(LiaisonEntities context, int unitId)
        {
            var xxx = context.UnitIndexes.First(ui => ui.UnitId == unitId);

            return GetUnit(context, xxx.UnitId);
        }

        public static Unit GetItWithContext(LiaisonEntities context, string unitindex)
        {
            if (string.IsNullOrEmpty(unitindex))
            {
                unitindex = "JFHQ";
            }

            var xxxx = context.UnitIndexes.FirstOrDefault(ui => ui.IndexCode == unitindex);
            if (xxxx==null)
            {
                return null;
            }    

            return GetUnit(context, xxxx.UnitId);
        }
        public static IEnumerable<Unit> GetUnits(LiaisonEntities context)
        {
            return context.Units;
        }

        public static Unit GetUnit(LiaisonEntities context, int unitId)
        {
            var thisthing = context.Units
                .Include(ui => ui.RelationshipsFrom)
                .Include(ui => ui.RelationshipsTo)
                .Include(ui => ui.Rank)
                .Include(ui => ui.AdminCorp)
                .Where(ui => ui.UnitId == unitId);

            return thisthing.First();
        }

        public static List<string> GetSortOrder(LiaisonEntities context)
        {       

            return context.SortOrders.OrderBy(so => so.SortOrderRank).Select(so => so.SearchTerm).ToList();
        }

        public static List<string> GetJointGroupMissionNames()
        {
            using (var context = new LiaisonEntities())
            {
                // return context.ConfigSettings.First(m => m.ConfigSetting1 == ).ConfigValue.Split(',').ToList();
                return context.Configuerations.Where(v => v.ConfigSetting == "JointGroupMissionNames").Select(v => v.ConfigValue).ToList();
            }
        }

        public static List<string> GetNavalSquadronMissionNames()
        {
            using (var context = new LiaisonEntities())
            {
                return context.Configuerations.Where(m => m.ConfigSetting == "NavalSquadronMissionNames").Select(v => v.ConfigValue).ToList();
            }
              
        }
        public static List<string> GetFacilityMissionNames()
        {
            using (var context = new LiaisonEntities())
            {
                return context.Configuerations.Where(m=>m.ConfigSetting == "FacilityMissionNames").Select(v => v.ConfigValue).ToList();
            }
        }

        public static List<int> GetConfigSetting(string input)
        {
            using (var context = new LiaisonEntities())
            {
                return context.Configuerations.Where(m => m.ConfigSetting == input).Select(v => v.ConfigValue).ToList().Select(int.Parse).ToList();
            }
        }

        public static List<string> GetBattalionNoBracketMissionNames()
        {
            using (var context = new LiaisonEntities())
            {
                return context.Configuerations.Where(m => m.ConfigSetting == "BattalionNoBracketMissionNames").Select(v => v.ConfigValue).ToList();
            }
        }

    
        //private static List<Tuple<string, string, string>> _dictionary = null;
        //public static Dictionary<string, string> GetDictionary(string dicttype)
        //{
        //    if (_dictionary == null)
        //    {
        //        _dictionary = new List<Tuple<string, string, string>>();
        //        using (var context = new LiaisonEntities())
        //        {
        //            var data = context.Dictionaries;

        //            foreach (var d in data)
        //            {
        //                _dictionary.Add(new Tuple<string, string, string>(d.Key, d.Value, d.Type));
        //            }


        //        }
        //    }

        //    Dictionary<string, string> returnable = new Dictionary<string, string>();
        //    foreach (var d in _dictionary)
        //    {
        //        if (d.Item3 == dicttype)
        //        {
        //            returnable.Add(d.Item1, d.Item2);
        //        }
        //    }

        //    return returnable;
        //}
        public static void SetUnitObject(int unitid, string unitobject)
        {
            using (var context = new LiaisonEntities())
            {
                var sqlunit = context.Units.First(u => u.UnitId == unitid);
                sqlunit.UnitObject = unitobject;
                context.SaveChanges();
            }

        }
        public static Dictionary<string, string> GetDictionary(string dicttype)
        {
            using (var context = new LiaisonEntities())
            {
                var data = context.Dictionaries.Where(d => d.Type == dicttype);
                var dictionary = new Dictionary<string, string>();
                foreach (var d in data)
                {
                    dictionary.Add(d.Key, d.Value);
                }

                return dictionary;
            }
        }

        public static List<KeyValuePair<string, string>> GetConfigSettingsValues(LiaisonEntities le)
        {
            //var configs = le.ConfigSettings.ToList();
            var dictionary = new List<KeyValuePair<string, string>>();
            //foreach (var data in configs)
            //{
            //    string[] values = data.ConfigValue.Split(',');
            //    foreach (var value in values)
            //    {
            //        dictionary.Add(new KeyValuePair<string, string>(data.ConfigSetting1, value));
            //    }
            //}

            return dictionary;
        }
    }
}
