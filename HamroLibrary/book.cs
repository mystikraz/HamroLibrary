//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HamroLibrary
{
    using System;
    using System.Collections.Generic;
    
    public partial class book
    {
        public int Id { get; set; }
        public string name { get; set; }
        public Nullable<decimal> isbn { get; set; }
        public Nullable<decimal> qty { get; set; }
        public string shelfno { get; set; }
        public Nullable<System.DateTime> published_date { get; set; }
        public string edition { get; set; }
        public Nullable<int> author_id { get; set; }
        public string restriction_level { get; set; }
        public Nullable<int> publisher_id { get; set; }
    
        public virtual author author { get; set; }
        public virtual publisher publisher { get; set; }
    }
}
