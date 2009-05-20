<cfcomponent output="false" implements="com.Interface.Observer, com.Interface.DisplayElement">
	<cfscript>
	// defaults
	variables.id = '';
	variables.quote = {};
	variables.quote.symbol = '';
	variables.quote.last = 0;
	variables.quote.date = DateFormat(now(),'mm/dd/yyyy');
	variables.quote.time = TimeFormat(now(),'h:mmtt');
	variables.quote.change = '0';
	variables.quote.name = '';
	</cfscript>
	
	<cffunction name="init" access="public" returntype="SimpleQuoteDisplay" output="false">
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
		
		<cfset variables.quote.symbol = arguments.symbol />
		<cfset variables.quote.last = arguments.last />
		<cfset variables.quote.date = arguments.date />
		<cfset variables.quote.time = arguments.time />
		<cfset variables.quote.change = arguments.change />
		<cfset variables.quote.name = arguments.name />
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="display" access="public" returntype="struct" output="false">
		<cfreturn variables.quote />
	</cffunction>
	
	<cffunction name="getID" access="public" returntype="string" output="false">
		<cfreturn variables.id />
	</cffunction>
	
</cfcomponent>