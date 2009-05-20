<cfcomponent output="false" implements="com.Interface.Subject">
	<cfscript>
	// defaults
	variables.quote = {};
	variables.quote.symbol = '';
	variables.quote.last = 0;
	variables.quote.date = DateFormat(now(),'mm/dd/yyyy');
	variables.quote.time = TimeFormat(now(),'h:mmtt');
	variables.quote.change = '0';
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
	variables.quote.name = '';
	</cfscript>
	
	<cffunction name="init" access="public" returntype="QuoteData" output="false">
		<cfset variables.observers = ArrayNew(1) />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="registerObserver" access="public" returntype="void" output="false">
		<cfargument name="observer" required="true" />
		<cfset ArrayAppend(variables.observers,arguments.observer) />
		<cfreturn />
	</cffunction>
	
	<cffunction name="removeObserver" access="public" returntype="void" output="false">
		<cfargument name="observer" required="true" />
		<cfset var local = {} />
		<cfif ArrayLen(variables.observers) GT 0>
			<cfloop from="1" to="#ArrayLen(variables.observers)#" index="local.i">
				<cfif variables.observers[local.i].getID() IS arguments.observer.getID()>
					<cfset ArrayDeleteAt(variables.observers, local.i) />
					<cfbreak />
				</cfif>
			</cfloop>
		</cfif>
		<cfreturn />
	</cffunction>
	
	<cffunction name="notifyObservers" access="public" returntype="void" output="false">
		<cfif ArrayLen(variables.observers) GT 0>
			<cfloop from="1" to="#ArrayLen(variables.observers)#" index="local.i">
				<cfset variables.observers[local.i].update(ArgumentCollection = variables.quote) />
			</cfloop>
		</cfif>
		<cfreturn />
	</cffunction>
	
	<cffunction name="setQuote" access="public" returntype="void" output="false">
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
		
		<cfset variables.quote = Duplicate(arguments) />
		
		<cfset notifyObservers() />
		
		<cfreturn />
	</cffunction>
	
</cfcomponent>