namespace _13.XslTransform
{
    using System;
    using System.Xml.Xsl;

    public class XslTransform
    {
        public static void Main()
        {
            XslCompiledTransform xslt = new XslCompiledTransform();
            xslt.Load("../../catalogue.xsl");
            xslt.Transform("../../../catalogue.xml", "../../catalogue.html");
        }
    }
}