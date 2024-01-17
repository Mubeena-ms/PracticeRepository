using HandsOnEfDemo2.Entities;

namespace HandsOnEfDemo2.Repository
{
    public class MarkRepository:IRepository<Marks>
    {
        private readonly MyContext _context;

        public MarkRepository(MyContext context)
        {
            _context = context;
        }

        public void Add(Marks entity)
        {
            try
            {
                entity.MarkId = Guid.NewGuid();
                _context.Marks.Add(entity);
                _context.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public List<Marks> GetAll()
        {
            throw new NotImplementedException();
        }

        public Marks GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Update(Marks entity)
        {
            throw new NotImplementedException();
        }
    }
}
