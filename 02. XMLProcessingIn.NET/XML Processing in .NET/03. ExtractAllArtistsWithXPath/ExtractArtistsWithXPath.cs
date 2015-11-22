namespace _03.ExtractAllArtistsWithXPath
{
    using System;
    using System.Collections.Generic;
    using System.Xml;

    public class ExtractArtistsWithXPath
    {
        public static void Main()
        {
            XmlDocument document = new XmlDocument();
            document.Load("../../../Catalogue.xml");

            XmlNodeList artists = document.SelectNodes("catalogue/album/artist");

            ExtractAllArtistsAndTheirNumberOfAlbums(artists);
        }

        private static void ExtractAllArtistsAndTheirNumberOfAlbums(XmlNodeList nodeList)
        {
            Dictionary<string, int> artistsList = new Dictionary<string, int>();

            foreach (XmlNode artist in nodeList)
            {
                if (artistsList.ContainsKey(artist.InnerText))
                {
                    artistsList[artist.InnerText]++;
                }
                else
                {
                    artistsList.Add(artist.InnerText, 1);
                }
            }

            foreach (var artist in artistsList)
            {
                Console.WriteLine("{0} has {1} albums.", artist.Key, artist.Value);
            }
        }
    }
}
