namespace _06.ExtractSongTitlesWithXDocument
{
    using System;
    using System.Xml.Linq;
    using System.Linq;

    public class ExtractSongTitlesWithXDocument
    {
        public static void Main()
        {
            XDocument doc = XDocument.Load("../../../Catalogue.xml");

            var albums = doc.Element("catalogue")
                .Elements("album");

            var titles =
                from title in albums.Descendants("title")
                select title.Value;

            foreach (var title in titles)
            {
                Console.WriteLine(title);
            }
        }
    }
}
