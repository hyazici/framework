using System;

namespace AS.Common.Exceptions
{
    /// <summary>
    /// Login sırasında hata olduğunda bunu gönderiyoruz.
    /// </summary>
    [Serializable]
    public class AuthenticationException : Exception
    {
        public AuthenticationException(string message)
            : base(message)
        {
        }

        public AuthenticationException(string message, Exception innerException)
            : base(message, innerException)
        {
        }

        public AuthenticationException() : base()
        {
        }
    }
}