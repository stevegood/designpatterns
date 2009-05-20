<cfcomponent output="false" implements="com.Interface.Observer, com.Interface.DisplayElement">
	<cfscript>
	variables.temperature = 0;
	variables.humidity = 0;
	</cfscript>
	
	<cffunction name="init" access="public" returntype="CurrentConditionsDisplay" output="false">
		<cfargument name="weatherData" required="true"/>
		<cfset variables.weatherData = arguments.weatherData />
		<cfset variables.weatherData.registerObserver(this) />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="update" access="public" returntype="void" output="false">
		<cfargument name="temperature" required="true"/>
		<cfargument name="humidity" required="true"/>
		<cfargument name="pressure" required="true"/>
		
		<cfset variables.temperature = arguments.temperature />
		<cfset variables.humidity = arguments.humidity />
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="display" access="public" returntype="string" output="false">
		<cfset var str = "Current condition: " & variables.temperature & "F degrees and " & variables.humidity & " humidity." />
		<cfreturn str />
	</cffunction>
	
</cfcomponent>