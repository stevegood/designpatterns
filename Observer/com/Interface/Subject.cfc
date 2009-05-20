<cfinterface>
	<cffunction name="registerObserver" returntype="void" output="false">
		<cfargument name="observer" required="true" />
	</cffunction>
	
	<cffunction name="removeObserver" returntype="void" output="false">
		<cfargument name="observer" required="true" />
	</cffunction>
	
	<cffunction name="notifyObservers" returntype="void" output="false">
		
	</cffunction>
</cfinterface>