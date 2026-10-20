using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.PDFtoImage
{
    /// <summary>
    /// Query options for the PDF to Image API
    /// </summary>
    public class PDFtoImageQueryOptions
    {
        /// <summary>
        /// The PDF file to render (up to 10 MB), or a public PDF URL
        /// </summary>
        [JsonProperty("pdf")]
        public string Pdf { get; set; }

        /// <summary>
        /// Pages to render, as numbers and ranges such as 1-3,5; at most 10 per call on paid plans, 1 on the Free plan
        /// </summary>
        [JsonProperty("pages")]
        public string Pages { get; set; }

        /// <summary>
        /// Image format
        /// </summary>
        [JsonProperty("format")]
        public string Format { get; set; }

        /// <summary>
        /// JPG quality from 1 to 100; ignored for PNG
        /// </summary>
        [JsonProperty("quality")]
        public int? Quality { get; set; }

        /// <summary>
        /// Resolution in dots per inch, from 72 to 300
        /// </summary>
        [JsonProperty("dpi")]
        public int? Dpi { get; set; }
    }
}
