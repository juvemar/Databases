namespace JSONProcessing
{
    using Newtonsoft.Json;

    internal class Video
    {
        [JsonProperty("duration")]
        internal double Duration { get; set; }

        [JsonProperty("title")]
        internal string Title { get; set; }

        [JsonProperty("description")]
        internal string Description { get; set; }
    }
}
