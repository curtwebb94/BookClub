using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace BookClub.Models
{
    
        public class User
        {
            public int UserID { get; set; }

            [Required(ErrorMessage = "Username is required")]
            public string Username { get; set; }

            [Required(ErrorMessage = "Email is required")]
            public string Email { get; set; }

            [Required(ErrorMessage = "PasswordHash is required")]
            public string PasswordHash { get; set; }
        }
 }

