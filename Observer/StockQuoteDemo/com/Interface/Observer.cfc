<cfinterface>	
	<cffunction name="update" returntype="void" output="false">
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
	</cffunction>
	
	<cffunction name="getID" returntype="string" output="false">
	</cffunction>
</cfinterface>