namespace AS.Business.Abstractions
{
    public interface IRememberBusiness
    {
        void SendLog(string body);

        void SendRemember(string email);
    }
}