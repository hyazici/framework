using System;
using System.IO;
using System.Web;

namespace AS.Utilities
{
    public class FileHelper
    {
        public static string Upload(HttpPostedFileBase file, string appPath, string filePath)
        {
            var dosyaAdi = Path.GetFileName(file.FileName.ToLower().Replace(" ", "-"));
            var dosyaUzantisi = Path.GetExtension(dosyaAdi);
            //TODO uzantı kontrolü

            dosyaAdi = filePath + DateTime.Now.Year.ToString() + @"\" + file.FileName.ToLower();
            string dizinAdresi = Path.Combine(appPath, filePath + DateTime.Now.Year.ToString() + @"\");

            if (!Directory.Exists(dizinAdresi))
            {
                Directory.CreateDirectory(dizinAdresi);
            }

            string tamAdresi = Path.Combine(appPath, dosyaAdi);
            file.SaveAs(tamAdresi);

            return tamAdresi;
        }

        public static FileInfo GetFileInfo(string appPath, string filePath)
        {
            string tamAdresi = Path.Combine(appPath, filePath);
            return new FileInfo(tamAdresi);
        }

        public static string UploadProfile(string appPath, string userName, string base64string)
        {
            string filePath = "/uploads/kullanici/";
            string imgPath = string.Empty;
            string imgName = string.Empty;
            string imgFullPath = string.Empty;

            string dizinAdresi = Path.Combine(appPath, "uploads\\kullanici\\");

            if (!Directory.Exists(dizinAdresi))
            {
                Directory.CreateDirectory(dizinAdresi);
            }

            if (base64string.IndexOf("data:image/jpeg") == 0)
            {
                imgName = userName + ".jpg";
                base64string = base64string.Replace("data:image/jpeg;base64,", "");
            }
            else if (base64string.IndexOf("data:image/png") == 0)
            {
                imgName = userName + ".png";
                base64string = base64string.Replace("data:image/png;base64,", "");
            }

            imgFullPath = Path.Combine(dizinAdresi, imgName);
            File.WriteAllBytes(imgFullPath, Convert.FromBase64String(base64string));
            imgPath = filePath + imgName;
            return imgPath;
        }

        public static string UploadProfile(string appPath, string userName, HttpPostedFileBase file)
        {
            //var dosyaAdi = Path.GetFileName(file.FileName.ToLower().Replace(" ", "-"));
            //var dosyaUzantisi = Path.GetExtension(dosyaAdi);
            ////TODO uzantı kontrolü

            //dosyaAdi = filePath + DateTime.Now.Year.ToString() + @"\" + file.FileName.ToLower();
            //string dizinAdresi = Path.Combine(appPath, filePath + DateTime.Now.Year.ToString() + @"\");

            //if (!Directory.Exists(dizinAdresi))
            //{
            //    Directory.CreateDirectory(dizinAdresi);
            //}

            //string tamAdresi = Path.Combine(appPath, dosyaAdi);

            //return tamAdresi;

            string filePath = "/uploads/kullanici/";
            string imgPath = string.Empty;
            string imgName = string.Empty;
            string imgFullPath = string.Empty;
            var dosyaAdi = Path.GetFileName(file.FileName.ToLower().Replace(" ", "-"));
            var dosyaUzantisi = Path.GetExtension(dosyaAdi);
            dosyaAdi = userName + dosyaUzantisi;
            string dizinAdresi = Path.Combine(appPath, "uploads\\kullanici\\");

            if (!Directory.Exists(dizinAdresi))
            {
                Directory.CreateDirectory(dizinAdresi);
            }

            imgFullPath = Path.Combine(dizinAdresi, dosyaAdi);
            file.SaveAs(imgFullPath);

            imgPath = filePath + dosyaAdi;
            return imgPath;
        }
    }
}