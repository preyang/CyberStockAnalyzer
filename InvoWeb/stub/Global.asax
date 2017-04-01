<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown
        FormsAuthentication.SignOut();
        Session.Abandon();
        Session.RemoveAll();
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        Session.Add("Status", "SignIn");
        Session.Add("UserId", " ");
        Session.Add("UserName", " ");
        Session.Add("UserTypeId", " ");
        Session.Add("CompanyId", " ");
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        FormsAuthentication.SignOut();
         Session.Abandon();
         Session.RemoveAll();
    }
       
</script>
