using System;
using System.IO;
using AS.Common.Abstractions;
using AS.Models.SubModels;

namespace AS.Common.Log.Providers
{
    public class FileSystemLogProvider : IFileSystemLogProvider
    {
        private readonly IConfigurationManager _configurationManager;

        public FileSystemLogProvider(IConfigurationManager configurationManager)
        {
            _configurationManager = configurationManager;
        }

        private string sLogFormat;
        private string sErrorTime;
        private long FileSize;

        public void Flush(LogModel logModel)
        {
            //- File System Log Provider -//
            string IsLogSave = _configurationManager.Load(Strings.Configuration.Log.IsLogSave);
            string FilePath = _configurationManager.Load(Strings.Configuration.Log.FilePath);
            FileSize = Convert.ToInt64(_configurationManager.Load(Strings.Configuration.Log.FileSize));

            if (IsLogSave != "EVET")
            {
                return;
            }

            sLogFormat = DateTime.Now.ToString("yyyy-MM-dd") + " " + DateTime.Now.ToLongTimeString().ToString() + " --> ";
            sErrorTime = DateTime.Now.ToString("yyyy-MM-dd");

            if (!Directory.Exists(FilePath))
            {
                Directory.CreateDirectory(FilePath);
            }

            FilePath += DateTime.Now.ToString("yyyy-MM-dd") + ".txt";

            FilePath = CheckByteFile(FilePath, true);
            StreamWriter sw = null;
            try
            {
                sw = new StreamWriter(FilePath, true);
                sw.WriteLine(sLogFormat + "Hata Sayfası : " + logModel.ControllerName + ", Hata Alınan URL : " + logModel.RequestUrl + ", Hata Mesajı : " + logModel.Message);
                sw.Flush();
                sw.Close();
            }
            catch (Exception)
            {
                sw.Flush();
                sw.Close();
            }
        }

        private string CheckByteFile(string filePath, bool firstControl)
        {
            if (!File.Exists(filePath))
            {
                File.Create(filePath).Dispose();
            }
            else
            {
                FileInfo info = new FileInfo(filePath);
                if (info.Length > FileSize)
                {
                    if (firstControl)
                    {
                        filePath = filePath.Replace(".txt", "__01.txt");
                        filePath = CheckByteFile(filePath, false);
                    }
                    else
                    {
                        string change = filePath.Substring(filePath.Length - 8, 8);
                        string oldCount = filePath.Substring(filePath.Length - 6, 2);
                        int count = Convert.ToInt32(oldCount) + 1;
                        string newCount = count < 10 ? "0" + count.ToString() : count.ToString();
                        filePath = filePath.Replace(change, "__" + newCount + ".txt");
                        filePath = CheckByteFile(filePath, false);
                    }
                }
            }

            return filePath;
        }
    }
}