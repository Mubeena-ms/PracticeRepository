using Microsoft.EntityFrameworkCore;

namespace HandsOnEfDemo2.Entities
{
    public class MyContext:DbContext
    {
        private readonly IConfiguration configuration;

        public MyContext(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public DbSet<Student> Students { get; set; }
        public DbSet<Marks> Marks { get; set; }
        
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.UseSqlServer(@"Data Source=RMPLC4CE8361809\SQL2022;Initial Catalog=SMSDB;Persist Security Info=True;User ID=SA;Password=Password123.;Trust Server Certificate=True");
            optionsBuilder.UseSqlServer(configuration.GetConnectionString("MyConnection"));
        }
    }
}
