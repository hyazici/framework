using System.Web;

namespace AS.Utilities
{
    public static class HttpRequestExtensions
    {
        #region GetCurrentIP

        public static string GetCurrentIP(this HttpContextBase contextBase)
        {
            return contextBase.Request.GetCurrentIP();
        }

        public static string GetCurrentIP(this HttpRequestBase request)
        {
            if (request == null)
                return string.Empty;
            string ipAddress = request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    if (addresses[0].Contains(":"))
                        return addresses[0].Split(':')[0];
                    return addresses[0];
                }
            }

            return request.ServerVariables["REMOTE_ADDR"];
        }

        public static string GetCurrentIP(this HttpContext contextBase)
        {
            return contextBase.Request.GetCurrentIP();
        }

        public static string GetCurrentIP(this HttpRequest request)
        {
            if (request == null)
                return string.Empty;
            string ipAddress = request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    if (addresses[0].Contains(":"))
                        return addresses[0].Split(':')[0];
                    return addresses[0];
                }
            }

            return request.ServerVariables["REMOTE_ADDR"];
        }

        #endregion GetCurrentIP

        #region GetCurrentClientName

        public static string GetCurrentClientName(this HttpContextBase contextBase)
        {
            return contextBase.Request.GetCurrentClientName();
        }

        public static string GetCurrentClientName(this HttpRequestBase request)
        {
            return System.Net.Dns.GetHostName();
        }

        public static string GetCurrentClientName(this HttpContext contextBase)
        {
            return contextBase.Request.GetCurrentClientName();
        }

        public static string GetCurrentClientName(this HttpRequest request)
        {
            return System.Net.Dns.GetHostName();
        }

        #endregion GetCurrentClientName
    }
}
