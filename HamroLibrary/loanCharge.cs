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
    
    public partial class loanCharge
    {
        public int charge_id { get; set; }
        public int minday { get; set; }
        public int maxday { get; set; }
        public Nullable<double> charge_amount { get; set; }
        public Nullable<int> loan_id { get; set; }
    
        public virtual Loan Loan { get; set; }
    }
}