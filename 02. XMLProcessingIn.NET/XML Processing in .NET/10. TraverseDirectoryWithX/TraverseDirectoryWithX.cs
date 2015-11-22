namespace _10.TraverseDirectoryWithX
{
    using System;
    using System.IO;
    using System.Xml.Linq;

    public class TraverseDirectoryWithX
    {
        public static void Main()
        {
            string directory = 
                "D:\\TelerikAcademy\\Visual Studio 2013\\Projects\\Databases\\02. XMLProcessingIn.NET\\XML Processing in .NET\\10. TraverseDirectoryWithX";
            var rootDirectory = new DirectoryInfo(directory);

            XElement directoryInfo = new XElement("root");
            directoryInfo.Add(TraverseDirectory(rootDirectory));

            directoryInfo.Save("../../directoryInfo.xml");
        }

        private static XElement TraverseDirectory(DirectoryInfo directory)
        {
            var el = new XElement("dir", new XAttribute("path", directory.Name));
            foreach (var dir in directory.GetDirectories())
            {
                el.Add(TraverseDirectory(dir));
            }

            foreach (var file in directory.GetFiles())
            {
                el.Add(new XElement("file", new XAttribute("name", file.Name)));
            }

            return el;
        }
    }
}
