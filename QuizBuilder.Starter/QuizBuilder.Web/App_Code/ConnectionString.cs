using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Configuration;
using QuizBuilder.Data;
using QuizBuilder;

/// <summary>
/// Summary description for ConnectionString
/// </summary>
public class ConnectionString
{
	public ConnectionString()
	{

    }

    static string GetConnectionString()
    {
        // Set default return value on fail
        string returnValue = null;

        // Locate ConnectionString by Name
        System.Configuration.ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["QuizBuilderEntities"];

        // Return ConnectionString if Connection Name found
        if (settings != null)
            returnValue = settings.ConnectionString;

        return returnValue;
    }
}