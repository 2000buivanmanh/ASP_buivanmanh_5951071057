using BuiVanManh_5951071057_CRUD.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace BuiVanManh_5951071057_CRUD.Controllers
{
    public class HomeController : Controller
    {
        db dbop = new db();
        string msg;
        public IActionResult Index()
        {
            Employee emp = new Employee();
            emp.Flag = "get";
            DataSet ds = dbop.Empget(emp, out msg);
            List<Employee> list = new List<Employee>();
            foreach(DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Employee
                {
                    Srno = Convert.ToInt32(dr["Srno"]),
                    EmpName = dr["EmpName"].ToString(),
                    City = dr["City"].ToString(),
                    State = dr["State"].ToString(),
                    Country = dr["country"].ToString(),
                   Departmant = dr["Departmant"].ToString(),

                });
            }
            return View(list);
        }

        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create([Bind] Employee emp)
        {
            try
            {
                emp.Flag = "insert";
                dbop.Empdml(emp, out msg);
                TempData["msg"] = msg;
            }
            catch (Exception ex)
            {
                TempData["msg"] = ex.Message;
            }
            return RedirectToAction("Index");
        }

        
        public IActionResult Edit(int id)
        {
            Employee emp = new Employee();
            emp.Srno = id;
            emp.Flag = "getid";
            DataSet ds = dbop.Empget(emp, out msg);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                emp.Srno = Convert.ToInt32(dr["Srno"]);
                emp.EmpName = dr["EmpName"].ToString();
                emp.City = dr["City"].ToString();
                emp.City = dr["State"].ToString();
                emp.Country = dr["country"].ToString();
                emp.Departmant = dr["Departmant"].ToString();
            }
            return View(emp);
        }
        [HttpPost]
        public IActionResult Edit(int id, [Bind] Employee emp)
        {
            try
            {
                emp.Srno = id;
                emp.Flag = "update";
                dbop.Empdml(emp, out msg);
                TempData["msg"] = msg;
           }
            catch (Exception ex)
            {
                TempData["msg"] = ex.Message;
            }
            return RedirectToAction("Index");
        }
        [HttpPost]
        public IActionResult Delete(int id, [Bind] Employee emp)
        {
            try
            {
                emp.Srno = id;
                emp.Flag = "delete";
                dbop.Empdml(emp, out msg);
                TempData["msg"] = msg;
            }
            catch (Exception ex)
            {
                TempData["msg"] = ex.Message;
            }
            return RedirectToAction("Index");
        }
    }
}
