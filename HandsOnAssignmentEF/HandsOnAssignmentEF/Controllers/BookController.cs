using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using HandsOnAssignmentEF.Entities;
using HandsOnAssignmentEF.Repository;

namespace HandsOnAssignmentEF.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : ControllerBase
    {
        private BookRepository bookRepository;

        public BookController(BookRepository bookRepository)
        {
            this.bookRepository = bookRepository;
        }

        [HttpPost,Route("AddBook")]
        public IActionResult AddBook(Book book)
        {
            try
            {
                bookRepository.AddBook(book);
                return Ok(book);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpGet,Route("GetAllBooks")]
        public IActionResult GetAllBooks()
        {
            try
            {
                return Ok(bookRepository.GetAllBooks());
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpDelete,Route("DeleteBook/{id}")]
        public IActionResult DeleteBook(int id)
        {
            try
            {
                bookRepository.DeleteBook(id);
                return Ok("Book Deleted");
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpPut,Route("EditBook")]
        public IActionResult EditBook(Book book)
        {
            try
            {
                bookRepository.EditBook(book);
                return Ok(book);
            }
            catch (Exception)
            {

                throw;
            }
        }
        [HttpGet, Route("GetBooksByAuthor/{author}")]
        public IActionResult GetBooksByAuthor(string author)
        {
            try
            {
                return Ok(bookRepository.GetBooksByAuthor(author));
            }
            catch (Exception)
            {

                throw;
            }
        }
        [HttpGet, Route("GetBooksByLang/{lang}")]
        public IActionResult GetBooksByLang(string lang) 
        {
            try
            {
                return Ok(bookRepository.GetBooksByLang(lang));
            }
            catch (Exception)
            {

                throw;
            }
        }
        [HttpGet, Route("GetBooksByYear/{year}")]
        public IActionResult GetBooksByYear(int year)
        {
            try
            {
                return Ok(bookRepository.GetBooksByYear(year)); 
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
