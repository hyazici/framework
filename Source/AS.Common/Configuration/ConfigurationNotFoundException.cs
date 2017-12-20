using System;

namespace AS.Common.Configuration
{
    [Serializable]
    public class ConfigurationNotFoundException : Exception
    {
        public ConfigurationNotFoundException(string message)
            : base(message)
        {
        }
    }
}