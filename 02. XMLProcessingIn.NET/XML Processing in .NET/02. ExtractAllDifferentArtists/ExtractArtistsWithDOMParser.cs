namespace _02.ExtractAllDifferentArtists
{
    using System;
    using System.Collections.Generic;
    using System.Xml;

    public class ExtractArtistsWithDOMParser
    {
        public static void Main()
        {
            XmlDocument document = new XmlDocument();
            document.Load("../../../Catalogue.xml");
            Console.WriteLine(document.Name + " loaded");

            XmlElement rootnode = document.DocumentElement;

            ExtractAllArtistsAndTheNumberOfTheirAlbums(rootnode.GetElementsByTagName("artist"));
        }

        private static void ExtractAllArtistsAndTheNumberOfTheirAlbums(XmlNodeList nodeList)
        {
            Console.WriteLine("Extracting artists with DOMParser:");
            Dictionary<string, int> albums = new Dictionary<string, int>();

            foreach (XmlNode album in nodeList)
            {
                if (albums.ContainsKey(album.InnerText))
                {
                    albums[album.InnerText]++;
                }
                else
                {
                    albums.Add(album.InnerText, 1);
                }
            }

            foreach (var artist in albums)
            {
                Console.WriteLine("{0} has {1} albums.", artist.Key, artist.Value);
            }
        }
    }
}
