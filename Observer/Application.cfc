<cfcomponent output="false">
	<cfscript>
	this.name = 'Observer_Pattern_' & hash( ExpandPath('/') );
	this.mappings['/'] = ExpandPath('/Observer/');
	</cfscript>
	
	<cffunction name="onApplicationStart">
		<cfset cacheObjects() />
		<cfset application.init = true />
	</cffunction>
	
	<cffunction name="onRequestStart">
		<cfif NOT isDefined('application.init') OR (isDefined('url.reinit') AND url.reinit IS 'thisapp')>
			<cfset onApplicationStart() />
		</cfif>
	</cffunction>
	
	<cffunction name="cacheObjects" access="private">
		<cfif StructKeyExists(application, 'obj')>
			<cfset StructClear(application.obj) />
		</cfif>
		
		<cfset application.obj = {} />
		<cfset application.obj.weatherData = CreateObject('component','com.ValueObject.WeatherData').init() />
		<cfset application.obj.currentConditionsDisplay = CreateObject('component','com.Display.CurrentConditionsDisplay').init(application.obj.weatherData) />
		
	</cffunction>
	
</cfcomponent>