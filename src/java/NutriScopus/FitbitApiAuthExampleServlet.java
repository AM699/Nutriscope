
package NutriScopus;

import com.fitbit.api.FitbitAPIException;
import com.fitbit.api.client.*;
import com.fitbit.api.client.service.FitbitAPIClientService;
import com.fitbit.api.common.model.user.UserInfo;
import com.fitbit.api.model.APIResourceCredentials;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;


public class FitbitApiAuthExampleServlet extends HttpServlet {

    public static final String OAUTH_TOKEN = "oauth_token";
    public static final String OAUTH_VERIFIER = "oauth_verifier";

    private FitbitAPIEntityCache entityCache = new FitbitApiEntityCacheMapImpl();
    private FitbitApiCredentialsCache credentialsCache = new FitbitApiCredentialsCacheMapImpl();
    private FitbitApiSubscriptionStorage subscriptionStore = new FitbitApiSubscriptionStorageInMemoryImpl();

    private String apiBaseUrl;
    private String fitbitSiteBaseUrl;
    private String exampleBaseUrl;
    private String clientConsumerKey;
    private String clientSecret;

    @Override
    public void init() throws ServletException 
    {
       /* 
        ServletConfig config  super.init(config);
        try {
            Properties properties = new Properties();
            properties.load(getClass().getClassLoader().getResourceAsStream("config.properties"));
            apiBaseUrl = properties.getProperty("apiBaseUrl");
            fitbitSiteBaseUrl = properties.getProperty("fitbitSiteBaseUrl");
            exampleBaseUrl = properties.getProperty("exampleBaseUrl").replace("/Nutriscope", "");
            clientConsumerKey = properties.getProperty("clientConsumerKey");
            clientSecret = properties.getProperty("clientSecret");
        } 
        catch (IOException e) 
        {
            throw new ServletException("Exception during loading properties", e);
        }
      /*  */apiBaseUrl ="https://api.fitbit.com";
        fitbitSiteBaseUrl = "https://www.fitbit.com";
        exampleBaseUrl ="http://localhost:8084/Nutriscope/";
    
        
    }
    /**
     *
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
       System.out.println( apiBaseUrl + fitbitSiteBaseUrl +exampleBaseUrl + clientConsumerKey  + clientSecret);
        System.out.println( OAUTH_TOKEN + "   "+OAUTH_VERIFIER );
        FitbitAPIClientService<FitbitApiClientAgent> apiClientService = new FitbitAPIClientService<FitbitApiClientAgent>(
                new FitbitApiClientAgent(apiBaseUrl, fitbitSiteBaseUrl, credentialsCache),
                clientConsumerKey,
                clientSecret,
                credentialsCache,
                entityCache,
                subscriptionStore
        );
       //  System.out.println( apiBaseUrl + fitbitSiteBaseUrl +exampleBaseUrl + clientConsumerKey  + clientSecret);
         
        if (request.getParameter("completeAuthorization") != null) 
        {
            String tempTokenReceived = request.getParameter(OAUTH_TOKEN);
            String tempTokenVerifier = request.getParameter(OAUTH_VERIFIER);
            APIResourceCredentials resourceCredentials = apiClientService.getResourceCredentialsByTempToken(tempTokenReceived);

            if (resourceCredentials == null) 
            {
                throw new ServletException("Unrecognized temporary token when attempting to complete authorization: " + tempTokenReceived);
            }
            // Get token credentials only if necessary:
            if (!resourceCredentials.isAuthorized()) 
            {
                // The verifier is required in the request to get token credentials:
                resourceCredentials.setTempTokenVerifier(tempTokenVerifier);
                try {
                    // Get token credentials for user:
                    apiClientService.getTokenCredentials(new LocalUserDetail(resourceCredentials.getLocalUserId()));
                } catch (FitbitAPIException e) {
                    throw new ServletException("Unable to finish authorization with Fitbit.", e);
                }
            }
            try 
            {
                UserInfo userInfo = apiClientService.getClient().getUserInfo(new LocalUserDetail(resourceCredentials.getLocalUserId()));
                request.setAttribute("userInfo", userInfo);
                request.getRequestDispatcher("/fitbitApiAuthExample.jsp").forward(request, response);
            } 
            catch (FitbitAPIException e) 
            {
                throw new ServletException("Exception during getting user info", e);
            }
        }
        else 
        {
            try
            {
                response.sendRedirect(apiClientService.getResourceOwnerAuthorizationURL(new LocalUserDetail("-"), exampleBaseUrl + "/fitbitApiAuthExample?completeAuthorization="));
            } 
            catch (FitbitAPIException e)
            {
                throw new ServletException("Exception during performing authorization", e);
            }
        }
    }
}
