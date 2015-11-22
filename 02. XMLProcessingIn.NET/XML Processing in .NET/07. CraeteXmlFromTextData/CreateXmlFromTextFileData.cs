namespace CraeteXmlFromTextData
{
    using System;
    using System.Xml;
    using System.Text;
    using System.IO;

    public class CreateXmlFromTextFileData
    {
        public static void Main()
        {
            string personName = "";
            string personAddress = "";
            string personPhoneNumber = "";

            using (StreamReader reader = new StreamReader("../../PersonInfo.txt"))
            {
                string nameLine = reader.ReadLine();
                int indexOfDotsName = nameLine.IndexOf(':');
                personName = nameLine.Substring(indexOfDotsName + 2, nameLine.Length - (indexOfDotsName + 2));
                Console.WriteLine("Person's name: " + personName);

                string addressLine = reader.ReadLine();
                int indexOfDotsAddress = addressLine.IndexOf(':');
                personAddress = addressLine.Substring(indexOfDotsAddress + 2, addressLine.Length - (indexOfDotsAddress + 2));
                Console.WriteLine("Person's address: " + personAddress);

                string phoneNumberLine = reader.ReadLine();
                int indexOfDotsPhoneNumber = phoneNumberLine.IndexOf(':');
                personPhoneNumber = phoneNumberLine.Substring(indexOfDotsPhoneNumber + 2, phoneNumberLine.Length - (indexOfDotsPhoneNumber + 2));
                Console.WriteLine("Person's phone number: " + personPhoneNumber);
            }

            string fileName = "../../PersonInfo.xml";
            using (XmlTextWriter writer = new XmlTextWriter(fileName, Encoding.UTF8))
            {
                writer.Formatting = Formatting.Indented;
                writer.Indentation = 1;
                writer.IndentChar = ' ';

                writer.WriteStartDocument();
                writer.WriteStartElement("person");
                writer.WriteElementString("name", personName);
                writer.WriteElementString("address", personAddress);
                writer.WriteElementString("phoneNumber", personPhoneNumber);
                writer.WriteEndElement();
                writer.WriteEndDocument();
                Console.WriteLine("\nPersonInfo.xml was created.");
            }
        }
    }
}
