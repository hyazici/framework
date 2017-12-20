using System;

namespace AS.Common.Exceptions
{
    /// <summary>
    /// Action çalıştırılma anında yetkisi olup olmadığı kontrol edilir yoksa hata veriyoruz.
    /// </summary>
    [Serializable]
    public class NotAuthorizationActionException : Exception
    {
        public NotAuthorizationActionException(string message)
            : base(message)
        {
        }

        public NotAuthorizationActionException(string message, Exception innerException)
            : base(message, innerException)
        {
        }

        public NotAuthorizationActionException() : base()
        {
        }
    }
}