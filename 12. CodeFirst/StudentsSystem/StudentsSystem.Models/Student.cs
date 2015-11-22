namespace StudentsSystem.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Student
    {
        private ICollection<Homework> homeworks;
        private ICollection<Course> courses;

        public Student()
        {
            this.homeworks = new HashSet<Homework>();
        }

        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        [MaxLength(450)]
        [Index(IsUnique = true)]
        public string Number { get; set; }

        public virtual ICollection<Course> Courses
        {
            get
            {
                return this.courses;
            }

            set
            {
                this.courses = value;
            }
        }
    }
}
