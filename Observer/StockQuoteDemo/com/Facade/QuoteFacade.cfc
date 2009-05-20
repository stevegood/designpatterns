<cfcomponent output="false">
	
	<cffunction name="getQuote" access="remote" returntype="struct" output="false" returnFormat="json">
		<cfreturn application.obj.simpleQuoteDisplay.display() />
	</cffunction>
	
	<cffunction name="getMoreDetail" access="remote" returntype="struct" output="false" returnFormat="json">
		<cfreturn application.obj.extraQuoteDisplay.display() />
	</cffunction>
	
</cfcomponent>