using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Liaison.Web.AspTS.Controllers
{
    public class ControllerBase: Controller
    {
        // private readonly LiaisonWebAspTSContext _context;
        internal Liaison.Data.SqlEFCore.Edmx.LiaisonContext _context;
    }
}