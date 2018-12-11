using System;
using System.Collections.Generic;

namespace numbers_book.Models
{
    public partial class Employees
    {
        public Employees()
        {
            Numbers = new HashSet<Numbers>();
        }

        public int EmployeesId { get; set; }
        public string EmployeesFullNames { get; set; }
        public DateTime EmployeesDate { get; set; }

        public virtual ICollection<Numbers> Numbers { get; set; }
    }
}
