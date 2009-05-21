var facade = './com/Facade/QuoteFacade.cfc';
var showMoreDetail = false;

$(document).ready(function(){
	var interval = setInterval('onInterval()',30000);
	
	doGetQuote();
	
	$('#moreLink').live('click',function(){
		showMoreDetail = true;
		doGetMoreDetail();
	});
	
	$('#lessLink').live('click',function(){
		showMoreDetail = false;
		$('#quoteDetailTable').remove();
	});
	
	$('#refreshLink').live('click',function(){
		onInterval();
	});
});

function doGetQuote(){
	$('#quoteTable').remove();
	var args = { method: 'getQuote' };
	$.getJSON(
		facade,
		args,
		function(result){
			var html = '<table id="quoteTable">';
			html += '<tr><td colspan="2">Show <a href="javascript:void(0);" id="moreLink">more...</a> | <a href="javascript:void(0);" id="lessLink">less...</a> | <a href="javascript:void(0);" id="refreshLink">refresh</a></td></tr>';
			html += '<tr><th align="right" colspan="2">last update at ' + result.TIME + ' on ' + result.DATE + '</th></tr>';
			html += '<tr><th align="right">Name:</th><td>' + result.NAME + '</td></tr>';
			html += '<tr><th align="right">Symbol:</th><td>' + result.SYMBOL + '</td></tr>';
			html += '<tr><th align="right">Last:</th><td>' + result.LAST + '</td></tr>';
			html += '<tr><th align="right">Change:</th><td>' + result.CHANGE + '</td></tr>';
			html += '</table>';
			$('#main').prepend(html);
		}
	);
};

function doGetMoreDetail(){
	$('#quoteDetailTable').remove();
	
	// get the latest quote data
	doGetQuote();
	
	var args = { method: 'getMoreDetail' };
	
	$.getJSON(
		facade,
		args,
		function(result){
			var html = '<table id="quoteDetailTable">';
			html += '<tr><th align="right">Market Cap:</th><td>' + result.MKTCAP + '</td></tr>';
			html += '<tr><th align="right">Previous Close:</th><td>' + result.PREVIOUSCLOSE + '</td></tr>';
			html += '<tr><th align="right">Open:</th><td>' + result.OPEN + '</td></tr>';
			html += '<tr><th align="right">High:</th><td>' + result.HIGH + '</td></tr>';
			html += '<tr><th align="right">Low:</th><td>' + result.LOW + '</td></tr>';
			html += '<tr><th align="right">Percentage Close:</th><td>' + result.PERCENTAGECLOSE + '</td></tr>';
			html += '</table>';
			$('#main').append(html);
		}
	);
};

function onInterval(){
	if (showMoreDetail){
		doGetMoreDetail();
	} else {
		doGetQuote();
	}
};