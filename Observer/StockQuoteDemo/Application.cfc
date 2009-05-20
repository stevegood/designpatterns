<cfcomponent>
	<cfscript>
	application.root = '/Observer/StockQuoteDemo/'; // change this path to reflect your environment
	this.name = 'Observer_Pattern_StockQuoteDemo_' & hash( ExpandPath(application.root) );
	this.mappings['/'] = ExpandPath(application.root);
	</cfscript>
	
	<cffunction name="onApplicationStart">
		<cfset startScheduledTask() />		
		<cfset cacheObjects() />
		<cfset application.init = true />
	</cffunction>
	
	<cffunction name="onRequestStart">
		<cfif NOT StructKeyExists(application, 'init') OR (isDefined('url.reinit') AND url.reinit IS 'thisapp')>
			<cfset startScheduledTask() />
			<cfset cacheObjects() />
			<cfset application.init = true />
		</cfif>
	</cffunction>
	
	<cffunction name="cacheObjects" access="private">
		<cfif StructKeyExists(application, 'obj')>
			<cfset StructClear(application.obj) />
		</cfif>
		
		<cfset application.obj = {} />
		
		<!--- cache objects in the application scope --->
		<cfset application.obj.quoteData = CreateObject('component','com.ValueObject.QuoteData').init() />
		<cfset application.obj.simpleQuoteDisplay = CreateObject('component','com.ValueObject.SimpleQuoteDisplay').init(application.obj.quoteData) />
		<cfset application.obj.extraQuoteDisplay = CreateObject('component','com.ValueObject.ExtraQuoteDisplay').init(application.obj.quoteData) />
		
		<!--- service objects --->
		<cfset application.obj.service = {} />
		<cfset application.obj.service.quoteService = CreateObject('component','com.Service.QuoteService').init() />
	</cffunction>
	
	<cffunction name="startScheduledTask" access="private">
		<!--- create a scheduled task to auto update the stock quote data --->
		
		<cfschedule
			task="StockQuoteAutoUpdate"
			operation="HTTPRequest"
			URL="http://#CGI.SERVER_NAME#:#CGI.SERVER_PORT##application.root#trigger.cfm"
			action="update"
			startDate="#DateFormat(now(),'mm/dd/yyyy')#"
			startTime="12:00 AM"
			endTime="11:59 PM"
			interval="180"
		/>
		
		<!--- run the scheduled task --->
		<cfschedule action="run" task="StockQuoteAutoUpdate" />
	</cffunction>
	
</cfcomponent>