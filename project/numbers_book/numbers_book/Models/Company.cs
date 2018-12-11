using System;
using System.Collections.Generic;

namespace numbers_book.Models
{
    public partial class Company
    {
        public Company()
        {
            Numbers = new HashSet<Numbers>();
        }

        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public string CompanySite { get; set; }
        public string CompanyTelephone { get; set; }

        public virtual ICollection<Numbers> Numbers { get; set; }
    }
}
