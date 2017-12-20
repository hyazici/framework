using AS.Models;

namespace AS.Common
{
    public struct Strings
    {
        public struct Authorization
        {
            public const string UserSessionKey = "User::Context";
            public const string BolgeSessionKey = "Bolge::Context";
            public const string BolgeListSessionKey = "BolgeList::Context";
            public const string IsLoginSessionKey = "IsLogin::Context";
        }

        public struct ThemeConfig
        {
            public const string Name = "layout";
            public const string Style = "-rounded";
            public const string Theme = "darkblue";

        }

        public struct SessionKeys
        {
            public const string Captcha = "Captcha";
            public const string Report = "Report::Object";
        }

        public struct CookieKeys
        {
            public const string UserName = "UserName";
            public const string IdUser = "IdUser";
            public const string LastOpenPage = "LastOpenPage";
            public const string FromLogin = "FromLogin";
        }

        public struct CacheKeys
        {
            public const string BypassNameList = "AB_DILEKCE";
        }

        public struct MailKeys
        {
            public const string FromFullName = "FromFullName";
            public const string From = "From";
            public const string To = "To";
            public const string PassWord = "PassWord";
            public const string Host = "Host";
            public const string Port = "Port";
            public const string IsBodyHtml = "IsBodyHtml";
            public const string EnableSsl = "EnableSsl";
            public const string MailLink = "MailLink";
            public const string MailImages = "MailImages";
        }

        public struct Configuration
        {
            public static class General
            {
                public const string AppName = "AppName";
                public const string CompanyName = "CompanyName";
                public const string VersionNumber = "VersionNumber";
                public const string AppEnvironment = "AppEnvironment";
                public const string MaxNumberOfRecords = "3000";
                public const string AppPath = "AppPath";
            }

            public static class Mail
            {
                public const string From = "From";
                public const string To = "To";
                public const string Password = "Password";
                public const string Host = "Host";
                public const string Port = "Port";
                public const string EnableSSL = "EnableSSL";
                public const string MailLink = "MailLink";
                public const string Images = "Images";
                public const string MailTemplatePath = "MailTemplatePath";
            }

            public static class Log
            {
                public const string IsLogSave = "IsLogSave";
                public const string FilePath = "FilePath";
                public const string FileSize = "FileSize";
            }

            public static class DB
            {
                public const string ConnectionStringName = "veritabaniBaglantisi";
            }

            public static class Ldap
            {
                public const string IsLdapLogin = "IsLdapLogin";
                public const string DomainServer = "DomainServer";
                public const string DomainEmail = "DomainEmail";
                public const string IsIntegratedDomainGroup = "IsIntegratedDomainGroup";
                //public const string DomainEmail = "DomainEmail";
            }

            public static class Theme
            {
                public const string PanelTitleColor = "font-blue-hoki";
                public const string ButtonSave = "green";
                public const string ButtonClear = "yellow";
                public const string ButtonDelete = "red";
                public const string ButtonSearch = "blue";
                public const string ButtonPrint = "blue";
                public const string ButtonDefault = "default";
            }
            public static class ButtonSize
            {
                public const string XSmall = "btn-xs";
                public const string Small = "btn-sm";
                public const string Default = "";
                public const string Large = "btn-xl";
            }
        }

        public struct AuthenticationPages
        {
            public static string[] PageNames()
            {
                return new string[] { "Menu", "UserInfo", "CompanyInfo", "AppInfo", "Basvurular", "Profile" };
            }

            public static string[] ActionPaths()
            {
                return new string[] { "/Action/GetAll", "/Home/IndexFromLogin", "/Action/Check", "/Abonelik/Basvuru/Basvurular" };
            }
        }

        public struct Messages
        {
            public static class Definition
            {
                public static string Update(string tableName, int id)
                {
                    return string.Format("{0} idli kayıt {1} adlı tablodan güncellendi.", id, tableName);
                }

                public static string Insert(string tableName, int id)
                {
                    return string.Format("{0} idli kayıt {1} adlı tabloya eklendi.", id, tableName);
                }

                public static string Delete(string tableName, int id)
                {
                    return string.Format("{0} idli kayıt {1} adlı tablodan silindi.", id, tableName);
                }
            }

            public static class User
            {
                public static string Update(SC_USER obj)
                {
                    return string.Format("{0} idli ve {1} adlı kullanıcı güncellendi.", obj.IdUser, obj.UserName);
                }

                public static string Insert(SC_USER obj)
                {
                    return string.Format("{0} idli ve {1} adlı kullanıcı eklendi.", obj.IdUser, obj.UserName);
                }

                public static string Delete(SC_USER obj)
                {
                    return string.Format("{0} idli ve {1} adlı kullanıcı silindi.", obj.IdUser, obj.UserName);
                }
            }

            public static class UserAuthorisation
            {
                public static string InsertForRole(CR_ROLE_USER obj)
                {
                    return string.Format("{0} idli kullanıcı ve {1} idli role eklendi.", obj.IdUser, obj.IdRole);
                }

                public static string InsertForAction(CR_USER_ACTION obj)
                {
                    return string.Format("{0} idli kullanıcıya ve {1} idli Action yetkisi verildi.", obj.IdUser, obj.IdAction);
                }

