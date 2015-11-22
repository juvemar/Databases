namespace JSONProcessing
{
    using Newtonsoft.Json;
    using Newtonsoft.Json.Linq;
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Net;
    using System.Text;
    using System.Xml;

    public class ParseJSON
    {
        //Uncomment Console.WriteLine()'s to view results :)

        private const string urlYouTube = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLC-vbm7OWvpbqzXaoAMGGw";

        public static void Main()
        {
            var content = DownloadContent();
            //Console.WriteLine(content);

            var jsonObj = ParseXmlToJson();
            //Console.WriteLine(jsonObj);

            PrintAllVideoTitles();

            var videos = ParseVideosToPoco();

            //06. Task - Using the POCOs create a HTML page that shows all videos from the RSS
            CreateHtml(videos);
        }

        //02. Task - Download the content of the feed programatically
        private static string DownloadContent()
        {
            WebClient client = new WebClient();
            var data = client.DownloadData(urlYouTube);
            string content = Encoding.UTF8.GetString(data);

            return content;
        }

        //03. Task - Parse the XML from the feed to JSON
        private static JObject ParseXmlToJson()
        {
            var content = DownloadContent();

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(content);
            var jsonConv = JsonConvert.SerializeXmlNode(xmlDoc, Newtonsoft.Json.Formatting.Indented);
            JObject jsonObj = JObject.Parse(jsonConv);

            return jsonObj;
        }

        //04. Task - Using LINQ-to-JSON select all the video titles and print them on the console
        private static void PrintAllVideoTitles()
        {
            var jsonObj = ParseXmlToJson();

            var titles = jsonObj["feed"]["entry"].Select(e => e["title"]);
            foreach (var title in titles)
            {
                //Console.WriteLine(title);
            }
        }

        //05. Task - Parse the videos' JSON to POCO
        private static IEnumerable<Video> ParseVideosToPoco()
        {
            var jsonObj = ParseXmlToJson();

            var videos = jsonObj["feed"]["entry"].Select(video => JsonConvert.DeserializeObject<Video>(video.ToString()));

            return videos;
        }

        private static void CreateHtml(IEnumerable<Video> videos)
        {
            StringBuilder html = new StringBuilder();

            html.Append("<!DOCTYPE html><html><body><div><h2>All videos:</h2><ul>");

            foreach (Video video in videos)
            {
                html.AppendFormat("<li><h3>Title: {0}</h3><h3>Description: {1}</h3><h3>Duration: {2}</h3></li>"
                    , video.Title, video.Description, video.Duration);
            }

            html.Append("</ul></div></body>");

            using (StreamWriter writer = new StreamWriter("../../index.html", false, Encoding.UTF8))
            {
                writer.Write(html);
                writer.Close();
            }

            Console.WriteLine("index.html was created.");
        }
    }
}
