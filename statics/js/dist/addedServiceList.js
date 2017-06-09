function initServices() {
	for (var a = ["<tr>", '<td class="img"><i width="64" height="64" style="#{imgOutStyle}"></i></td>', "<td>", "<h3>#{name}</h3>", '<p>#{desc}<a href="http://amos1.taobao.com/msg.ww?v=2&uid=苏城夏&s=1" class="details" target="_blank">详情&gt;&gt;</a></p>', "</td>", '<td class="price">￥ <strong>#{price}</strong> <span>#{unit}</span></td>', '<td class="w80 #{linkType}"><a href="http://amos1.taobao.com/msg.ww?v=2&uid=苏城夏&s=1" class="ui-btn ui-btn-sc" target="_blank" data-product-id="#{productId}">#{btnValue}</a></td>', "</tr>"].join(""), b = [], c = 0; c < addedService.length; c++) {
		var d = addedService[c],
			e = a.replace(/\#{([\w\-]+)\}/g, function(a, b) {
				return d[b] || ""
			});
		b.push(e)
	}
	$("#addedService").html(b.join(""))
}!
function() {
	initServices()
}(jQuery);