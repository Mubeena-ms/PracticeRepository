using HandsOnEfDemo2.Entities;
using HandsOnEfDemo2.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HandsOnEfDemo2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        private IRepository<Student> _studentRepository;

        public StudentController(IRepository<Student> studentRepository)
        {
            _studentRepository = studentRepository;
        }

        [HttpPost,Route("ADDStudent")]
        public IActionResult Add(Student student)
        {
            try
            {
                _studentRepository.Add(student);
                return StatusCode(200, student);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
