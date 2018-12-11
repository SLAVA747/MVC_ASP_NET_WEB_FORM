using System;
using System.Collections.Generic;

namespace numbers_book.Models
{
    public partial class Numbers
    {
        public int IdNumber { get; set; }
        public int EmployeesId { get; set; }
        public int PostId { get; set; }
        public int CompanyId { get; set; }

        public virtual Company Company { get; set; }
        public virtual Employees Employees { get; set; }
        public virtual Post Post { get; set; }
    }
}
