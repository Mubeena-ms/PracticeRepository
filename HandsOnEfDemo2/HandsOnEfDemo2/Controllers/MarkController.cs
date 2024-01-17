using HandsOnEfDemo2.Entities;
using HandsOnEfDemo2.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HandsOnEfDemo2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MarkController : ControllerBase
    {
        private MarkRepository _markRepository;

        public MarkController(MarkRepository markRepository)
        {
            _markRepository = markRepository;
        }

        [HttpPost,Route("AddMark")]
        public IActionResult Add(Marks marks)
        {
            try
            {
                _markRepository.Add(marks);
                return Ok(marks);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
