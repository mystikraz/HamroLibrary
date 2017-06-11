using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HamroLibrary.Startup))]
namespace HamroLibrary
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
