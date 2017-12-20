namespace AS.Common.Abstractions
{
    public interface IConfigurationManager
    {
        string Load(string key);

        string Load(string key, string defaultValue);
    }
}