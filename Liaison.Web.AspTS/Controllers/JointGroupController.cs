﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Liaison.Web.AspTS.Controllers
{

    public class JointGroupController : Controller
    {
        private readonly Liaison.Data.SqlEFCore.Edmx.LiaisonContext _context;
        private readonly string jointgroup = typeof(Liaison.BLL.Models.Unit.JointGroup).FullName;
        public JointGroupController()
        {
            if (_context == null)
            {
                _context = new Liaison.Data.SqlEFCore.Edmx.LiaisonContext();
            }
        }
        // GET: UnitController
        public ActionResult Index()
        {
            return View(); 
        }

        // GET: UnitController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: UnitController/Create
        public IActionResult Create()
        {
        //   const string jointgroup = "Liaison.BLL.Models.Unit.JointGroup";
            var newsimpleUnit = new Models.New.NewUnitSimple();
            newsimpleUnit.ListAdminCorps = BLL.UnitBLL.GetAdminCorpsWithUnitType(_context, jointgroup);
            newsimpleUnit.ListRankSymbols = BLL.UnitBLL.GetRanksWithUnitType(_context, jointgroup);//.GetObviousRanks();
            newsimpleUnit.ListServices = BLL.UnitBLL.GetServices(_context, jointgroup);
            newsimpleUnit.ListServiceTypes = BLL.UnitBLL.GetServiceTypes();            

            return View("../Unit/Create", newsimpleUnit);
        }
        //Action result for ajax call
        [HttpPost]
        public ActionResult GetUnitObjects(string ranksymbol, string admincorpsid)
        {
            List<SelectListItem> listUnitObjects = BLL.UnitBLL.GetUnitObjects(_context, Int32.Parse(admincorpsid), ranksymbol);
            return Json(listUnitObjects);
        }
        [HttpPost]
        public ActionResult GetMissionText(string ranksymbol, string admincorpsid, string missionid)
        {
            string missiontext = BLL.UnitBLL.GetUnitMissionName(_context, jointgroup, ranksymbol, Int32.Parse(admincorpsid), Int32.Parse(missionid));
            return Json(missiontext);
        }
        [HttpPost]
        public ActionResult GetUnitIndexes(string ranksymbol, string admincorpsid, string missionid)
        {
            string[] indexes = BLL.UnitBLL.GetUnitIndexes(_context, jointgroup, ranksymbol, Int32.Parse(admincorpsid), Int32.Parse(missionid));
            return Json(indexes);
        }
        // POST: UnitController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Models.New.NewUnitSimple simple)
        {
            try
            {
                simple.UnitObject = jointgroup;
                BLL.UnitBLL.CreateUnit(_context, simple);
                return RedirectToAction(nameof(Index), "Unit");
            }
            catch
            {
                return View();
            }
        }

        // GET: UnitController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: UnitController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: UnitController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: UnitController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
