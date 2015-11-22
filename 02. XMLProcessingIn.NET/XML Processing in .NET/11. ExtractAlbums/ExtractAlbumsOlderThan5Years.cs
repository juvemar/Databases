namespace _11.ExtractAlbums
{
    using System;
    using System.Xml;

    public class ExtractAlbumsOlderThan5Years
    {
        static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../Catalogue.xml");

            string path = "/catalogue/album[year<2010]/price";

            XmlNodeList allAlbums = doc.SelectNodes(path);

            foreach (XmlElement album in allAlbums)
            {
                Console.WriteLine(album.InnerText);
            }
        }
    }
}
