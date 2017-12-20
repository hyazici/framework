namespace AS.Common.Abstractions
{
    public interface IEncrypter
    {
        string Encrypt(string openStr);

        string Decrypt(string encryptedString);

        string UrlEncode(string plainText);

        string UrlDecode(string encryptedString);
    }
}