                public static string InsertForMenu(CR_USER_MENU obj)
                {
                    return string.Format("{0} idli kullanıcıya ve {1} idli Menu yetkisi verildi.", obj.IdUser, obj.IdMenu);
                }

                public static string DeleteForRole(CR_ROLE_USER obj)
                {
                    return string.Format("{0} idli kullanıcı ve {1} idli rolden çıkarıldı.", obj.IdUser, obj.IdRole);
                }

                public static string DeleteForAction(CR_USER_ACTION obj)
                {
                    return string.Format("{0} idli kullanıcı {1} idli Action yetkisi çıkarıldı.", obj.IdUser, obj.IdAction);
                }

                public static string DeleteForMenu(CR_USER_MENU obj)
                {
                    return string.Format("{0} idli kullanıcı {1} idli Menu yetkisi çıkarıldı.", obj.IdUser, obj.IdMenu);
                }
            }

            public static class RoleAuthorisation
            {
                public static string InsertForMenu(CR_ROLE_MENU obj)
                {
                    return string.Format("{0} idli role {1} idli Menu yetkilendirildi.", obj.IdRole, obj.IdMenu);
                }

                public static string DeleteForMenu(CR_ROLE_MENU obj)
                {
                    return string.Format("{0} idli role {1} idli Menu yetkisi çıkarıldı.", obj.IdRole, obj.IdMenu);
                }

                public static string InsertForAction(CR_ROLE_ACTION obj)
                {
                    return string.Format("{0} idli role {1} idli Action yetkilendirildi.", obj.IdRole, obj.IdAction);
                }

                public static string DeleteForAction(CR_ROLE_ACTION obj)
                {
                    return string.Format("{0} idli role {1} idli Action yetkisi çıkarıldı.", obj.IdRole, obj.IdAction);
                }
            }

            public static class ActionAuthorisation
            {
                public static string Insert(CR_ROLE_ACTION obj)
                {
                    return string.Format("{0} idli role ve {1} idli action eklendi.", obj.IdRole, obj.IdAction);
                }

                public static string Delete(CR_ROLE_ACTION obj)
                {
                    return string.Format("{0} idli role ve {1} idli action çıkarıldı.", obj.IdRole, obj.IdAction);
                }
            }

            public static class Role
            {
                public static string Update(SC_ROLE obj)
                {
                    return string.Format("{0} idli ve {1} adlı rol güncellendi.", obj.IdRole, obj.RoleName);
                }

                public static string Insert(SC_ROLE obj)
                {
                    return string.Format("{0} idli ve {1} adlı rol eklendi.", obj.IdRole, obj.RoleName);
                }

                public static string Delete(SC_ROLE obj)
                {
                    return string.Format("{0} idli ve {1} adlı rol silindi.", obj.IdRole, obj.RoleName);
                }
            }

            public static class LoginPage
            {
                public static string Login(SC_USER obj)
                {
                    return string.Format("{0} idli ve {1} adlı kullanıcı uygulamaya giriş yaptı.", obj.IdUser, obj.UserName);
                }

                public static string FailedLogin(SC_USER obj)
                {
                    return string.Format("{0} idli ve {1} adlı kullanıcı hatalı giriş yaptı.", obj.IdUser, obj.UserName);
                }
            }

            public static class Menu
            {
                public static string Update(SC_MENU obj)
                {
                    return string.Format("{0} idli ve {1} adlı menu güncellendi.", obj.IdMenu, obj.MenuName);
                }

                public static string Insert(SC_MENU obj)
                {
                    return string.Format("{0} idli ve {1} adlı menu eklendi.", obj.IdMenu, obj.MenuName);
                }

                public static string Delete(SC_MENU obj)
                {
                    return string.Format("{0} idli ve {1} adlı menu silindi.", obj.IdMenu, obj.MenuName);
                }
            }

            public static class Action
            {
                public static string Update(SC_ACTION obj)
                {
                    return string.Format("{0} idli ve {1} adlı Sayfa İçi Yetki Tanımı güncellendi.", obj.IdAction, obj.ActionName);
                }

                public static string Insert(SC_ACTION obj)
                {
                    return string.Format("{0} idli ve {1} adlı Sayfa İçi Yetki Tanımı eklendi.", obj.IdAction, obj.ActionName);
                }

                public static string Delete(SC_ACTION obj)
                {
                    return string.Format("{0} idli ve {1} adlı Sayfa İçi Yetki Tanımı silindi.", obj.IdAction, obj.ActionName);
                }
            }

            public static class Report
            {
                public static string Update(RP_REPORT obj)
                {
                    return string.Format("{0} idli ve {1} adlı rapor güncellendi.", obj.IdReport, obj.ReportName);
                }

                public static string Insert(RP_REPORT obj)
                {
                    return string.Format("{0} idli ve {1} adlı rapor eklendi.", obj.IdReport, obj.ReportName);
                }

                public static string Delete(RP_REPORT obj)
                {
                    return string.Format("{0} idli ve {1} adlı rapor silindi.", obj.IdReport, obj.ReportName);
                }
            }

            public static class CacheManagement
            {
                public static string Clear()
                {
                    return "Cache temizlendi.";
                }

                public static string Delete(string key)
                {
                    return string.Format("{0} adlı Cache silindi.", key);
                }
            }
        }

        public struct StaticPage
        {
            public const string LoginPage = "/Login";
        }
    }
}