using System.Collections.Generic;
using System.Configuration;
using System.Web.Configuration;
using AS.Common.Abstractions;
using AS.Models.SubModels;

namespace AS.Common.Configuration
{
    public class WebConfigProvider : IWebConfigProvider
    {
        public List<WebParameter> GetAll()
        {
            List<WebParameter> lst = new List<WebParameter>();

            var configuration = WebConfigurationManager.OpenWebConfiguration("~");
            // var section = (AppSettingsSection)configuration.GetSection("appSettings");
            foreach (KeyValueConfigurationElement setting in configuration.AppSettings.Settings)
            {
                if (setting.Key == "webpages:Version" || setting.Key == "webpages:Enabled" || setting.Key == "ClientValidationEnabled" || setting.Key == "UnobtrusiveJavaScriptEnabled")
                {
                    continue;
                }

                WebParameter param = new WebParameter
                {
                    Key = setting.Key,
                    Value = setting.Value
                };
                lst.Add(param);
            }

            return lst;
        }

        public bool Save(List<WebParameter> lstObj)
        {
            var configuration = WebConfigurationManager.OpenWebConfiguration("~");
            foreach (KeyValueConfigurationElement setting in configuration.AppSettings.Settings)
            {
                if (setting.Key == "webpages:Version" || setting.Key == "webpages:Enabled" || setting.Key == "ClientValidationEnabled" || setting.Key == "UnobtrusiveJavaScriptEnabled")
                {
                    continue;
                }
                setting.Value = GetValue(lstObj, setting.Key);
                configuration.AppSettings.Settings[setting.Key].Value = setting.Value;
            }
            // configuration.Save();
            configuration.Save(ConfigurationSaveMode.Modified);
            // reload the config file so the new values are available

            ConfigurationManager.RefreshSection(configuration.AppSettings.SectionInformation.Name);

            return true;
        }

        public string GetValue(List<WebParameter> lst, string key)
        {
            WebParameter param = new WebParameter();
            for (int i = 0; i < lst.Count; i++)
            {
                if (lst[i].Key == key)
                {
                    param = lst[i];
                    break;
                }
            }
            return param.Value;
        }
    }
}