using HandsOnEfDemo2.Entities;

namespace HandsOnEfDemo2.Repository
{
    public class StudentRepository : IRepository<Student>
    {
        private readonly MyContext _context;

        public StudentRepository(MyContext context)
        {
            _context = context;
        }

        public void Add(Student entity)
        {
            _context.Students.Add(entity);
            _context.SaveChanges();
        }

        public void Delete(int id)
        {
            Student student = _context.Students.Find(id);
            _context.Students.Remove(student);
            _context.SaveChanges();
        }

        public List<Student> GetAll()
        {
            return _context.Students.ToList();
        }

        public Student GetById(int id)
        {
            return _context.Students.Find(id);
        }

        public void Update(Student entity)
        {
            _context.Update(entity);
            _context.SaveChanges();
        }
    }
}
