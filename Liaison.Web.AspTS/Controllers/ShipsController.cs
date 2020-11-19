using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Liaison.Data.Sql.Edmx;
using TsShip = Liaison.Web.AspTS.Models.Ship;
using TsShipPrefix = Liaison.Web.AspTS.Models.ShipPrefix;
using Microsoft.EntityFrameworkCore;

namespace Liaison.Web.AspTS.Controllers
{
    public class ShipsController : Controller
    {
        // private readonly LiaisonWebAspTSContext _context;
        private readonly Liaison.Data.SqlEFCore.Edmx.LiaisonContext _context;
       // public ShipsController(LiaisonWebAspTSContext context)
       public ShipsController()
        {
            if (_context==null)
            {
                _context = new Liaison.Data.SqlEFCore.Edmx.LiaisonContext();
            }
            //LiaisonEntities context
            //_context = context;
        }

        // GET: Ships
        public IActionResult Index()
        {
            //throw new NotImplementedException();
           var efships = _context.Ships.OrderBy(ef => ef.Name).Include(ef=>ef.ShipPrefix);
            IEnumerable<int?> ids = efships.Select(sh => sh.UnitId);
            var indicies = _context.UnitIndices.Where(idx => ids.Contains(idx.UnitId)).ToList();

          //  var shipclass=  _context.ShipClasses.Where(cl=>cl.)

            List<TsShip> tsships = (from efship in efships
                                    select new TsShip
                                    {
                                        UnitId = efship.UnitId ?? null,
                                        ShipPrefix = new TsShipPrefix
                                        {
                                            ShipPrefixId = efship.ShipPrefixId,
                                            Prefix = efship.ShipPrefix!=null ?efship.ShipPrefix.ShipPrefix1:"",
                                            InFull = efship.ShipPrefix.InFull
                                        },
                                        Name = efship.Name,
                                        //IndexSort = string.Join(",", indicies.Where(idx => idx.UnitId==efship.UnitId && (idx.DisplayOrder >= 10 && idx.DisplayOrder <= 19)).Select(idx=>idx.IndexCode).ToArray()),
                                        //HCS = string.Join(",", indicies.Where(idx=> idx.UnitId == efship.UnitId && idx.DisplayOrder==41).Select(idx => idx.IndexCode).ToArray()).Replace("@", "").Replace("_", ""),
                                        //HCS = indicies.Where(idx => idx.UnitId == efship.UnitId && idx.DisplayOrder == 41).FirstOrDefault()?.IndexCode.Replace("@", "").Replace("_", ""),
                                        //Pennant = string.Join(",", indicies.Where(idx => idx.UnitId == efship.UnitId && idx.DisplayOrder == 40).Select(idx => idx.IndexCode).ToArray()).Replace("@", "").Replace("_", ""),
                                        //Pennant =  indicies.Where(idx => idx.UnitId == efship.UnitId && idx.DisplayOrder == 40).FirstOrDefault()?.IndexCode.Replace("@", "").Replace("_", ""),
                                        //AltHCS = string.Join(",", indicies.Where(idx => idx.UnitId == efship.UnitId && idx.DisplayOrder >= 50).Select(idx => idx.IndexCode).ToArray()).Replace("~", "").Replace("_", ""),
                                        //CommissioningDate = efship.Commissioned,
                                        //DecommissioningDate = efship.Decommissioned,
                                        IsBase = efship.IsBase,
                                       // ShipClass = new Models.ShipClass(),
                                   
                                    }).ToList();
            foreach (var tship in tsships)
            {
                tship.HCS = indicies.Where(idx => idx.UnitId == tship.UnitId && idx.DisplayOrder == 41).FirstOrDefault()?.IndexCode.Replace("@", "").Replace("_", "");
                tship.Pennant = indicies.Where(idx => idx.UnitId == tship.UnitId && idx.DisplayOrder == 40).FirstOrDefault()?.IndexCode.Replace("@", "").Replace("_", "");
            }
            return View(tsships.ToList());
        }


        // GET: Ships/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            throw new NotImplementedException();
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var ship = await _context.Ships
            //    .FirstOrDefaultAsync(m => m.UnitId == id);
            //if (ship == null)
            //{
            //    return NotFound();
            //}

            //return View(ship);
        }

        // GET: Ships/Create
        public IActionResult Create()
        {
            var newship = new Liaison.Web.AspTS.Models.New.NewShip();


            ViewBag.ListShipPrefix = BLL.ShipPrefixBLL.GetShipPrefixes(_context);
            ViewBag.ListShipClass = BLL.ShipClassBLL.GetShipClasses(_context, null);
            ViewBag.ListAdminCorps = BLL.AdminCorpsBLL.GetAdminCorps(_context, "N/!/");
            ViewBag.ListMissions = BLL.MissionBLL.GetMissions(_context, "N:HCS");


            return View(newship);
        }

        // POST: Ships/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[Bind("UnitId,Name,HCS,HCSNumber,PennantCode,PennantNumber")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Models.New.NewShip ship)
        {
            if (ModelState.IsValid)
            {
                BLL.ShipBLL.CreateShip(_context, ship);
                //await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            //return View(ship);
            return RedirectToAction("Create");
        }

        // GET: Ships/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            throw new NotImplementedException();
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var ship ==null; await _context.Ships.FindAsync(id);
            //if (ship == null)
            //{
            //    return NotFound();
            //}
            //return View(ship);
        }

        // POST: Ships/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("UnitId,Name,HCS,HCSNumber,PennantCode,PennantNumber")] TsShip ship)
        {
            if (id != ship.UnitId)
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
            return View(ship);
        }

        // GET: Ships/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            //var ship = await _context.Ships
            //    .FirstOrDefaultAsync(m => m.UnitId == id);
            //if (ship == null)
            //{
            //    return NotFound();
            //}
            throw new NotImplementedException();
            // return View(ship);
        }

        // POST: Ships/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            throw new NotImplementedException();
            //var ship = await _context.Ships.FindAsync(id);
            //_context.Ships.Remove(ship);
            //await _context.SaveChangesAsync();
            //return RedirectToAction(nameof(Index));
        }

        private bool ShipExists(int id)
        {
            throw new NotImplementedException();
            //return _context.Ships.Any(e => e.UnitId == id);
        }
    }
}
