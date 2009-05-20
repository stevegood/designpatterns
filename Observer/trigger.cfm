<!--- <cfscript>
temperature = RandRange(-20, 110,'SHA1PRNG');
humidity = RandRange(0, 100,'SHA1PRNG');
pressure = RandRange(0,100,'SHA1PRNG') & '.' & RandRange(0,9,'SHA1PRNG') & 'f';
application.obj.weatherData.setMeasurements(temperature, humidity, pressure);
</cfscript>

<cfoutput>
Temperature: #temperature#<br />
Humidity: #humidity#<br />
Pressure: #pressure#
</cfoutput> --->


<cfset variables.ws = CreateObject('webservice','http://www.webservicex.net/stockquote.asmx?wsdl') />
<cfdump var="#XMLParse(variables.ws.GetQuote('ADBE'))#">