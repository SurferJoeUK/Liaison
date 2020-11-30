using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Liaison.Web.AspTS.Controllers
{
    public class UnitController:Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
    public class JointGroupController : Controller
    {
        private readonly Liaison.Data.SqlEFCore.Edmx.LiaisonContext _context;
        
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
            var newsimpleUnit = new Models.New.NewUnitSimple();
            newsimpleUnit.ListAdminCorps = BLL.UnitBLL.GetAdminCorpsWithUnitType(_context, "Liaison.BLL.Models.Unit.JointGroup");

            return View("../Unit/Create", newsimpleUnit);
        }

        // POST: UnitController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Models.New.NewUnitSimple simple)
        {
            try
            {
                BLL.UnitBLL.CreateUnit(_context, simple);
                return RedirectToAction(nameof(Index));
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
