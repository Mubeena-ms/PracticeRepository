using EntityFramework.Entity;
using EntityFramework.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EntityFramework.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MarksController : ControllerBase
    {
        private MarksRepository marksRepository;

        public MarksController(MarksRepository marksRepository)
        {
            this.marksRepository = marksRepository;
        }

        [HttpPost, Route("AddMarks")]
        public IActionResult Add(Marks marks)
        {
            marks.MarksId = Guid.NewGuid();
            marksRepository.Add(marks);
            return Ok(marks);
        }
    }
}
