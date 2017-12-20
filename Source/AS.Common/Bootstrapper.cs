using Castle.MicroKernel.Registration;
using Castle.Windsor;
using System;
using System.Web;
using System.Web.Mvc;
using AS.Common.Abstractions;
using AS.Common.Aspects;
using AS.Common.Cache;
using AS.Common.Captcha;
using AS.Common.Configuration;
using AS.Common.Connection;
using AS.Common.Cookie;
using AS.Common.Encryption;
using AS.Common.Log.Providers;
using AS.Common.Mail;
using AS.Common.Performance;
using AS.Common.Session;

namespace AS.Common
{
    public sealed class Bootstrapper : IDisposable
    {
        private readonly IWindsorContainer _container;
        private static Bootstrapper _currentApplication;

        private static readonly Lazy<ConnectionManager> ConnectionManagerValue =
            new Lazy<ConnectionManager>(() => new ConnectionManager());

        public static ConnectionManager Data
        {
            get { return ConnectionManagerValue.Value; }
        }

        public Bootstrapper(params IWindsorInstaller[] installers)
        {
            _container = new WindsorContainer().Install(installers);

            var controllerFactory = new WindsorControllerFactory(_container.Kernel);
            ControllerBuilder.Current.SetControllerFactory(controllerFactory);
        }

        public static Bootstrapper StartApplication(params IWindsorInstaller[] installers)
        {
            _currentApplication = new Bootstrapper(installers);
            return _currentApplication;
        }

        public Bootstrapper InitializeDependencies(Action<IWindsorContainer> containerRegistrationAction = null)
        {
            _container.Register(Component.For<ExceptionHandlingInterceptor>());
            _container.Register(Component.For<GenericInterceptor>());

            //_container
            //     .Register(Component.For<IExceptionLogger>()
            //         .ImplementedBy<DefaultLogger>());
            _container
                .Register(Component.For<IPerformanceCounter>()
                    .ImplementedBy<PerformanceCounter>());
            
            _container
              .Register(Component.For<IConfigurationManager>()
                  .ImplementedBy<DefaultConfigurationManager>());

            _container
                .Register(Component.For<IWebConfigProvider>()
                .ImplementedBy<WebConfigProvider>());

            _container
                .Register(Component.For<IEncrypter>()
                .ImplementedBy<VbtEncrypter>());

            _container
                .Register(Component.For<IMailProvider>()
                .ImplementedBy<MailProvider>());

            // General
            //_container
            //    .Register(Component.For<IAuthenticationProvider>()
            //    .ImplementedBy<AuthenticationProvider>());

            _container
                .Register(Component.For<ISessionProvider>()
                .ImplementedBy<SessionProvider>());

            _container
                .Register(Component.For<ICacheProvider>()
                .ImplementedBy<CacheProvider>());

            //_container
            //    .Register(Component.For<IDefinitionsRepository>()
            //    .ImplementedBy<DefinitionRepository>());

            //_container
            //    .Register(Component.For<IMenuRepository>()
            //    .ImplementedBy<MenuRepository>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            //_container
            //    .Register(Component.For<IMenuBusiness>()
            //    .ImplementedBy<MenuBusiness>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            //_container
            //    .Register(Component.For<IWebConfigBusiness>()
            //    .ImplementedBy<WebConfigBusiness>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            //_container
            //    .Register(Component.For<IWebConfigRepository>()
            //    .ImplementedBy<WebConfigRepository>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            //_container
            //     .Register(Component.For<IMailBusiness>()
            //     .ImplementedBy<MailBusiness>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            // Capctha
            _container
                .Register(Component.For<ICaptchaProvider>()
                .ImplementedBy<CaptchaProvider>());

            //// Action
            //_container
            //    .Register(Component.For<IActionBusiness>()
            //    .ImplementedBy<ActionBusiness>());

            //_container
            //    .Register(Component.For<IActionRepository>()
            //    .ImplementedBy<ActionRepository>());

            // Helpers

            //_container
            //    .Register(Component.For<ILdapHelper>()
            //    .ImplementedBy<LdapHelper>());

            //_container
            //    .Register(Component.For<IRegexHelper>()
            //    .ImplementedBy<RegexHelper>());

            // Cookie
            _container
                .Register(Component.For<ICookieProvider>()
                .ImplementedBy<CookieProvider>());

            // Definitions Pages
            //_container
            //    .Register(Component.For<IDefinitionBusiness>()
            //    .ImplementedBy<DefinitionBusiness>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            // Login Pages
            //_container
            //    .Register(Component.For<ILoginBusiness>()
            //    .ImplementedBy<LoginBusiness>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            //_container
            //    .Register(Component.For<ILoginRepository>()
            //    .ImplementedBy<LoginRepository>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            //// Home Page
            //_container
            //    .Register(Component.For<IHomeBusiness>()
            //    .ImplementedBy<HomeBusiness>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            //// Report
            //_container
            //    .Register(Component.For<IReportBusiness>()
            //    .ImplementedBy<ReportBusiness>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            //_container
            //    .Register(Component.For<IReportRepository>()
            //    .ImplementedBy<ReportRepository>()
            //    .Interceptors<ExceptionHandlingInterceptor>());

            // LOG

            //_container
            //     .Register(Component.For<ILogger>()
            //     .ImplementedBy<VbtLogger>());

            //_container
            //    .Register(Component.For<IDatabaseLogProvider>()
            //    .ImplementedBy<DatabaseLogProvider>());

            //_container
            //    .Register(Component.For<IDatabaseLogRepository>()
            //    .ImplementedBy<DatabaseLogRepository>());

            _container
                .Register(Component.For<IFileSystemLogProvider>()
                .ImplementedBy<FileSystemLogProvider>());

            _container
                .Register(Component.For<IMailLogProvider>()
                .ImplementedBy<MailLogProvider>());

            _container
                .Register(Component.For<IEventLogProvider>()
                .ImplementedBy<EventLogProvider>());

            containerRegistrationAction(_container);

            return this;
        }

        public void Dispose()
        {
            _container.Dispose();
        }

        public Bootstrapper SetupDatabaseConnection(HttpApplication application, string connectionName)
        {
            //application.BeginRequest +=
            //    (sender, args) => Data.CreateConnection(connectionName);

            //application.EndRequest +=
            //    (sender, args) => Data.CloseConnection();

            return this;
        }
    }
}