namespace _08.ReadCatalogueCreateAlbum
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    using System.Xml;

    public class ReadCatalogueCreateAlbum
    {
        public static void Main()
        {
            Dictionary<string, string> albums = new Dictionary<string, string>();

            using (XmlReader reader = XmlReader.Create("../../../Catalogue.xml"))
            {
                while (reader.Read())
                {
                    if (reader.Name == "name")
                    {
                        string currentAlbumName = reader.ReadElementString();
                        reader.Read();
                        string currentArtist = reader.ReadElementString();
                        albums[currentAlbumName] = currentArtist;
                    }
                }
            }

            string fileName = "../../album.xml";
            using (XmlTextWriter writer = new XmlTextWriter(fileName, Encoding.UTF8))
            {
                writer.Formatting = Formatting.Indented;
                writer.IndentChar = '\t';
                writer.Indentation = 1;

                writer.WriteStartDocument();
                writer.WriteStartElement("catalog");
                foreach (var item in albums)
                {
                    writer.WriteStartElement("album");
                    writer.WriteElementString("title", item.Key);
                    writer.WriteElementString("artist", item.Value);
                    writer.WriteEndElement();
                }
                writer.WriteEndElement();
                writer.WriteEndDocument();
            }
        }
    }
}