<cfcomponent output="false">
	
	<cffunction name="init" access="public" returntype="QuoteService" output="false">
		<cfset variables.ws = CreateObject('webservice','http://www.webservicex.net/stockquote.asmx?wsdl') />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getStockQuote" access="public" returntype="void" output="false">
		<cfset var local = {} />
		<cfset local.wsResult = XMLParse(variables.ws.GetQuote('ADBE')) />
		<cfset storeQuote(local.wsResult) />
		<cfreturn />
	</cffunction>
	
	<cffunction name="storeQuote" access="private" returntype="void" output="false">
		<cfargument name="quote" type="xml" required="true"/>
		
		<cfset var local = {} />
		<cfset local.xml = XMLParse(arguments.quote) />
		<cfset local.quote = {} />
		<cfset local.quote.symbol = local.xml.StockQuotes.Stock.Symbol.XMLText />
		<cfset local.quote.last = local.xml.StockQuotes.Stock.Last.XMLText />
		<cfset local.quote.date = local.xml.StockQuotes.Stock.Date.XMLText />
		<cfset local.quote.time = local.xml.StockQuotes.Stock.Time.XMLText />
		<cfset local.quote.change = local.xml.StockQuotes.Stock.Change.XMLText />
		<cfset local.quote.open = local.xml.StockQuotes.Stock.Open.XMLText />
		<cfset local.quote.high = local.xml.StockQuotes.Stock.High.XMLText />
		<cfset local.quote.low = local.xml.StockQuotes.Stock.Low.XMLText />
		<cfset local.quote.volume = local.xml.StockQuotes.Stock.Volume.XMLText />
		<cfset local.quote.mktCap = local.xml.StockQuotes.Stock.MktCap.XMLText />
		<cfset local.quote.previousClose = local.xml.StockQuotes.Stock.PreviousClose.XMLText />
		<cfset local.quote.percentageChange = local.xml.StockQuotes.Stock.PercentageChange.XMLText />
		<cfset local.quote.annRange = local.xml.StockQuotes.Stock.AnnRange.XMLText />
		<cfset local.quote.earns = local.xml.StockQuotes.Stock.Earns.XMLText />
		<cfset local.quote.pe = local.xml.StockQuotes.Stock['P-E'].XMLText />
		<cfset local.quote.name = local.xml.StockQuotes.Stock.Name.XMLText />
		
		<cfset application.obj.quoteData.setQuote(ArgumentCollection = local.quote) />
		
		<cfreturn />
	</cffunction>
	
</cfcomponent>