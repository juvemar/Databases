namespace StudentsSystem.Data
{
    using System.Data.Entity;
    using StudentsSystem.Models;

    public class StudentsSystemDbContext : DbContext
    {
        public StudentsSystemDbContext()
            :base("StudentsSystem")
        {
        }

        public virtual IDbSet<Student> Students { get; set; }

        public virtual IDbSet<Course> Courses { get; set; }

        public virtual IDbSet<Homework> Homeworks { get; set; }

        public static StudentsSystemDbContext Create()
        {
            return new StudentsSystemDbContext();
        }
    }
}
