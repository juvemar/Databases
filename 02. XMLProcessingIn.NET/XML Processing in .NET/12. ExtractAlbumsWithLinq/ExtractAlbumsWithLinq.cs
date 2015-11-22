namespace _12.ExtractAlbumsWithLinq
{
    using System;
    using System.Xml;
    using System.Xml.Linq;
    using System.Linq;

    public class ExtractAlbumsWithLinq
    {
        public static void Main()
        {
            XDocument doc = XDocument.Load("../../../catalogue.xml");

            var prices =
                from album in doc.Descendants("album")
                where int.Parse(album.Element("year").Value) < 2010
                select new
                {
                    Album = album.Element("price").Value,
                };

            foreach (var item in prices)
            {
                Console.WriteLine(item);
            }
        }
    }
}
