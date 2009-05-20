<cfcomponent output="false" implements="com.Interface.Subject">
	
	<cfscript>
	variables.temperature = 0;
	variables.humidity = 0;
	variables.pressure = 0;
	</cfscript>
	
	<cffunction name="init" output="false" access="public" returntype="WeatherData">
		<cfset variables.observers = ArrayNew(1) />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="registerObserver" returntype="void" output="false" access="public">
		<cfargument name="observer" required="true" />
		<cfset ArrayAppend(variables.observers,arguments.observer) />
		<cfreturn />
	</cffunction>
	
	<cffunction name="removeObserver" returntype="void" output="false" access="public">
		<cfargument name="observer" required="true" />
		
		<cfset var local = {} />
		
		<cfif ArrayLen(variables.observers) GTE 1>
			<cfloop from="1" to="#ArrayLen(variables.observers)#" index="local.i">
				<cfif variables.observers[local.i].getID() IS arguments.observers.getID()>
					<cfset ArrayDeleteAt(variables.observers,local.i) />
					<cfbreak />
				</cfif>
			</cfloop>
		</cfif>
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="notifyObservers" returntype="void" output="false" access="public">
		<cfset var local = {} />
		<cfif ArrayLen(variables.observers) GTE 1>
			<cfloop from="1" to="#ArrayLen(variables.observers)#" index="local.i">
				<cfset variables.observers[local.i].update(variables.temperature, variables.humidity, variables.pressure) />
			</cfloop>
		</cfif>
		<cfreturn />
	</cffunction>
	
	<cffunction name="setMeasurements" output="false" access="public" returntype="void">
		<cfargument name="temperature" required="true"/>
		<cfargument name="humidity" required="true"/>
		<cfargument name="pressure" required="true"/>
		
		<cfset variables.temperature = arguments.temperature />
		<cfset variables.humidity = arguments.humidity />
		<cfset variables.pressure = arguments.pressure />
		
		<cfset notifyObservers() />
		
		<cfreturn />
	</cffunction>
	
</cfcomponent>