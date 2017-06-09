var curRow, curCol, loading, SYSTEM = system = parent.SYSTEM,
	billRequiredCheck = system.billRequiredCheck,
	requiredMoney = system.requiredMoney,
	taxRequiredCheck = system.taxRequiredCheck,
	taxRequiredInput = system.taxRequiredInput,
	hiddenAmount = !1,
	urlParam = Public.urlParam(),
	disEditable = urlParam.disEditable,
	qtyPlaces = Number(parent.SYSTEM.qtyPlaces),
	pricePlaces = Number(parent.SYSTEM.pricePlaces),
	amountPlaces = Number(parent.SYSTEM.amountPlaces),
	THISPAGE = {
		init: function(a) {
			SYSTEM.isAdmin !== !1 || SYSTEM.rights.AMOUNT_INAMOUNT || (hiddenAmount = !0, $("#amountArea").hide()), this.loadGrid(a), this.initDom(a), this.initCombo(), a.id > 0 && a.checked ? this.disableEdit() : (this.editable = !0, $("#grid").jqGrid("setGridParam", {
				cellEdit: !0
			})), this.addEvent(), $.cookie("BarCodeInsert") && (THISPAGE.$_barCodeInsert.addClass("active"), THISPAGE.goodsCombo.opts.customMatch = function(a, b) {
				var c = a.rawData.barCode.toLowerCase().search(b);
				return /^\d+$/.test(b) && 0 == c ? !0 : void 0
			})
		},
		initDom: function(a) {
			var b = this;
			this.$_customer = $("#customer"), this.$_date = $("#date").val(system.endDate), this.$_deliveryDate = $("#deliveryDate").val(system.endDate), this.$_number = $("#number"), this.$_classes = $("#classes"), this.$_note = $("#note"), this.$_discountRate = $("#discountRate"), this.$_deduction = $("#deduction"), this.$_discount = $("#discount"), this.$_payment = $("#payment"), this.$_arrears = $("#arrears"), this.$_totalArrears = $("#totalArrears"), this.$_toolTop = $("#toolTop"), this.$_toolBottom = $("#toolBottom"), this.$_paymentTxt = $("#paymentTxt"), this.$_accountInfo = $("#accountInfo"), this.$_userName = $("#userName"), this.$_modifyTime = $("#modifyTime"), this.$_checkName = $("#checkName"), this.$_barCodeInsert = $("#barCodeInsert"), this.customerArrears = 0, this.$_note.placeholder(), this.customerCombo = Business.billSupplierCombo($("#customer"), {}), ("add" !== a.status || a.buId) && (this.$_customer.data("contactInfo", {
				id: a.buId,
				name: a.contactName
			}), this.customerCombo.input.val(a.contactName)), this.$_date.datepicker({
				onSelect: function(a) {
					if (!(originalData.id > 0)) {
						var c = a.format("yyyy-MM-dd");
						b.$_number.text(""), Public.ajaxPost("/basedata/systemProfile.do?action=generateDocNo", {
							billType: "PO",
							billDate: c
						}, function(a) {
							200 === a.status ? b.$_number.text(a.data.billNo) : parent.Public.tips({
								type: 1,
								content: a.msg
							})
						})
					}
				}
			}), this.$_deliveryDate.datepicker(), this.classes = this.$_classes.cssRadio({
				callback: function(a) {
					b.$_paymentTxt.text("150501" === a.find("input").val() ? "本次付款:" : "本次退款:")
				}
			}), this.classes.setValue(150501 === a.transType ? 0 : 1), a.description && this.$_note.val(a.description), this.$_discountRate.val(a.disRate), this.$_deduction.val(a.disAmount), this.$_discount.val(a.amount), this.$_payment.val(a.rpAmount), this.$_arrears.val(a.arrears), requiredMoney && ($("#accountWrap").show(), this.accountCombo = Business.accountCombo($("#account"), {
				width: 112,
				height: 300,
				emptyOptions: !0,
				addOptions: {
					text: "多账户",
					value: -1
				},
				callback: {
					onChange: function() {
						if (-1 === this.getValue()) b.chooseAccount();
						else {
							var a = [];
							a.push({
								accId: this.getValue(),
								account: "",
								payment: b.$_payment.val(),
								wayId: 0,
								way: "",
								settlement: ""
							}), b.$_accountInfo.data("accountInfo", a).hide(), b.$_payment.removeAttr("disabled").removeClass("ui-input-dis")
						}
					}
				}
			}), this.accountCombo.selectByValue(a.accId, !1));
			var c = '<a id="savaAndAdd" class="ui-btn ui-btn-sp">保存并新增</a><a id="save" class="ui-btn">保存</a>',
				d = '<a id="add" class="ui-btn ui-btn-sp">新增</a><a href="/scm/invPo.do?action=toPdf&id=' + a.id + '" target="_blank" id="print" class="ui-btn">打印</a><a id="edit" class="ui-btn">保存</a>',
				e = '<a id="add" class="ui-btn ui-btn-sp">新增</a><a href="/scm/invPo.do?action=toPdf&id=' + a.id + '" target="_blank" id="print" class="ui-btn">打印</a>',
				f = "",
				g = "",
				h = "150502" == originalData.transType ? "生成退货单" : "生成购货单",
				i = '<a id="turn" class="ui-btn ' + (2 == a.billStatus ? "ui-btn-dis" : "ui-btn-sc") + '">' + h + "</a>";
			billRequiredCheck ? (f = '<a class="ui-btn" id="audit">审核</a>', g = '<a class="ui-btn" id="reAudit">反审核</a>') : (d = i + d, this.$_checkName.parent().hide());
			var j = '<a class="ui-btn-prev" id="prev" title="上一张"><b></b></a><a class="ui-btn-next" id="next" title="下一张"><b></b></a>';
			this.btn_edit = d, this.btn_audit = f, this.btn_view = e, this.btn_reaudit = g, this.btn_turn = i, a.id > 0 ? (this.$_number.text(a.billNo), this.$_date.val(a.date), this.$_deliveryDate.val(a.deliveryDate), this.$_totalArrears.val(a.totalArrears), this.$_accountInfo.data("accountInfo", a.accounts), -1 === a.accId && (this.$_accountInfo.show(), b.$_payment.attr("disabled", "disabled").addClass("ui-input-dis")), $("#grid").jqGrid("footerData", "set", {
				qty: a.totalQty,
				amount: a.totalAmount
			}), "list" !== urlParam.flag && (j = ""), "edit" === a.status ? this.$_toolBottom.html("<span id=groupBtn>" + d + f + "</span>" + j) : a.checked ? ($("#mark").addClass("has-audit"), this.$_toolBottom.html('<span id="groupBtn">' + i + e + g + "</span>" + j)) : this.$_toolBottom.html('<span id="groupBtn">' + e + "</span>" + j), this.idList = parent.cacheList.purchaseOrderId || [], this.idPostion = $.inArray(String(a.id), this.idList), this.idLength = this.idList.length, 0 === this.idPostion && $("#prev").addClass("ui-btn-prev-dis"), this.idPostion === this.idLength - 1 && $("#next").addClass("ui-btn-next-dis"), this.$_userName.html(a.userName), this.$_modifyTime.html(a.modifyTime), this.$_checkName.html(a.checkName)) : (this.$_toolBottom.html(billRequiredCheck ? "<span id=groupBtn>" + c + f + "</span>" : '<span id="groupBtn">' + c + "</span>"), this.$_userName.html(system.realName || ""), this.$_modifyTime.parent().hide(), this.$_checkName.parent().hide()), disEditable && (THISPAGE.disableEdit(), this.$_toolBottom.hide())
		},
		loadGrid: function(a) {
			function b(a) {
				if (taxRequiredCheck) {
					var b = $("#grid").jqGrid("getRowData", a),
						c = parseFloat(b.taxRate);
					if ($.isNumeric(c)) {
						var d = parseFloat(b.amount),
							e = d * c / 100,
							f = d + e;
						$("#grid").jqGrid("setRowData", a, {
							tax: e,
							taxAmount: f
						})
					}
				}
			}
			function c(a, b, c) {
				return a ? (m(b.rowId), a) : c.invNumber ? c.invSpec ? c.invNumber + " " + c.invName + "_" + c.invSpec : c.invNumber + " " + c.invName : "&#160;"
			}
			function d() {
				var a = $(".goodsAuto")[0];
				return a
			}
			function e(a, b, c) {
				if ("get" === b) {
					if ("" !== $(".goodsAuto").getCombo().getValue()) return $(a).val();
					var d = $(a).parents("tr");
					return d.removeData("goodsInfo"), ""
				}
				"set" === b && $("input", a).val(c)
			}
			function f() {
				$("#initCombo").append($(".goodsAuto").val("").unbind("focus.once"))
			}
			function g() {
				var a = $(".storageAuto")[0];
				return a
			}
			function h(a, b, c) {
				if ("get" === b) {
					if ("" !== $(".storageAuto").getCombo().getValue()) return $(a).val();
					var d = $(a).parents("tr");
					return d.removeData("storageInfo"), ""
				}
				"set" === b && $("input", a).val(c)
			}
			function i() {
				$("#initCombo").append($(".storageAuto").val(""))
			}
			function j() {
				var a = $(".unitAuto")[0];
				return a
			}
			function k(a, b, c) {
				if ("get" === b) {
					if ("" !== $(".unitAuto").getCombo().getValue()) return $(a).val();
					var d = $(a).parents("tr");
					return d.removeData("unitInfo"), ""
				}
				"set" === b && $("input", a).val(c)
			}
			function l() {
				$("#initCombo").append($(".unitAuto").val(""))
			}
			function m(a) {
				var b = $("#" + a).data("goodsInfo");
				if (b) {
					var c = {
						skuId: b.skuId || -1,
						skuName: b.skuName || "",
						mainUnit: b.mainUnit || b.unitName,
						unitId: b.unitId,
						qty: b.qty || 1,
						price: b.price || b.purPrice,
						discountRate: b.discountRate || 0,
						deduction: b.deduction || 0,
						amount: b.amount,
						locationName: b.locationName,
						taxRate: b.taxRate || taxRequiredInput
					};
					c.amount = c.amount ? c.amount : c.price * c.qty;
					var d = Number(c.amount);
					if (taxRequiredCheck) {
						var e = c.taxRate,
							f = d * e / 100,
							g = d + f;
						c.tax = b.tax || f, c.taxAmount = b.taxAmount || g
					}
					var h = $("#grid").jqGrid("setRowData", a, c);
					h && THISPAGE.calTotal()
				}
			}
			var n = this;
			if (a.id) {
				var o = 8 - a.entries.length;
				if (o > 0) for (var p = 0; o > p; p++) a.entries.push({})
			}
			n.newId = 9;
			var q = [{
				name: "operating",
				label: " ",
				width: 60,
				fixed: !0,
				formatter: Public.billsOper_goods,
				align: "center"
			}, {
				name: "goods",
				label: '商品<span id="barCodeInsert">扫描枪录入</span>',
				width: 300,
				classes: "ui-ellipsis",
				formatter: c,
				editable: !0,
				edittype: "custom",
				editoptions: {
					custom_element: d,
					custom_value: e,
					handle: f,
					trigger: "ui-icon-ellipsis"
				},
				enterCallback: function() {
					if ($("#grid").jqGrid("saveCell", curRow, curCol), THISPAGE.$_barCodeInsert.hasClass("active")) {
						var a = $("#" + curRow).next();
						0 == a.length && ($("#grid").jqGrid("addRowData", Number(curRow) + 1, {}, "last"), THISPAGE.newId += 1), $("#" + curRow).data("goodsInfo") && $("#grid").jqGrid("nextCell", curRow + 1, 1)
					} else null != curRow && null != curCol && $("#grid").jqGrid("nextCell", THISPAGE.curID, curCol)
				}
			}, {
				name: "skuId",
				label: "属性ID",
				hidden: !0
			}, {
				name: "skuName",
				label: "属性",
				width: 100,
				classes: "ui-ellipsis",
				hidden: !SYSTEM.enableAssistingProp
			}, {
				name: "mainUnit",
				label: "单位",
				width: 80,
				editable: !0,
				edittype: "custom",
				editoptions: {
					custom_element: j,
					custom_value: k,
					handle: l,
					trigger: "ui-icon-triangle-1-s"
				}
			}, {
				name: "unitId",
				label: "单位Id",
				hidden: !0
			}, {
				name: "qty",
				label: "数量",
				width: 80,
				align: "right",
				formatter: "number",
				formatoptions: {
					decimalPlaces: qtyPlaces
				},
				editable: !0
			}, {
				name: "price",
				label: "购货单价",
				hidden: hiddenAmount,
				width: 100,
				fixed: !0,
				align: "right",
				formatter: "currency",
				formatoptions: {
					showZero: !0,
					decimalPlaces: pricePlaces
				},
				editable: !0
			}, {
				name: "discountRate",
				label: "折扣率(%)",
				hidden: hiddenAmount,
				width: 70,
				fixed: !0,
				align: "right",
				formatter: "integer",
				editable: !0
			}, {
				name: "deduction",
				label: "折扣额",
				hidden: hiddenAmount,
				width: 70,
				fixed: !0,
				align: "right",
				formatter: "currency",
				formatoptions: {
					showZero: !0,
					decimalPlaces: amountPlaces
				},
				editable: !0
			}, {
				name: "amount",
				label: "购货金额",
				hidden: hiddenAmount,
				width: 100,
				fixed: !0,
				align: "right",
				formatter: "currency",
				formatoptions: {
					showZero: !0,
					decimalPlaces: amountPlaces
				},
				editable: !0
			}];
			this.calAmount = "amount", taxRequiredCheck && (q.pop(), q.push({
				name: "amount",
				label: "金额",
				hidden: hiddenAmount,
				width: 100,
				fixed: !0,
				align: "right",
				formatter: "currency",
				formatoptions: {
					showZero: !0,
					decimalPlaces: amountPlaces
				},
				editable: !0
			}, {
				name: "taxRate",
				label: "税率(%)",
				hidden: hiddenAmount,
				width: 70,
				fixed: !0,
				align: "right",
				formatter: "integer",
				editable: !0
			}, {
				name: "tax",
				label: "税额",
				hidden: hiddenAmount,
				width: 70,
				fixed: !0,
				align: "right",
				formatter: "currency",
				formatoptions: {
					showZero: !0,
					decimalPlaces: amountPlaces
				},
				editable: !0
			}, {
				name: "taxAmount",
				label: "价税合计",
				hidden: hiddenAmount,
				width: 100,
				fixed: !0,
				align: "right",
				formatter: "currency",
				formatoptions: {
					showZero: !0,
					decimalPlaces: amountPlaces
				},
				editable: !0
			}), this.calAmount = "taxAmount"), q.push({
				name: "locationName",
				label: '仓库<small id="batchStorage">(批量)</small>',
				width: 100,
				editable: !0,
				edittype: "custom",
				editoptions: {
					custom_element: g,
					custom_value: h,
					handle: i,
					trigger: "ui-icon-triangle-1-s"
				}
			}, {
				name: "description",
				label: "备注",
				width: 150,
				classes: "ui-ellipsis",
				title: !0,
				editable: !0
			}), $("#grid").jqGrid({
				data: a.entries,
				datatype: "clientSide",
				autowidth: !0,
				height: "100%",
				rownumbers: !0,
				gridview: !0,
				onselectrow: !1,
				colModel: q,
				cmTemplate: {
					sortable: !1,
					title: !1
				},
				shrinkToFit: !1,
				forceFit: !0,
				rowNum: 1e3,
				cellEdit: !1,
				cellsubmit: "clientArray",
				localReader: {
					root: "rows",
					records: "records",
					repeatitems: !1,
					id: "id"
				},
				jsonReader: {
					root: "data.entries",
					records: "records",
					repeatitems: !1,
					id: "id"
				},
				loadComplete: function(a) {
					if (urlParam.id > 0) {
						var b = a.rows,
							c = b.length;
						n.newId = c + 1;
						for (var d = 0; c > d; d++) {
							var e = d + 1,
								f = b[d];
							if ($.isEmptyObject(b[d])) break;
							var g = $.extend(!0, {
								id: f.invId,
								number: f.invNumber,
								name: f.invName,
								spec: f.invSpec,
								unitId: f.unitId,
								unitName: f.mainUnit
							}, f);
							g.id = f.invId, $("#" + e).data("goodsInfo", g).data("storageInfo", {
								id: f.locationId,
								name: f.locationName
							}).data("unitInfo", {
								unitId: f.unitId,
								name: f.mainUnit
							})
						}
					}
				},
				gridComplete: function() {
					setTimeout(function() {
						Public.autoGrid($("#grid"))
					}, 10)
				},
				afterEditCell: function(a, b, c, d, e) {
					if ("goods" === b) {
						var f = $("#" + a).data("goodsInfo");
						if (f) {
							var g = $("#grid").jqGrid("getRowData", a);
							f = $.extend(!0, {}, f), f.mainUnit = g.mainUnit, f.unitId = g.unitId, f.qty = g.qty, f.price = g.price, f.discountRate = g.discountRate, f.deduction = g.deduction, f.amount = g.amount, f.taxRate = g.taxRate, f.tax = g.tax, f.taxAmount = g.taxAmount, f.locationName = g.locationName, $("#" + a).data("goodsInfo", f)
						}
						$("#" + d + "_goods", "#grid").val(c), THISPAGE.goodsCombo.selectByText(c), THISPAGE.curID = a
					}
					if ("locationName" === b && $("#" + d + "_locationName", "#grid").val(c), "mainUnit" === b) {
						$("#" + d + "_mainUnit", "#grid").val(c);
						var h = $("#" + a).data("unitInfo") || {};
						if (!h.unitId || "0" === h.unitId) return $("#grid").jqGrid("restoreCell", d, e), curCol = e + 1, void $("#grid").jqGrid("nextCell", d, e + 1);
						THISPAGE.unitCombo.enable(), THISPAGE.unitCombo.loadData(function() {
							for (var a = {}, b = 0; b < SYSTEM.unitInfo.length; b++) {
								var c = SYSTEM.unitInfo[b],
									d = h.unitId;
								h.unitId == c.id && (h = c), h.unitId = d;
								var e = c.unitTypeId || b;
								a[e] || (a[e] = []), a[e].push(c)
							}
							return h.unitTypeId ? a[h.unitTypeId] : [h]
						}), THISPAGE.unitCombo.selectByText(c)
					}
				},
				formatCell: function() {},
				beforeSubmitCell: function() {},
				beforeSaveCell: function(a, b, c) {
					if ("goods" === b) {
						var d = $("#" + a).data("goodsInfo");
						if (d) return d.skuClassId && SYSTEM.enableAssistingProp && (n.skey = c, setTimeout(function() {
							$("#grid").jqGrid("restoreCell", curRow, 2), $("#grid").jqGrid("editCell", curRow, 2, !0), $("#grid").jqGrid("setCell", curRow, 2, "")
						}, 10)), c;
						n.skey = c;
						var e, f = function(b) {
								b.skuClassId && SYSTEM.enableAssistingProp ? (Business.billSkuManage($("#" + a), b), e = "&#160;") : ($("#" + a).data("goodsInfo", b).data("storageInfo", {
									id: b.locationId,
									name: b.locationName
								}).data("unitInfo", {
									unitId: b.unitId,
									name: b.unitName
								}), e = Business.formatGoodsName(b))
							};
						return THISPAGE.$_barCodeInsert && THISPAGE.$_barCodeInsert.hasClass("active") ? Business.cacheManage.getGoodsInfoByBarCode(c, f, !0) : Business.cacheManage.getGoodsInfoByNumber(c, f, !0), e ? e : ($.dialog({
							width: 775,
							height: 510,
							title: "选择商品",
							content: "url:../../settings/goods_batch",
							data: {
								skuMult: SYSTEM.enableAssistingProp,
								skey: n.skey,
								callback: function(a, b, c) {
									"" === b && ($("#grid").jqGrid("addRowData", a, {}, "last"), n.newId = a + 1), setTimeout(function() {
										$("#grid").jqGrid("editCell", c, 2, !0)
									}, 10), n.calTotal()
								}
							},
							init: function() {
								n.skey = ""
							},
							lock: !0,
							button: [{
								name: "选中",
								defClass: "ui_state_highlight fl",
								focus: !0,
								callback: function() {
									return this.content.callback && this.content.callback("purchase"), !1
								}
							}, {
								name: "选中并关闭",
								defClass: "ui_state_highlight",
								callback: function() {
									return this.content.callback("purchase"), this.close(), !1
								}
							}, {
								name: "关闭",
								callback: function() {
									return !0
								}
							}]
						}), setTimeout(function() {
							$("#grid").jqGrid("editCell", curRow, 2, !0), $("#grid").jqGrid("setCell", curRow, 2, "")
						}, 10), "&#160;")
					}
				},
				afterSaveCell: function(a, c, d, e, f) {
					switch (c) {
					case "goods":
						break;
					case "qty":
						var d = parseFloat(d),
							g = parseFloat($("#grid").jqGrid("getCell", a, f + 1)),
							h = parseFloat($("#grid").jqGrid("getCell", a, f + 2));
						if ($.isNumeric(g)) if ($.isNumeric(h)) var i = d * g * h / 100,
							j = d * g - i,
							k = $("#grid").jqGrid("setRowData", a, {
								deduction: i,
								amount: j
							});
						else var k = $("#grid").jqGrid("setRowData", a, {
							amount: d * g
						});
						b(a), k && THISPAGE.calTotal();
						break;
					case "price":
						var d = parseFloat(d),
							l = parseFloat($("#grid").jqGrid("getCell", a, f - 1)),
							h = parseFloat($("#grid").jqGrid("getCell", a, f + 1));
						if ($.isNumeric(l)) if ($.isNumeric(h)) var i = d * l * h / 100,
							j = d * l - i,
							k = $("#grid").jqGrid("setRowData", a, {
								deduction: i,
								amount: j
							});
						else var k = $("#grid").jqGrid("setRowData", a, {
							amount: d * l
						});
						b(a), k && THISPAGE.calTotal();
						break;
					case "discountRate":
						var d = parseFloat(d),
							l = parseFloat($("#grid").jqGrid("getCell", a, f - 2)),
							g = parseFloat($("#grid").jqGrid("getCell", a, f - 1));
						if ($.isNumeric(l) && $.isNumeric(g)) var m = l * g,
							i = m * d / 100,
							j = m - i,
							k = $("#grid").jqGrid("setRowData", a, {
								deduction: i,
								amount: j
							});
						b(a), k && THISPAGE.calTotal();
						break;
					case "deduction":
						var d = parseFloat(d),
							l = parseFloat($("#grid").jqGrid("getCell", a, f - 3)),
							g = parseFloat($("#grid").jqGrid("getCell", a, f - 2));
						if ($.isNumeric(l) && $.isNumeric(g)) var m = l * g,
							j = m - d,
							h = m ? (100 * d / m).toFixed(amountPlaces) : 0,
							k = $("#grid").jqGrid("setRowData", a, {
								discountRate: h,
								amount: j
							});
						b(a), k && THISPAGE.calTotal();
						break;
					case "amount":
						var d = parseFloat(d),
							n = $("#grid").jqGrid("getRowData", a);
						if ($.isNumeric(d)) {
							var i = parseFloat(n.deduction),
								o = parseFloat(n.qty),
								g = (d + i) / o;
							if ($.isNumeric(o) && $.isNumeric(g)) {
								var m = o * g,
									h = m ? (100 * i / m).toFixed(amountPlaces) : 0;
								$("#grid").jqGrid("setRowData", a, {
									discountRate: h
								})
							}
							$("#grid").jqGrid("setRowData", a, {
								discountRate: h,
								price: g
							})
						}
						b(a), THISPAGE.calTotal();
						break;
					case "taxRate":
						var p = d,
							d = parseFloat(d),
							n = $("#grid").jqGrid("getRowData", a),
							j = parseFloat(n.amount);
						if ($.isNumeric(d)) {
							var q = j * d / 100,
								r = j + q,
								k = $("#grid").jqGrid("setRowData", a, {
									tax: q,
									taxAmount: r
								});
							k && THISPAGE.calTotal();
							break
						}
						if ("" === p) {
							var k = $("#grid").jqGrid("setRowData", a, {
								tax: "",
								taxAmount: j
							});
							k && THISPAGE.calTotal();
							break
						}
					case "tax":
						var d = parseFloat(d),
							n = $("#grid").jqGrid("getRowData", a);
						if ($.isNumeric(d)) {
							var j = parseFloat(n.amount),
								r = j + d,
								k = $("#grid").jqGrid("setRowData", a, {
									taxAmount: r
								});
							k && THISPAGE.calTotal()
						}
						break;
					case "taxAmount":
						var d = parseFloat(d),
							n = $("#grid").jqGrid("getRowData", a);
						if ($.isNumeric(d)) {
							var i = parseFloat(n.deduction),
								s = parseFloat(n.taxRate) / 100,
								j = d / (1 + s),
								o = parseFloat(n.qty),
								h = (100 * i / (j + i)).toFixed(amountPlaces),
								g = (j + i) / o,
								q = d - j,
								k = $("#grid").jqGrid("setRowData", a, {
									discountRate: h,
									price: g,
									amount: j,
									tax: q
								});
							k && THISPAGE.calTotal()
						}
					}
				},
				loadonce: !0,
				footerrow: !0,
				userData: {
					goods: "合计：",
					qty: a.totalQty,
					deduction: a.totalDiscount,
					amount: a.totalAmount,
					tax: a.totalTax,
					taxAmount: a.totalTaxAmount
				},
				userDataOnFooter: !0,
				loadError: function(a, b) {
					Public.tips({
						type: 1,
						content: "Type: " + b + "; Response: " + a.status + " " + a.statusText
					})
				}
			}), $("#grid").jqGrid("setGridParam", {
				cellEdit: !0
			})
		},
		reloadData: function(a) {
			function b() {
				c.$_customer.data("contactInfo", {
					id: a.buId,
					name: a.contactName
				}), c.customerCombo.input.val(a.contactName), c.$_date.val(a.date), c.$_deliveryDate.val(a.deliveryDate), c.$_number.text(a.billNo), c.classes.setValue(150501 === a.transType ? 0 : 1), c.$_note.val(a.description), c.$_discountRate.val(a.disRate), c.$_deduction.val(a.disAmount), c.$_discount.val(a.amount), c.$_payment.val(a.rpAmount), c.accountCombo.selectByValue(a.accId, !1), c.$_accountInfo.data("accountInfo", a.accounts), -1 === a.accId ? c.$_accountInfo.show() : c.$_accountInfo.hide(), c.$_arrears.val(a.arrears), c.$_totalArrears.val(a.totalArrears), c.$_userName.html(a.userName), c.$_modifyTime.html(a.modifyTime), c.$_checkName.html(a.checkName)
			}
			$("#grid").clearGridData();
			var c = this;
			originalData = a;
			var d = 8 - a.entries.length;
			if (d > 0) for (var e = 0; d > e; e++) a.entries.push({});
			$("#grid").jqGrid("setGridParam", {
				data: a.entries,
				userData: {
					qty: a.totalQty,
					deduction: a.totalDiscount,
					amount: a.totalAmount,
					tax: a.totalTax,
					taxAmount: a.totalTaxAmount
				}
			}).trigger("reloadGrid"), b(), "edit" === a.status ? this.editable || (c.enableEdit(), $("#groupBtn").html(c.btn_edit + c.btn_audit), $("#mark").removeClass("has-audit")) : this.editable && (c.disableEdit(), $("#groupBtn").html(c.btn_turn + c.btn_view + c.btn_reaudit), $("#mark").addClass("has-audit"))
		},
		initCombo: function() {
			this.goodsCombo = Business.billGoodsCombo($(".goodsAuto"), {
				disSerNum: !0
			}), this.storageCombo = Business.billStorageCombo($(".storageAuto")), this.unitCombo = Business.unitCombo($(".unitAuto"), {
				defaultSelected: -1,
				forceSelection: !1
			})
		},
		disableEdit: function() {
			this.customerCombo.disable(), this.$_date.attr("disabled", "disabled").addClass("ui-input-dis"), this.$_deliveryDate.attr("disabled", "disabled").addClass("ui-input-dis"), this.$_note.attr("disabled", "disabled").addClass("ui-input-dis"), this.$_discountRate.attr("disabled", "disabled").addClass("ui-input-dis"), this.$_deduction.attr("disabled", "disabled").addClass("ui-input-dis"), this.$_payment.attr("disabled", "disabled").addClass("ui-input-dis"), this.accountCombo.disable(), $("#grid").jqGrid("setGridParam", {
				cellEdit: !1
			}), this.editable = !1
		},
		enableEdit: function() {
			disEditable || (this.customerCombo.enable(), this.$_date.removeAttr("disabled").removeClass("ui-input-dis"), this.$_deliveryDate.removeAttr("disabled").removeClass("ui-input-dis"), this.$_note.removeAttr("disabled").removeClass("ui-input-dis"), this.$_discountRate.removeAttr("disabled").removeClass("ui-input-dis"), this.$_deduction.removeAttr("disabled").removeClass("ui-input-dis"), this.$_payment.removeAttr("disabled").removeClass("ui-input-dis"), this.accountCombo.enable(), $("#grid").jqGrid("setGridParam", {
				cellEdit: !0
			}), this.editable = !0)
		},
		chooseAccount: function(a) {
			var b = this;
			b.$_accountInfo.show(), b.$_payment.attr("disabled", "disabled").addClass("ui-input-dis"), $.dialog({
				width: 670,
				height: 250,
				title: "多账户结算",
				content: "url:../../settings/choose_account",
				data: {
					accountInfo: a,
					type: "purchase"
				},
				lock: !0,
				ok: function() {
					var a = this.content.callback();
					return a ? (b.$_payment.val(a.payment).trigger("keyup"), b.$_accountInfo.data("accountInfo", a.accounts), b.accountCombo.blur(), void 0) : !1
				},
				cancel: !0
			})
		},
		addEvent: function() {
			var a = this;
			this.customerCombo.input.enterKey(), this.$_date.bind("keydown", function(b) {
				13 === b.which && a.$_deliveryDate.trigger("focus").select()
			}).bind("focus", function() {
				a.dateValue = $(this).val()
			}).bind("blur", function() {
				var b = /((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/;
				b.test($(this).val()) || (parent.Public.tips({
					type: 2,
					content: "日期格式有误！如：2012-08-08。"
				}), $(this).val(a.dateValue))
			}), this.$_deliveryDate.bind("keydown", function(a) {
				13 === a.which && $("#grid").jqGrid("editCell", 1, 2, !0)
			}).bind("focus", function() {
				a.dateValue = $(this).val()
			}).bind("blur", function() {
				var b = /((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/;
				b.test($(this).val()) || (parent.Public.tips({
					type: 2,
					content: "日期格式有误！如：2012-08-08。"
				}), $(this).val(a.dateValue))
			}), this.$_note.enterKey(), this.$_discount.enterKey(), this.$_discountRate.enterKey(), $(".grid-wrap").on("click", ".ui-icon-triangle-1-s", function() {
				var b = $(this).siblings();
				setTimeout(function() {
					b.hasClass("unitAuto") ? b.trigger("click") : (a.storageCombo.active = !0, a.storageCombo.doQuery())
				}, 10)
			}), Business.billsEvent(a, "purchase"), this.$_deduction.keyup(function() {
				var b = Number($(this).val()),
					c = Number($("#grid").jqGrid("footerData", "get")[a.calAmount].replace(/,/g, "")),
					d = (c - b).toFixed(amountPlaces);
				if (c) {
					var e = b / c * 100,
						f = d - Number($.trim(a.$_payment.val()));
					THISPAGE.$_discountRate.val(e.toFixed(amountPlaces)), THISPAGE.$_discount.val(d), THISPAGE.$_arrears.val(f.toFixed(amountPlaces))
				}
			}).on("keypress", function(a) {
				Public.numerical(a)
			}).on("focus", function() {
				this.select()
			}), this.$_discountRate.keyup(function() {
				var b = Number($(this).val()),
					c = Number($("#grid").jqGrid("footerData", "get")[a.calAmount].replace(/,/g, "")),
					d = c * (b / 100),
					e = d.toFixed(amountPlaces),
					f = (c - e).toFixed(amountPlaces),
					g = f - Number($.trim(a.$_payment.val()));
				THISPAGE.$_deduction.val(e), THISPAGE.$_discount.val(f), THISPAGE.$_arrears.val(g.toFixed(amountPlaces))
			}).on("keypress", function(a) {
				Public.numerical(a)
			}).on("focus", function() {
				this.select()
			}), this.$_payment.keyup(function() {
				var b = $(this).val() || 0,
					c = a.$_discount.val(),
					d = Number(parseFloat(c) - parseFloat(b)),
					e = Number(d + THISPAGE.customerArrears);
				THISPAGE.$_arrears.val(d.toFixed(amountPlaces)), THISPAGE.$_totalArrears.val(e.toFixed(amountPlaces));
				var f = a.$_accountInfo.data("accountInfo");
				f && 1 === f.length && (f[0].payment = b)
			}).on("keypress", function(a) {
				Public.numerical(a)
			}).on("focus", function() {
				this.select()
			}), $(".wrapper").on("click", "#save", function(b) {
				b.preventDefault();
				var c = $(this),
					d = THISPAGE.getPostData();
				d && ("edit" === originalData.stata && (d.id = originalData.id, d.stata = "edit"), c.ajaxPost("../../scm/invPo/add?action=add", {
					postData: JSON.stringify(d)
				}, function(b) {
					200 === b.status ? (a.$_modifyTime.html((new Date).format("yyyy-MM-dd hh:mm:ss")).parent().show(), originalData.id = b.data.id, a.$_toolBottom.html(billRequiredCheck ? '<span id="groupBtn">' + a.btn_edit + a.btn_audit + "</span>" : '<span id="groupBtn">' + a.btn_edit + "</span>"), parent.Public.tips({
						content: "保存成功！"
					})) : parent.Public.tips({
						type: 1,
						content: b.msg
					})
				}))
			}), $(".wrapper").on("click", "#savaAndAdd", function(b) {
				b.preventDefault();
				var c = $(this),
					d = THISPAGE.getPostData();
				d && c.ajaxPost("../../scm/invPo/addNew?action=addNew", {
					postData: JSON.stringify(d)
				}, function(b) {
					if (200 === b.status) {
						a.$_number.text(b.data.billNo), $("#grid").clearGridData(), $("#grid").clearGridData(!0);
						for (var c = 1; 8 >= c; c++) $("#grid").jqGrid("addRowData", c, {});
						a.newId = 9, a.$_note.val(""), a.$_discountRate.val(originalData.disRate), a.$_deduction.val(originalData.disAmount), a.$_discount.val(originalData.amount), a.$_payment.val(originalData.rpAmount), a.$_arrears.val(originalData.arrears), a.accountCombo.selectByValue(0, !0), parent.Public.tips({
							content: "保存成功！"
						})
					} else parent.Public.tips({
						type: 1,
						content: b.msg
					})
				})
			}), $(".wrapper").on("click", "#edit", function(b) {
				if (b.preventDefault(), Business.verifyRight("PO_UPDATE")) {
					var c = $(this),
						d = THISPAGE.getPostData();
					d && c.ajaxPost("../../scm/invPo/updateInvPo?action=updateInvPo", {
						postData: JSON.stringify(d)
					}, function(b) {
						200 === b.status ? (a.$_modifyTime.html((new Date).format("yyyy-MM-dd hh:mm:ss")).parent().show(), originalData.id = b.data.id, parent.Public.tips({
							content: "修改成功！"
						})) : parent.Public.tips({
							type: 1,
							content: b.msg
						})
					})
				}
			}), $(".wrapper").on("click", "#audit", function(b) {
				if (b.preventDefault(), Business.verifyRight("PO_CHECK")) {
					var c = $(this),
						d = THISPAGE.getPostData();
					d && c.ajaxPost("../../scm/invPo/checkInvPo?action=checkInvPo", {
						postData: JSON.stringify(d)
					}, function(b) {
						200 === b.status ? (originalData.id = b.data.id, $("#mark").addClass("has-audit"), $("#edit").hide(), a.$_checkName.html(SYSTEM.realName).parent().show(), a.disableEdit(), $("#groupBtn").html(a.btn_turn + a.btn_view + a.btn_reaudit), $("#turn").html("150502" == a.classes.getValue() ? "生成退货单" : "生成购货单"), parent.Public.tips({
							content: "审核成功！"
						})) : parent.Public.tips({
							type: 1,
							content: b.msg
						})
					})
				}
			}), $(".wrapper").on("click", "#reAudit", function(b) {
				if (b.preventDefault(), Business.verifyRight("PO_UNCHECK")) {
					var c = $(this),
						d = THISPAGE.getPostData();
					d && c.ajaxPost("../../scm/invPo/revsCheckInvPo?action=revsCheckInvPo", {
						id: originalData.id
					}, function(b) {
						200 === b.status ? ($("#mark").removeClass(), $("#edit").show(), a.$_checkName.html(""), a.enableEdit(), $("#groupBtn").html(a.btn_edit + a.btn_audit), parent.Public.tips({
							content: "反审核成功！"
						})) : parent.Public.tips({
							type: 1,
							content: b.msg
						})
					})
				}
			}), $(".wrapper").on("click", "#add", function(a) {
				a.preventDefault(), Business.verifyRight("PO_ADD") && parent.tab.overrideSelectedTabItem({
					tabid: "purchase-purchaseOrder",
					text: "购货订单",
					url: "scm/invPo/initPo?action=initPo"
				})
			}), $(".wrapper").on("click", "#print", function(a) {
				a.preventDefault(), Business.verifyRight("PO_PRINT") && Public.print({
					title: "购货订单列表",
					$grid: $("#grid"),
					pdf: "/scm/invPo.do?action=toPdf",
					billType: 10301,
					filterConditions: {
						id: originalData.id
					}
				})
			}), this.$_accountInfo.click(function() {
				var b = $(this).data("accountInfo");
				a.chooseAccount(b)
			}), $(".wrapper").on("click", "#turn", function(b) {
				if (b.preventDefault(), $(this).hasClass("ui-btn-dis")) return void parent.Public.tips({
					type: 1,
					content: "该订单已全部入库，不能生成购货单！"
				});
				var c = "购货单",
					d = "purchase-purchase",
					e = a.classes.getValue();
				if ("150502" == e) var c = "购货退货单",
					d = "purchase-purchaseBack";
				parent.tab.addTabItem({
					tabid: d,
					text: c,
					url: "scm/invPu/initPur?action=initPur&id=" + originalData.id + "&flag=list&turn&transType=" + e
				}), parent.tab.reload(d)
			}), $("#prev").click(function(b) {
				return b.preventDefault(), $(this).hasClass("ui-btn-prev-dis") ? (parent.Public.tips({
					type: 2,
					content: "已经没有上一张了！"
				}), !1) : (a.idPostion = a.idPostion - 1, 0 === a.idPostion && $(this).addClass("ui-btn-prev-dis"), loading = $.dialog.tips("数据加载中...", 1e3, "loading.gif", !0), Public.ajaxGet("../../scm/invPo/update?action=update", {
					id: a.idList[a.idPostion]
				}, function(b) {
					originalData.id = a.idList[a.idPostion], THISPAGE.reloadData(b.data), $("#next").removeClass("ui-btn-next-dis"), loading && loading.close()
				}), void 0)
			}), $("#next").click(function(b) {
				return b.preventDefault(), $(this).hasClass("ui-btn-next-dis") ? (parent.Public.tips({
					type: 2,
					content: "已经没有下一张了！"
				}), !1) : (a.idPostion = a.idPostion + 1, a.idLength === a.idPostion + 1 && $(this).addClass("ui-btn-next-dis"), loading = $.dialog.tips("数据加载中...", 1e3, "loading.gif", !0), Public.ajaxGet("../../scm/invPo/update?action=update", {
					id: a.idList[a.idPostion]
				}, function(b) {
					originalData.id = a.idList[a.idPostion], THISPAGE.reloadData(b.data), $("#prev").removeClass("ui-btn-prev-dis"), loading && loading.close()
				}), void 0)
			}), THISPAGE.$_barCodeInsert.click(function() {
				var a = 1;
				THISPAGE.$_barCodeInsert.hasClass("active") ? (THISPAGE.$_barCodeInsert.removeClass("active"), a = null, THISPAGE.goodsCombo.opts.customMatch = null) : (THISPAGE.$_barCodeInsert.addClass("active"), THISPAGE.goodsCombo.opts.customMatch = function(a, b) {
					var c = a.rawData.barCode.toLowerCase().search(b);
					return /^\d+$/.test(b) && 0 == c ? !0 : void 0
				}), $.cookie("BarCodeInsert", a)
			}), $(window).resize(function() {
				Public.autoGrid($("#grid"))
			})
		},
		resetData: function() {
			var a = this;
			$("#grid").clearGridData();
			for (var b = 1; 8 >= b; b++) $("#grid").jqGrid("addRowData", b, {}), $("#grid").jqGrid("footerData", "set", {
				qty: 0,
				amount: 0
			});
			a.$_note.val(""), a.$_discountRate.val(originalData.disRate), a.$_deduction.val(originalData.disAmount), a.$_discount.val(originalData.amount), a.$_payment.val(originalData.rpAmount), a.$_arrears.val(originalData.arrears)
		},
		calTotal: function() {
			for (var a = $("#grid").jqGrid("getDataIDs"), b = 0, c = 0, d = 0, e = 0, f = 0, g = 0, h = a.length; h > g; g++) {
				var i = a[g],
					j = $("#grid").jqGrid("getRowData", i);
				j.qty && (b += parseFloat(j.qty)), j.deduction && (c += parseFloat(j.deduction)), j.amount && (d += parseFloat(j.amount)), j.tax && (e += parseFloat(j.tax)), j.taxAmount && (f += parseFloat(j.taxAmount))
			}
			if ($("#grid").jqGrid("footerData", "set", {
				qty: b,
				deduction: c,
				amount: d,
				tax: e,
				taxAmount: f
			}), taxRequiredCheck) var k = (f - Number(this.$_deduction.val())).toFixed(2);
			else var k = (d - Number(this.$_deduction.val())).toFixed(2);
			var l = (k - Number(this.$_payment.val())).toFixed(2);
			this.$_discount.val(k), this.$_arrears.val(l)
		},
		_getEntriesData: function() {
			for (var a = [], b = $("#grid").jqGrid("getDataIDs"), c = 0, d = b.length; d > c; c++) {
				var e, f = b[c],
					g = $("#grid").jqGrid("getRowData", f);
				if ("" !== g.goods) {
					var h = $("#" + f).data("goodsInfo"),
						i = $("#" + f).data("storageInfo"),
						j = $("#" + f).data("unitInfo") || {};
					e = {
						invId: h.id,
						invNumber: h.number,
						invName: h.name,
						invSpec: h.spec,
						skuId: h.skuId || -1,
						skuName: h.skuName || "",
						unitId: j.unitId || -1,
						mainUnit: j.name || "",
						qty: g.qty,
						price: g.price,
						discountRate: g.discountRate,
						deduction: g.deduction,
						amount: g.amount,
						description: g.description,
						locationId: i.id,
						locationName: i.name
					}, taxRequiredCheck && (e.taxRate = g.taxRate, e.tax = g.tax, e.taxAmount = g.taxAmount), a.push(e)
				}
			}
			return a
		},
		getPostData: function() {
			var a = this,
				b = this;
			null !== curRow && null !== curCol && ($("#grid").jqGrid("saveCell", curRow, curCol), curRow = null, curCol = null);
			var c = b.$_customer.find("input");
			if ("" === c.val()) return b.$_customer.removeData("contactInfo"), parent.Public.tips({
				type: 2,
				content: "请选择供应商！"
			}), !1;
			var d = b.$_customer.data("contactInfo");
			if (!d || !d.id) return setTimeout(function() {
				c.focus().select()
			}, 15), parent.Public.tips({
				type: 2,
				content: "当前供应商不存在！"
			}), !1;
			var e = this._getEntriesData();
			if (e.length > 0) {
				var f = $.trim(a.$_note.val()),
					g = {
						id: originalData.id,
						buId: d.id,
						contactName: d.name,
						date: $.trim(a.$_date.val()),
						deliveryDate: $.trim(a.$_deliveryDate.val()),
						billNo: $.trim(a.$_number.text()),
						transType: a.classes.getValue(),
						entries: e,
						totalQty: $("#grid").jqGrid("footerData", "get").qty.replace(/,/g, ""),
						totalAmount: $("#grid").jqGrid("footerData", "get").amount.replace(/,/g, ""),
						description: f === a.$_note[0].defaultValue ? "" : f
					};
				return taxRequiredCheck && (g.totalTax = $("#grid").jqGrid("footerData", "get").tax.replace(/,/g, ""), g.totalTaxAmount = $("#grid").jqGrid("footerData", "get").taxAmount.replace(/,/g, "")), g
			}
			return parent.Public.tips({
				type: 2,
				content: "商品信息不能为空！"
			}), $("#grid").jqGrid("editCell", 1, 2, !0), !1
		}
	},
	hasLoaded = !1,
	originalData;
if (urlParam.id) {
	if (!hasLoaded) {
		var $_bills = $(".bills").hide();
		Public.ajaxGet("../../scm/invPo/update?action=update", {
			id: urlParam.id
		}, function(a) {
			200 === a.status ? (originalData = a.data, THISPAGE.init(a.data), $_bills.show(), hasLoaded = !0) : parent.Public.tips({
				type: 1,
				content: a.msg
			})
		})
	}
} else originalData = {
	id: -1,
	status: "add",
	customer: 0,
	transType: 150501,
	entries: [{
		id: "1"
	}, {
		id: "2"
	}, {
		id: "3"
	}, {
		id: "4"
	}, {
		id: "5"
	}, {
		id: "6"
	}, {
		id: "7"
	}, {
		id: "8"
	}],
	totalQty: 0,
	totalDiscount: 0,
	totalAmount: 0,
	totalTax: 0,
	totalTaxAmount: 0,
	disRate: 0,
	disAmount: 0,
	amount: "0.00",
	rpAmount: "0.00",
	arrears: "0.00",
	accId: 0
}, THISPAGE.init(originalData);