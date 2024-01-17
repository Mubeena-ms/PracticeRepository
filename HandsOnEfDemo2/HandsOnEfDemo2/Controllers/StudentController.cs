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
        private StudentRepository studentRepository;

        public StudentController(StudentRepository studentRepository)
        {
            this.studentRepository = studentRepository;
        }
        

        [HttpPost,Route("ADDStudent")]
        public IActionResult Add(Student student)
        {
            try
            {
                studentRepository.Add(student);
                return Ok(student);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpGet,Route("GetAllStudents")]
        public IActionResult GetAll()
        {
            try
            {
                return Ok(studentRepository.GetAll());
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpGet, Route("GetStudentById/{id}")]
        public IActionResult GetById(int id) 
        {
            try
            {
                return Ok(studentRepository.GetById(id));
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpDelete, Route("DeleteStudent/{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                studentRepository.Delete(id);
                return Ok("Student Deleted");
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpPut, Route("EditStudent")]
        public IActionResult Update(Student student)
        {
            try
            {
                studentRepository.Update(student);
                return Ok(student);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
