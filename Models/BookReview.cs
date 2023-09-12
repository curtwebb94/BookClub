using System.ComponentModel.DataAnnotations;

namespace BookClub.Models
{
    public class BookReview
    {
        public int ReviewID { get; set; }

        [Required(ErrorMessage = "BookID is required")]
        public int BookID { get; set; }

        [Required(ErrorMessage = "UserID is required")]
        public int UserID { get; set; }

        [Required(ErrorMessage = "ReviewText is required")]
        public string ReviewText { get; set; }

        [Required(ErrorMessage = "Rating is required")]
        public int Rating { get; set; }
    }
}
