using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text;
using System.Web;
using AS.Common.Abstractions;

namespace AS.Common.Captcha
{
    public class CaptchaProvider : ICaptchaProvider
    {
        private readonly ISessionProvider _session;
        private readonly Random _rand = new Random();

        public CaptchaProvider(ISessionProvider session)
        {
            _session = session;
        }

        public void Create()
        {
            string code = GetRandomText();

            Bitmap bitmap = new Bitmap(100, 33, PixelFormat.Format32bppArgb);

            Graphics g = Graphics.FromImage(bitmap);
            Pen pen = new Pen(Color.Yellow);
            Rectangle rect = new Rectangle(0, 0, 100, 33);

            SolidBrush b = new SolidBrush(Color.FromArgb(239, 239, 239));//.DarkKhaki); //#B4B4B4
            SolidBrush brushcolor = new SolidBrush(Color.FromArgb(83, 119, 169));//blue

            string[] crypticFonts = new string[11];
            crypticFonts[0] = "Arial";
            crypticFonts[1] = "Verdana";
            crypticFonts[2] = "Comic Sans MS";
            crypticFonts[3] = "Impact";
            crypticFonts[4] = "Haettenschweiler";
            crypticFonts[5] = "Lucida Sans Unicode";
            crypticFonts[6] = "Garamond";
            crypticFonts[7] = "Courier New";
            crypticFonts[8] = "Book Antiqua";
            crypticFonts[9] = "Arial Narrow";
            crypticFonts[10] = "Estrangelo Edessa";

            g.DrawRectangle(pen, rect);
            g.FillRectangle(b, rect);

            for (int i = 0; i < code.Length; i++)
            {
                var myFont = new Font(crypticFonts[new Random().Next(i)], 5 + _rand.Next(14, 18));
                g.DrawString(code[i].ToString(), myFont, brushcolor, i * 20, i);//new PointF(10 + counter, 10));
            }

            DrawRandomLines(g);
            MemoryStream ms = new MemoryStream();
            bitmap.Save(HttpContext.Current.Response.OutputStream, ImageFormat.Gif);

            g.Dispose();
            bitmap.Dispose();
        }

        private void DrawRandomLines(Graphics g)
        {
            SolidBrush green = new SolidBrush(Color.Green);
            for (int i = 0; i < 60; i++)
            {
                g.DrawLines(new Pen(green, 1), GetRandomPoints());
            }
        }

        private Point[] GetRandomPoints()
        {
            Point[] points = { new Point(_rand.Next(10, 250), _rand.Next(10, 150)), new Point(_rand.Next(10, 120), _rand.Next(10, 1890)) };
            return points;
        }

        private string GetRandomText()
        {
            StringBuilder randomText = new StringBuilder();

            string alphabets = "ABCDEFGHJKLMNPRSTUVYZ123456789";

            Random r = new Random();
            for (int j = 0; j <= 3; j++)
            {
                randomText.Append(alphabets[r.Next(alphabets.Length)]);
            }

            _session.Set(Strings.SessionKeys.Captcha, randomText.ToString().ToUpper());

            return randomText.ToString().ToUpper();
        }
    }
}