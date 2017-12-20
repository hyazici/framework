using System;

namespace AS.Common.Exceptions
{
    /// <summary>
    /// Login sırasında hata olduğunda bunu gönderiyoruz.
    /// </summary>
    [Serializable]
    public class NotificationException : Exception
    {
        public NotificationException(string message)
            : base(message)
        {
        }

        public NotificationException(string message, Exception innerException)
            : base(message, innerException)
        {
        }

        public NotificationException() : base()
        {
        }
    }
}