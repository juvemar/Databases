namespace _04.DeleteAllAlbums
{
    using System;
    using System.Xml;
    using System.Globalization;
    using System.Collections.Generic;

    public class DeleteAlbums
    {
        public static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../Catalogue.xml");

            XmlNode node = doc.DocumentElement;

            DeleteAlbumsWithPriceLessThan20(node);

            doc.Save("../../updatedCatalogue.xml");
        }

        private static void DeleteAlbumsWithPriceLessThan20(XmlNode node)
        {
            var nodeList = node.ChildNodes;
            List<XmlNode> nodesToDelete = new List<XmlNode>();

            foreach (XmlNode album in nodeList)
            {
                float currentAlbumPrice = float.Parse(album["price"].InnerText, CultureInfo.InvariantCulture);
                
                if (currentAlbumPrice < 20.0)
                {
                    nodesToDelete.Add(album);
                }
            }

            foreach (XmlNode album in nodesToDelete)
            {
                Console.WriteLine("Album called \"{0}\"'s price is {1} so it was deleted.", album["name"].InnerText, album["price"].InnerText);
                node.RemoveChild(album);
            }
        }
    }
}
