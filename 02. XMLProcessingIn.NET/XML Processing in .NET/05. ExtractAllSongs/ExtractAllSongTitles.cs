namespace _05.ExtractAllSongs
{
    using System;
    using System.Xml;

    public class ExtractAllSongTitles
    {
        public static void Main()
        {
            using (XmlReader reader = XmlReader.Create("../../../Catalogue.xml"))
            {
                while (reader.Read())
                {
                    if (reader.Name == "title")
                    {
                        Console.WriteLine(reader.ReadInnerXml());                        
                    }
                }
            }
        }
    }
}
