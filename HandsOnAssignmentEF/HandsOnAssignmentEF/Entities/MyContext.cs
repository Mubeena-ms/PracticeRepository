using Microsoft.EntityFrameworkCore;
namespace HandsOnAssignmentEF.Entities
{
    public class MyContext:DbContext
    {
        private readonly IConfiguration configuration;

        public MyContext(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public DbSet<Book> Books { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.UseSqlServer(@"Data Source=RMPLC4CE8361809\SQL2022;Initial Catalog=BookDB;Persist Security Info=True;User ID=SA;Password=Password123.;Trust Server Certificate=True");
            optionsBuilder.UseSqlServer(configuration.GetConnectionString("MyConnection"));
        }

    }
}
