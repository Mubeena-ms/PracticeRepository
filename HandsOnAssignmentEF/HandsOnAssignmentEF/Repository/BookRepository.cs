using HandsOnAssignmentEF.Entities;
using static HandsOnAssignmentEF.Repository.IRepository;

namespace HandsOnAssignmentEF.Repository
{
    public class BookRepository: IRepository<Book>
    {
        private readonly MyContext _context;

        public BookRepository(MyContext context)
        {
            _context = context;
        }

        public void AddBook(Book entity)
        {
            try
            {
                _context.Books.Add(entity);
                _context.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void DeleteBook(int bookId)
        {
            try
            {
                _context.Books.Remove(_context.Books.Find(bookId));
                _context.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void EditBook(Book entity)
        {
            try
            {
                _context.Books.Update(entity);
                _context.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Book> GetAllBooks()
        {
            try
            {
                return _context.Books.ToList();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Book> GetBooksByAuthor(string Autor)
        {
            try
            {
                List<Book> books = (from  book in _context.Books
                                    where book.Author == Autor
                                    select book).ToList();
                return books;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Book> GetBooksByLang(string lang)
        {
            try
            {
                List<Book> books = (from book in _context.Books
                                    where book.Lang == lang
                                    select book).ToList();
                return books;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Book> GetBooksByYear(int year)
        {
            try
            {
                List<Book> books =(from book in _context.Books
                                   where book.ReleaseDate.Year.Equals(year)
                                   select book).ToList();   
                return books;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
