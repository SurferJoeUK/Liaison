using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Liaison.Data.SqlEFCore.Edmx;

namespace Liaison.Web.AspTS.Views.Ships
{
    public class XXXShipsController : Controller
    {
        private readonly LiaisonContext _context;

        public XXXShipsController(LiaisonContext context)
        {
            _context = context;
        }

        // GET: Ships
        public async Task<IActionResult> Index()
        {
            var liaisonContext = _context.Ships.Include(s => s.NewShip).Include(s => s.ShipPrefix).Include(s => s.Unit);
            return View(await liaisonContext.ToListAsync());
        }

        // GET: Ships/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ship = await _context.Ships
                .Include(s => s.NewShip)
                .Include(s => s.ShipPrefix)
                .Include(s => s.Unit)
                .FirstOrDefaultAsync(m => m.ShipId == id);
            if (ship == null)
            {
                return NotFound();
            }

            return View(ship);
        }

        // GET: Ships/Create
        public IActionResult Create()
        {
            ViewData["NewShipId"] = new SelectList(_context.Ships, "ShipId", "Name");
            ViewData["ShipPrefixId"] = new SelectList(_context.ShipPrefixes, "ShipPrefixId", "ShipPrefix1");
            ViewData["UnitId"] = new SelectList(_context.Units, "UnitId", "RankSymbol");
            return View();
        }

        // POST: Ships/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ShipId,UnitId,ShipPrefixId,Name,Hcs,Hcsnumber,PennantCode,PennantNumber,IsBase,AltName,AltHcs,AltHcsnumber,IsInactive,NewShipId,Commissioned,Decommissioned,ShipClassId")] Ship ship)
        {
            if (ModelState.IsValid)
            {
                ship.ShipId = Guid.NewGuid();
                _context.Add(ship);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["NewShipId"] = new SelectList(_context.Ships, "ShipId", "Name", ship.NewShipId);
            ViewData["ShipPrefixId"] = new SelectList(_context.ShipPrefixes, "ShipPrefixId", "ShipPrefix1", ship.ShipPrefixId);
            ViewData["UnitId"] = new SelectList(_context.Units, "UnitId", "RankSymbol", ship.UnitId);
            return View(ship);
        }

        // GET: Ships/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ship = await _context.Ships.FindAsync(id);
            if (ship == null)
            {
                return NotFound();
            }
            ViewData["NewShipId"] = new SelectList(_context.Ships, "ShipId", "Name", ship.NewShipId);
            ViewData["ShipPrefixId"] = new SelectList(_context.ShipPrefixes, "ShipPrefixId", "ShipPrefix1", ship.ShipPrefixId);
            ViewData["UnitId"] = new SelectList(_context.Units, "UnitId", "RankSymbol", ship.UnitId);
            return View(ship);
        }

        // POST: Ships/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("ShipId,UnitId,ShipPrefixId,Name,Hcs,Hcsnumber,PennantCode,PennantNumber,IsBase,AltName,AltHcs,AltHcsnumber,IsInactive,NewShipId,Commissioned,Decommissioned,ShipClassId")] Ship ship)
        {
            if (id != ship.ShipId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(ship);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ShipExists(ship.ShipId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["NewShipId"] = new SelectList(_context.Ships, "ShipId", "Name", ship.NewShipId);
            ViewData["ShipPrefixId"] = new SelectList(_context.ShipPrefixes, "ShipPrefixId", "ShipPrefix1", ship.ShipPrefixId);
            ViewData["UnitId"] = new SelectList(_context.Units, "UnitId", "RankSymbol", ship.UnitId);
            return View(ship);
        }

        // GET: Ships/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ship = await _context.Ships
                .Include(s => s.NewShip)
                .Include(s => s.ShipPrefix)
                .Include(s => s.Unit)
                .FirstOrDefaultAsync(m => m.ShipId == id);
            if (ship == null)
            {
                return NotFound();
            }

            return View(ship);
        }

        // POST: Ships/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            var ship = await _context.Ships.FindAsync(id);
            _context.Ships.Remove(ship);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ShipExists(Guid id)
        {
            return _context.Ships.Any(e => e.ShipId == id);
        }
    }
}
