﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Xml;
using Liaison.Biz.Objects;
using System.Xml.Serialization;
using System.Collections.Generic;
using Liaison.Biz.MilOrgs;
using System.IO;

namespace Liaison.Biz.Tests
{
    [TestClass]
    public class ConvertToMilOrgTests
    {
        [TestMethod]
        public void ConvertToDivision()
        {
            var converter = new Liaison.Biz.Converter.ConvertToMilOrg();

            string divText = Liaison.Biz.Tests.Strings.DivisionString.infantrydivision;

            //var xmlreader = XmlReader.Create(divText);
            var xmlreader = XmlReader.Create(new StringReader(divText));
            xmlreader.Read();

            var serializer = new XmlSerializer(typeof(CurrentOpsObject));
            var currentOpsObject = (CurrentOpsObject)serializer.Deserialize(xmlreader);


            var division = Converter.ConvertToMilOrg.Convert(currentOpsObject);


            Assert.IsInstanceOfType(division, typeof(DivisionOrg));
            Assert.AreEqual(1, division.Number);
            Assert.IsTrue(division.UseOrdinal);
            Assert.AreEqual("Infantry", division.Mission);
            Assert.AreEqual("1st Infantry Division", division.Name);
            Assert.AreEqual("us/army/1-id", division.CurrentOpsRef);
            Assert.AreEqual("https://currentops.com/unit/us/army/1-id", division.CurrentOpsUrl);
            Assert.AreEqual("https://currentops.com/img/page-header-img/c3NpL1VTIEFSTVkgSUQgMDAwMQ.png", division.CurrentOpsLogo);
            Assert.AreEqual(Liaison.Helper.Enumerators.Services.Army, division.ServiceId);
            Assert.AreEqual(Liaison.Helper.Enumerators.UnitType.Division, division.UnitTypeId);

            Assert.AreEqual(2, division.Bases.Count);            

            Assert.AreEqual("us/ks/fort-riley", division.Bases[0].CurrentOpsBaseRef);
            Assert.AreEqual("Fort Riley", division.Bases[0].Name);
            Assert.AreEqual("Junction City, Kansas, United States", division.Bases[0].Location);
            Assert.AreEqual("https://currentops.com/installations/us/ks/fort-riley", division.Bases[0].CurrentOpsUrl);
            Assert.AreEqual(2006, division.Bases[0].DateFrom);
            Assert.AreEqual(null, division.Bases[0].DateUntil);
            Assert.AreEqual(false, division.Bases[0].IsDeployment);
            Assert.AreEqual(true, division.Bases[0].IsCurrent);

            Assert.AreEqual("de/by/leighton-bks", division.Bases[1].CurrentOpsBaseRef);
            Assert.AreEqual("Leighton Barracks", division.Bases[1].Name);
            Assert.AreEqual("Würzburg, Bavaria, Germany", division.Bases[1].Location);
            Assert.AreEqual("https://currentops.com/installations/de/by/leighton-bks", division.Bases[1].CurrentOpsUrl);
            Assert.AreEqual(null, division.Bases[1].DateFrom);
            Assert.AreEqual(2006, division.Bases[1].DateUntil);
            Assert.AreEqual(false, division.Bases[1].IsDeployment);
            Assert.AreEqual(false, division.Bases[1].IsCurrent);

            Assert.AreEqual(3, division.HigherHqs.Count);

            Assert.AreEqual("us/army/usaraf", division.HigherHqs[0].CurrentOpsRef);
            Assert.AreEqual(null, division.HigherHqs[0].DateFrom);
            Assert.AreEqual(null, division.HigherHqs[0].DateUntil);
            Assert.AreEqual(true, division.HigherHqs[0].IsCurrent);
            Assert.AreEqual(Liaison.Helper.Enumerators.HigherHqType.Alligned, division.HigherHqs[0].CommandRelationshipType);

            Assert.AreEqual("us/army/forscom", division.HigherHqs[1].CurrentOpsRef);
            Assert.AreEqual(null, division.HigherHqs[1].DateFrom);
            Assert.AreEqual(null, division.HigherHqs[1].DateUntil);
            Assert.AreEqual(true, division.HigherHqs[1].IsCurrent);
            Assert.AreEqual(Liaison.Helper.Enumerators.HigherHqType.Assigned, division.HigherHqs[1].CommandRelationshipType);

            Assert.AreEqual("us/army/v-corps", division.HigherHqs[2].CurrentOpsRef);
            Assert.AreEqual(null, division.HigherHqs[2].DateFrom);
            Assert.AreEqual(2006, division.HigherHqs[2].DateUntil);
            Assert.AreEqual(false, division.HigherHqs[2].IsCurrent);
            Assert.AreEqual(Liaison.Helper.Enumerators.HigherHqType.Unknown, division.HigherHqs[2].CommandRelationshipType);
        }
    }
}
