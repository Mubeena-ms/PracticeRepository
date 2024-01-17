using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace HandsOnAssignmentEF.Entities
{
    public class Book
    {
        [Key] //set id as the pk
        [DatabaseGenerated(DatabaseGeneratedOption.None)] //disable the identity
        public int BookId { get; set; }

        [Required] //set not null constraint
        [Column("BookName", TypeName = "varchar")]
        [StringLength(30)]
        public string? BookName { get; set; }

        [Column("Price", TypeName = "int")]
        public int Price { get; set; }

        [Column("Author", TypeName = "varchar")]
        [StringLength(30)]
        public string? Author { get; set; }

        [Column("Language", TypeName = "varchar")]
        [StringLength(30)]
        public string? Lang { get; set; }

        [Column(TypeName = "Date")]
        public DateTime ReleaseDate { get; set; }

    }
}
