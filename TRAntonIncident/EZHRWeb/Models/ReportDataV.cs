using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EZHR_Web.Models
{
    public class ReportDataV
    {
        [Display(Name = "Enter Your Date of Birth")]
        public string DOB { get; set; }

        [Display(Name = "Enter Your FirstName")]
        public string Fname { get; set; }

        public string Lang { get; set; }

        [Display(Name = "Enter Your Last Name")]
        public string Lname { get; set; }

        [Display(Name = "Enter Your Phone Number")]
        public string Phone { get; set; }

        [Display(Name = "If you haeve a email address enter it here")]
        public string Email { get; set; }
        [Display(Name = "I do not want my information shared with this report. Uncheck this box to allow us to use you information.")]
        public bool AnonReq { get; set; }
        [Display(Name ="Enter your Employer code or Employer Name")]
        public string Subscriber {get;set;}


    public ReportDataV ()
        {
            Fname = string.Empty;
            Lname = string.Empty;
            Phone = string.Empty;
            Email = string.Empty;
            DOB = null;
            AnonReq = true;
        }
    }
}