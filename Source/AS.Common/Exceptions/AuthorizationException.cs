using System;

namespace AS.Common.Exceptions
{
    /// <summary>
    /// Yetkisiz işlemlerde kullanılacak.
    /// </summary>
    [Serializable]
    public class AuthorizationException : Exception
    {
        public AuthorizationException(string message)
            : base(message)
        {
        }

        public AuthorizationException(string message, Exception innerException)
            : base(message, innerException)
        {
        }

        public AuthorizationException() : base()
        {
        }
    }
}