namespace HandsOnAssignmentEF.Repository
{
    public interface IRepository
    {
        public interface IRepository<T> where T: class
        {
            void AddBook(T entity);

            List<T> GetAllBooks();

            List<T> GetBooksByAuthor(string Autor);

            List<T> GetBooksByLang(string lang);

            List<T> GetBooksByYear(int year);

            void EditBook(T entity);

            void DeleteBook(int bookId);
        }
    }
}
