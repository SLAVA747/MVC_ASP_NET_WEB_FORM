using System;
using System.Collections.Generic;

namespace numbers_book.Models
{
    public partial class Post
    {
        public Post()
        {
            Numbers = new HashSet<Numbers>();
        }

        public int PostId { get; set; }
        public string PostName { get; set; }
        public string PostContacts { get; set; }
        public string PostTypeContacts { get; set; }

        public virtual ICollection<Numbers> Numbers { get; set; }
    }
}
