using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TsShipClass = Liaison.Web.AspTS.Models.ShipClass;
using Microsoft.EntityFrameworkCore;
using System.Text;

namespace Liaison.Web.AspTS.Controllers
{
    public class ShipClassesController : Controller
    {
        // private readonly LiaisonWebAspTSContext _context;
        private readonly Liaison.Data.SqlEFCore.Edmx.LiaisonContext _context;
       // public ShipClassesController(LiaisonWebAspTSContext context)
       public ShipClassesController()
        {
            if (_context==null)
            {
                _context = new Liaison.Data.SqlEFCore.Edmx.LiaisonContext();
            }
            //LiaisonEntities context
            //_context = context;
        }

        // GET: ShipClasses
        public IActionResult Index()
        {
            List<Data.SqlEFCore.Edmx.ShipClass> efShipClasses = _context.ShipClasses.ToList();
            List<Data.SqlEFCore.Edmx.SortOrder> sortorder = _context.SortOrders.Where(so => so.SearchTerm.StartsWith("#")).OrderBy(so => so.SortOrderRank).ToList();

            List<TsShipClass> shipclasslist = new List<TsShipClass>();
            foreach (var sort in sortorder)
            {
                IEnumerable<Data.SqlEFCore.Edmx.ShipClass> hcsShipClasses = efShipClasses.Where(sc => sc.ClassCodeHcs == sort.SearchTerm.Substring(1)).OrderBy(sc => sc.ModFrom);

                foreach (var hcsShipClass in hcsShipClasses)
                {
                    StringBuilder sb = new StringBuilder(hcsShipClass.ClassName);
                    if (!string.IsNullOrWhiteSpace(hcsShipClass.ModName))
                    {
                        sb.Append(", " + hcsShipClass.ModName);
                    }
                    shipclasslist.Add(new TsShipClass
                    {
                        ShipClassId = hcsShipClass.ShipClassId,
                        Name = sb.ToString(),
                        HCS = hcsShipClass.ClassCodeHcs + "-" + hcsShipClass.ClassCodeNumber,
                        IsMod = hcsShipClass.ModFrom != null,
                        Notes = hcsShipClass.Notes
                    }); ;
                }
            }

            return View(shipclasslist.ToList());
        }


        // GET: ShipClasses/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            throw new NotImplementedException();
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var ship = await _context.ShipClasses
            //    .FirstOrDefaultAsync(m => m.UnitId == id);
            //if (ship == null)
            //{
            //    return NotFound();
            //}

            //return View(ship);
        }

        // GET: ShipClasses/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: ShipClasses/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("UnitId,Name,HCS,HCSNumber,PennantCode,PennantNumber")] TsShipClass shipClass)
        {
            if (ModelState.IsValid)
            {
                //_context.Add(ship);
                //await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(shipClass);
        }

        // GET: ShipClasses/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            throw new NotImplementedException();
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var ship ==null; await _context.ShipClasses.FindAsync(id);
            //if (ship == null)
            //{
            //    return NotFound();
            //}
            //return View(ship);
        }

        // POST: ShipClasses/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("UnitId,Name,HCS,HCSNumber,PennantCode,PennantNumber")] TsShipClass shipClass)
        {
            if (id != shipClass.ShipClassId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                //try
                //{
                //    //_context.Update(ship);
                //    await _context.SaveChangesAsync();
                //}
                //catch (DbUpdateConcurrencyException)
                //{
                //    if (!ShipExists(ship.UnitId))
                //    {
                //        return NotFound();
                //    }
                //    else
                //    {
                //        throw;
                //    }
                //}
                return RedirectToAction(nameof(Index));
            }
            return View(shipClass);
        }

        // GET: ShipClasses/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            //var ship = await _context.ShipClasses
            //    .FirstOrDefaultAsync(m => m.UnitId == id);
            //if (ship == null)
            //{
            //    return NotFound();
            //}
            throw new NotImplementedException();
            // return View(ship);
        }

        // POST: ShipClasses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            throw new NotImplementedException();
            //var ship = await _context.ShipClasses.FindAsync(id);
            //_context.ShipClasses.Remove(ship);
            //await _context.SaveChangesAsync();
            //return RedirectToAction(nameof(Index));
        }

        private bool ShipExists(int id)
        {
            throw new NotImplementedException();
            //return _context.ShipClasses.Any(e => e.UnitId == id);
        }
    }
}
