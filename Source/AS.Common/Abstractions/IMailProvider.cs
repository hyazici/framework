namespace AS.Common.Abstractions
{
    public interface IMailProvider
    {
        void Send(string subject, string to, string body);
    }
}