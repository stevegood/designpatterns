<cfcomponent output="false" implements="com.Interface.Observer, com.Interface.DisplayElement">
	<cfscript>
	// defaults
	variables.id = '';
	variables.quote = {};
	variables.quote.earns = 0;
	variables.quote.open = 0;
	variables.quote.high = 0;
	variables.quote.low = 0;
	variables.quote.volume = 0;
	variables.quote.pe = 0;
	variables.quote.mktCap = 0;
	variables.quote.previousClose = 0;
	variables.quote.percentageChange = 0;
	variables.quote.annRange = 0;
	</cfscript>
	
	<cffunction name="init" access="public" returntype="ExtraQuoteDisplay" output="false">
		<cfargument name="quoteData" required="true"/>
		<cfset variables.id = CreateUUID() />
		<cfset variables.quoteData = arguments.quoteData />
		<cfset variables.quoteData.registerObserver(this) />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="update" access="public" returntype="void" output="false">
		<cfargument name="symbol" required="true"/>
		<cfargument name="last" required="true"/>
		<cfargument name="date" required="true"/>
		<cfargument name="time" required="true"/>
		<cfargument name="change" required="true"/>
		<cfargument name="earns" required="true"/>
		<cfargument name="open" required="true"/>
		<cfargument name="high" required="true"/>
		<cfargument name="low" required="true"/>
		<cfargument name="volume" required="true"/>
		<cfargument name="pe" required="true"/>
		<cfargument name="mktCap" required="true"/>
		<cfargument name="previousClose" required="true"/>
		<cfargument name="percentageChange" required="true"/>
		<cfargument name="annRange" required="true"/>
		<cfargument name="name" required="true"/>
		
		<cfset variables.quote.earns = arguments.earns />
		<cfset variables.quote.open = arguments.open />
		<cfset variables.quote.high = arguments.high />
		<cfset variables.quote.low = arguments.low />
		<cfset variables.quote.volume = arguments.volume />
		<cfset variables.quote.pe = arguments.pe />
		<cfset variables.quote.mktCap = arguments.mktCap />
		<cfset variables.quote.previousClose = arguments.previousClose />
		<cfset variables.quote.percentageClose = arguments.percentageChange />
		<cfset variables.quote.annRange = arguments.annRange />
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="display" access="public" returntype="struct" output="false">
		<cfreturn variables.quote />
	</cffunction>
	
	<cffunction name="getID" access="public" returntype="string" output="false">
		<cfreturn variables.id />
	</cffunction>
	
</cfcomponent>