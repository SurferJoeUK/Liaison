using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Liaison.Web.AspTS.Controllers
{
    public class CommandController : Controller
    {
        private readonly Liaison.Data.SqlEFCore.Edmx.LiaisonContext _context;
        private readonly string command = typeof(Liaison.BLL.Models.Unit.Command).FullName;

        public CommandController()
        {
            if (_context == null)
            {
                _context = new Liaison.Data.SqlEFCore.Edmx.LiaisonContext();
            }
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Details(int id)
        {
            return View();
        }
        public IActionResult Create()
        {
            var newcommand = new Models.New.NewCommand();
            return View("../Unit/Create", newcommand);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Models.New.NewUnitSimple simple)
        {
            try
            {
                simple.UnitObject = command;
                BLL.UnitBLL.CreateUnit(_context, simple);
                return RedirectToAction(nameof(Index), "Unit");
            }
            catch
            {
                return View();
            }
        }
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
