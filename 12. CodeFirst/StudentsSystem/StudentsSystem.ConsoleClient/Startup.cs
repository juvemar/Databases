namespace StudentsSystem.ConsoleClient
{
    using System.Data.Entity;
    using System.Linq;
    using StudentsSystem.Data;
    using StudentsSystem.Data.Migrations;

    public class Startup
    {
        public static void Main()
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<StudentsSystemDbContext, Configuration>());

            var db = new StudentsSystemDbContext();

            db.Courses.Count();
        }
    }
}
