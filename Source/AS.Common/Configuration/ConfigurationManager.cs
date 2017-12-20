using System.Configuration;
using AS.Common.Abstractions;

namespace AS.Common.Configuration
{
    public class DefaultConfigurationManager : IConfigurationManager
    {
        public string Load(string key)
        {
            return Load(key, null);
        }

        public string Load(string key, string defaultValue)
        {
            var configValue = ConfigurationManager.AppSettings[key];

            if (string.IsNullOrEmpty(configValue))
            {
                if (defaultValue == null)
                {
                    throw new ConfigurationNotFoundException($"Config dosyasında '{key}' parametresi bulunamadı.");
                }
                return defaultValue;
            }
            return configValue;
        }
    }
}