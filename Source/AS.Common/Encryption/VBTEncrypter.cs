using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using AS.Common.Abstractions;

namespace AS.Common.Encryption
{
    public class VbtEncrypter : IEncrypter
    {
        private string _key;
        private byte[] _bytes;

        public VbtEncrypter(string key, byte[] salt)
        {
            _key = key;
            _bytes = salt;
        }

        public VbtEncrypter()
        {
            _key = "xx&b[m-u797B*YMe/L+YPhKa#(g^g_@fO8Ai|*M:LY#q8>K+YijTItAIa{s7(%]w9aS\\]22_z=34.L+'6Tg(vz{wBXBnt\\FKyxBVU";
            _bytes = new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 };
        }

        public string Encrypt(string openStr)
        {
            byte[] clearData = Encoding.Unicode.GetBytes(openStr);
            byte[] encryptedData = EncryptInternal(clearData, _key, _bytes);
            var encryptedStr = Convert.ToBase64String(encryptedData);
            return encryptedStr;
        }

        public string Decrypt(string encryptedString)
        {
            byte[] cipherBytes = Convert.FromBase64String(encryptedString);
            PasswordDeriveBytes pdb = new PasswordDeriveBytes(_key,
            new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            byte[] decryptedData = Decrypt(cipherBytes, pdb.GetBytes(32), pdb.GetBytes(16));
            return System.Text.Encoding.Unicode.GetString(decryptedData);
        }

        private byte[] EncryptInternal(byte[] clearData, string key, byte[] salt)
        {
            byte[] encryptedData = null;

            MemoryStream ms = new MemoryStream();

            using (PasswordDeriveBytes passwordDeriveBytes = new PasswordDeriveBytes(key, salt))
            {
                try
                {
                    Rijndael alg = Rijndael.Create();
                    alg.Key = passwordDeriveBytes.GetBytes(32);
                    alg.IV = passwordDeriveBytes.GetBytes(16);
                    using (CryptoStream cs = new CryptoStream(ms, alg.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearData, 0, clearData.Length);
                    }
                    encryptedData = ms.ToArray();
                }
                finally
                {
                        ms.Dispose();
                }
            }
            return encryptedData;
        }

        public byte[] Decrypt(byte[] cipherData, byte[] key, byte[] salt)
        {
            MemoryStream ms = new MemoryStream();
            Rijndael alg = Rijndael.Create();
            alg.Key = key;
            alg.IV = salt;
            CryptoStream cs = new CryptoStream(ms, alg.CreateDecryptor(), CryptoStreamMode.Write);
            cs.Write(cipherData, 0, cipherData.Length);
            cs.Close();
            byte[] decryptedData = ms.ToArray();
            return decryptedData;
        }

        public string UrlEncode(string plainText)
        {
            var plainTextBytes = Encoding.UTF8.GetBytes(Encrypt(plainText));
            return Convert.ToBase64String(plainTextBytes);
        }

        public string UrlDecode(string encryptedString)
        {
            var base64EncodedBytes = Convert.FromBase64String(encryptedString);
            return Decrypt(Encoding.UTF8.GetString(base64EncodedBytes));
        }
    }
}