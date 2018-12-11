using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using numbers_book.Models;

namespace numbers_book.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            TB_DBContext db = new TB_DBContext();
            var num_info = (from a in db.Numbers
                            join b in db.Company on a.CompanyId equals b.CompanyId
                            select new
                            {
                            a
                            }).ToList();
            ViewBag.myresult = num_info;

            return View(db);
        }
    }
}
