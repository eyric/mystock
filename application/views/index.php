<?php $this->load->view('header'); ?>

<script type="text/javascript">
    var DOMAIN = document.domain;
    var WDURL = "<?php echo site_url()?>";
    var SCHEME = "<?php echo sys_skin()?>";
    try {
        document.domain = '<?php echo base_url()?>';
    } catch (e) {
    }
    //ctrl+F5 增加版本号来清空iframe的缓存的
    $(document).keydown(function (event) {
        /* Act on the event */
        if (event.keyCode === 116 && event.ctrlKey) {
            var defaultPage = Public.getDefaultPage();
            var href = defaultPage.location.href.split('?')[0] + '?';
            var params = Public.urlParam();
            params['version'] = Date.parse((new Date()));
            for (i in params) {
                if (i && typeof i != 'function') {
                    href += i + '=' + params[i] + '&';
                }
            }
            defaultPage.location.href = href;
            event.preventDefault();
        }
    });
</script>

<link href="<?php echo base_url() ?>statics/css/base.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url() ?>statics/css/<?php echo sys_skin() ?>/default.css?ver=20150522" rel="stylesheet"
      type="text/css" id="defaultFile">
<script src="<?php echo skin_url() ?>/js/common/tabs.js?ver=20150522"></script>
<!-- author：357058607 -->


<script>
    var CONFIG = {
        DEFAULT_PAGE: true,
        SERVICE_URL: '<?php echo base_url()?>'
    };
    //系统参数控制
    var SYSTEM = {
        version: 1,
        skin: "<?php echo sys_skin()?>",
        language: "",
        site: "",
        curDate: "1033737952010",  //系统当前日期
        DBID: "88886683", //账套ID
        serviceType: "12", //账套类型，13：表示收费服务，12：表示免费服务

        realName: "<?php echo $name;?>", //真实姓名
        userName: "<?php echo $username;?>", //用户名
        companyName: "<?php echo $system['companyName']?>",	//公司名称
        companyAddr: "<?php echo $system['companyAddr']?>",	//公司地址
        phone: "<?php echo $system['phone']?>",	//公司电话
        fax: "<?php echo $system['fax']?>",	//公司传真
        postcode: "<?php echo $system['postcode']?>",	//公司邮编
        startDate: "", //启用日期
        currency: "RMB",	//本位币
        qtyPlaces: "<?php echo $system['qtyPlaces']?>",	//数量小数位
        pricePlaces: "<?php echo $system['pricePlaces']?>",	//单价小数位
        amountPlaces: "<?php echo $system['amountPlaces']?>", //金额小数位
        valMethods: "<?php echo $system['valMethods']?>",	//存货计价方法

        invEntryCount: "",//试用版单据分录数
        rights: {},//权限列表
        billRequiredCheck: 0, //是否启用单据审核功能  1：是、0：否
        requiredCheckStore: <?php echo $system['requiredCheckStore']?>, //是否检查负库存  1：是、0：否
        hasOnlineStore: 0,	//是否启用网店
        enableStorage: 0,	//是否启用仓储
        genvChBill: 0,	//生成凭证后是否允许修改单据
        requiredMoney: 1, //是否启用资金功能  1：是、0：否
        taxRequiredCheck: 0,
        taxRequiredInput: 17,
        isAdmin: true, //是否管理员
        siExpired: false,//是否过期
        siType: 1, //服务版本，1表示基础版，2表示标准版
        siVersion: 4, //1表示试用、2表示免费（百度版）、3表示收费，4表示体验版
        Mobile: "",//当前用户手机号码
        isMobile: true,//是否验证手机
        isshortUser: false,//是否联邦用户
        shortName: "",//shortName
        isOpen: false,//是否弹出手机验证
        enableAssistingProp: 0, //是否开启辅助属性功能  1：是、0：否
        ISSERNUM: 0, //是否启用序列号 1：是、0：否 （与enableAssistingProp对立，只能启用其一）
        ISWARRANTY: 0 //是否启用保质期  1：是、0：否
    };
    //区分服务支持
    SYSTEM.servicePro = SYSTEM.siType === 2 ? 'forbscm3' : 'forscm3';
    var cacheList = {};	//缓存列表查询
    //全局基础数据
    (function () {
        /*
         * 判断IE6，提示使用高级版本
         */
        if (Public.isIE6) {
            var Oldbrowser = {
                init: function () {
                    this.addDom();
                },
                addDom: function () {
                    var html = $('<div id="browser">您使用的浏览器版本过低，影响网页性能，建议您换用<a href="http://www.google.cn/chrome/intl/zh-CN/landing_chrome.html" target="_blank">谷歌</a>、<a href="http://download.microsoft.com/download/4/C/A/4CA9248C-C09D-43D3-B627-76B0F6EBCD5E/IE9-Windows7-x86-chs.exe" target="_blank">IE9</a>、或<a href=http://firefox.com.cn/" target="_blank">火狐浏览器</a>，以便更好的使用！<a id="bClose" title="关闭">x</a></div>').insertBefore('#container').slideDown(500);
                    this._colse();
                },
                _colse: function () {
                    $('#bClose').click(function () {
                        $('#browser').remove();
                    });
                }
            };
            Oldbrowser.init();
        }
        ;
        getPageConfig();
        getGoods();
        getStorage();
        getCustomer();
        getSupplier();
        getAddr();
        getUnit();
        getUnitGroup();
        getAccounts();
        getAssistingPropType();
        getAssistingProp();
        getAssistingPropGroup();
        getStaff();
        getBatch();
    })();
    //缓存用户配置
    function getPageConfig() {
        //return;
        Public.ajaxGet('<?php echo site_url()?>/basedata/userSetting?action=list', {}, function (data) {
            if (data.status === 200) {
                SYSTEM.pageConfigInfo = {};
                for (var i = 0; i < data.data.rows.length; i++) {
                    var conf = data.data.rows[i];
                    SYSTEM.pageConfigInfo['' + conf.key] = conf['value'] || {};
                    for (var gridId in conf.grids) {
                        var g = conf.grids[gridId];
                        if (typeof g != 'function' && g.isReg) {
                            var colModel = g.colModel;
                            var tmpArr = [];
                            for (var i = 0; i < colModel.length; i++) {
                                var col = colModel[i];
                                tmpArr.push({
                                    name: col['name']//列名,唯一标识
                                    , label: col['label']//列名
                                    , hidden: col['hidden']//显示与隐藏
                                    , width: col['width']//宽度
                                })
                            }
                            ;
                            g.colModel = tmpArr;
                        }
                    }
                }
                ;
            } else if (data.status === 250) {
                SYSTEM.pageConfigInfo = {};
            } else {
                Public.tips({type: 1, content: data.msg});
            }
        });
    }
    ;
    //缓存商品信息
    function getGoods() {
        if (SYSTEM.isAdmin || SYSTEM.rights.INVENTORY_QUERY) {
            //&isDelete=2 获取全部，很奇葩的定义。。。
            Public.ajaxGet('<?php echo site_url()?>/basedata/inventory?action=list&isDelete=2', {rows: 5000}, function (data) {
                if (data.status === 200) {
                    SYSTEM.goodsInfo = data.data.rows;
                } else if (data.status === 250) {
                    SYSTEM.goodsInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.goodsInfo = [];
        }
    }
    ;
    //缓存仓库信息
    function getStorage() {
        if (SYSTEM.isAdmin || SYSTEM.rights.INVLOCTION_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/invlocation?action=list&isDelete=2', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.storageInfo = data.data.rows;
                } else if (data.status === 250) {
                    SYSTEM.storageInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.storageInfo = [];
        }
    }
    ;
    //缓存客户信息
    function getCustomer() {
        if (SYSTEM.isAdmin || SYSTEM.rights.BU_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/contact?action=list&simple=1&isDelete=2', {rows: 5000}, function (data) {
                if (data.status === 200) {
                    SYSTEM.customerInfo = data.data.rows;
                } else if (data.status === 250) {
                    SYSTEM.customerInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.customerInfo = [];
        }
    }
    ;
    //缓存供应商信息
    function getSupplier() {
        if (SYSTEM.isAdmin || SYSTEM.rights.PUR_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/contact?action=list&simple=1&type=10&isDelete=2', {rows: 5000}, function (data) {
                if (data.status === 200) {
                    SYSTEM.supplierInfo = data.data.rows;
                } else if (data.status === 250) {
                    SYSTEM.supplierInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.supplierInfo = [];
        }
    }
    ;
    //缓存地址信息
    function getAddr() {
        if (SYSTEM.isAdmin || SYSTEM.rights.DELIVERYADDR_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/deliveryAddr?action=list&isDelete=2', {rows: 5000}, function (data) {
                if (data.status === 200) {
                    SYSTEM.addrInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.addrInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.addrInfo = [];
        }
    }
    ;
    //缓存职员
    function getStaff() {
        if (true) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/employee?action=list&isDelete=2', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.salesInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.salesInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.salesInfo = [];
        }
    }
    ;
    //缓存账户信息
    function getAccounts() {
        if (SYSTEM.isAdmin || SYSTEM.rights.SettAcct_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/settAcct?action=list&isDelete=2', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.accountInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.accountInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.accountInfo = [];
        }
    }
    ;
    //缓存结算方式
    function getPayments() {
        if (true) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/assist?action=list&typeNumber=PayMethod&isDelete=2', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.paymentInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.paymentInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.paymentInfo = [];
        }
    }
    ;
    //缓存计量单位
    function getUnit() {
        if (SYSTEM.isAdmin || SYSTEM.rights.UNIT_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/unit?action=list&isDelete=2', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.unitInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.unitInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.unitInfo = [];
        }
    }
    //缓存计量单位组
    function getUnitGroup() {
        if (SYSTEM.isAdmin || SYSTEM.rights.UNIT_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/unitType?action=list', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.unitGroupInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.unitGroupInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.unitGroupInfo = [];
        }
    }
    //缓存计量单位
    function getAssistingProp() {
        if (SYSTEM.isAdmin || SYSTEM.rights.UNIT_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/unitType?action=list', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.unitGroupInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.unitGroupInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.unitGroupInfo = [];
        }
    }
    //缓存辅助属性分类
    function getAssistingPropType() {
        if (SYSTEM.isAdmin || SYSTEM.rights.FZSX_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/assistType?action=list', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.assistPropTypeInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.assistPropTypeInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.assistPropTypeInfo = [];
        }
    }
    //缓存辅助属性
    function getAssistingProp() {
        if (SYSTEM.isAdmin || SYSTEM.rights.FZSX_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/assist?action=list&isDelete=2', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.assistPropInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.assistPropInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.assistPropInfo = [];
        }
    }
    //缓存辅助属性组合
    function getAssistingPropGroup() {
        if (SYSTEM.isAdmin || SYSTEM.rights.FZSX_QUERY) {
            Public.ajaxGet('<?php echo site_url()?>/basedata/assistSku?action=list', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.assistPropGroupInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.assistPropGroupInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.assistPropGroupInfo = [];
        }
    }
    //缓存辅助属性组合
    function getBatch() {
        return;
        if (SYSTEM.isAdmin || SYSTEM.ISWARRANTY) {
            Public.ajaxGet('/warranty.do?action=getBatchNoList', {}, function (data) {
                if (data.status === 200) {
                    SYSTEM.batchInfo = data.data.items;
                } else if (data.status === 250) {
                    SYSTEM.batchInfo = [];
                } else {
                    Public.tips({type: 1, content: data.msg});
                }
            });
        } else {
            SYSTEM.batchInfo = [];
        }
    }
    //左上侧版本标识控制
    function markupVension() {
        return null;
    }

</script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?0613c265aa34b0ca0511eba4b45d2f5e";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();

    function yc() {
        $("#col-side").toggle();
        $("#y1").toggle();
        $("#y2").toggle();
    }
</script>
</head>
<body>
<div id="container" class="cf">
    <div id="col-side">
        <ul id="nav" class="cf">
            <li class="item item-purchase"><a href="javascript:void(0);" class="purchase main-nav">购货<span
                            class="arrow">&gt;</span></a>
                <div class="sub-nav-wrap single-nav">
                    <ul class="sub-nav" id="purchase">
                    </ul>
                </div>
            </li>
            <li class="item item-sales"><a href="javascript:void(0);" class="sales main-nav">销货<span
                            class="arrow">&gt;</span></a>
                <div class="sub-nav-wrap single-nav">
                    <ul class="sub-nav" id="sales">
                    </ul>
                </div>
            </li>
            <li class="item item-storage"><a href="javascript:void(0);" class="storage main-nav">仓库<span class="arrow">&gt;</span></a>
                <div class="sub-nav-wrap single-nav">
                    <ul class="sub-nav" id="storage">
                    </ul>
                </div>
            </li>
            <li class="item item-money"><a href="javascript:void(0);" class="money main-nav">资金<span
                            class="arrow">&gt;</span></a>
                <div class="sub-nav-wrap single-nav">
                    <ul class="sub-nav" id="money">
                    </ul>
                </div>
            </li>
            <li class="item item-report"><a href="javascript:void(0);" class="report main-nav">报表<span class="arrow">&gt;</span></a>
                <div class="sub-nav-wrap group-nav group-nav-b0 report-nav cf">
                    <div class="nav-item nav-pur">
                        <h3>采购报表</h3>
                        <ul class="sub-nav" id="report-purchase">
                        </ul>
                    </div>
                    <div class="nav-item nav-sales">
                        <h3>销售报表</h3>
                        <ul class="sub-nav" id="report-sales">
                        </ul>
                    </div>
                    <div class="nav-item nav-fund">
                        <h3>仓存报表</h3>
                        <ul class="sub-nav" id="report-storage">
                        </ul>
                    </div>

                    <div class="nav-item nav-fund last">
                        <h3>资金报表</h3>
                        <ul class="sub-nav" id="report-money">
                        </ul>
                    </div>

                </div>
            </li>
            <li class="item item-setting"><a href="javascript:void(0);" class="setting main-nav">设置<span class="arrow">&gt;</span></a>
                <div class="sub-nav-wrap cf group-nav group-nav-b0 setting-nav">
                    <div class="nav-item">
                        <h3>基础资料</h3>
                        <ul class="sub-nav" id="setting-base">
                        </ul>
                    </div>
                    <div class="nav-item">
                        <h3>辅助资料</h3>
                        <ul class="sub-nav" id="setting-auxiliary">
                        </ul>
                    </div>
                    <div class="nav-item cf last">
                        <h3>高级设置</h3>
                        <ul class="sub-nav" id="setting-advancedSetting">
                        </ul>
                    </div>
                </div>
            </li>
        </ul>

    </div>
    <div id="col-main">
        <div id="main-hd" class="cf">
            <div class="tit"><a class="company" id="companyName" href="javascript:;" title=""></a> <span class="period"
                                                                                                         id="period"></span>
            </div>
            <ul class="user-menu">
                <li id="y1"><a href="javascript:yc()" class="buy-now">隐藏菜单</a></li>
                <li style="display: none" id="y2"><a href="javascript:yc()" class="buy-now">显示菜单</a></li>
                <li class="space">|</li>
                <li id="sysSkin">换肤</li>
                <li class="space">|</li>
                <li><a href="<?php echo site_url('login/out') ?>">退出</a></li>
            </ul>
        </div>
        <div id="main-bd">
            <div class="page-tab" id="page-tab">
            </div>
        </div>
    </div>
</div>
<div id="selectSkin" class="shadow dn">
    <ul class="cf">
        <li><a id="skin-default"><span></span>
                <small>经典</small>
            </a></li>
        <li><a id="skin-blue"><span></span>
                <small>丰收</small>
            </a></li>
        <li><a id="skin-green"><span></span>
                <small>小清新</small>
            </a></li>
    </ul>
</div>
<script src="<?php echo base_url() ?>statics/js/dist/default.js?ver=20150522"></script>

</body>
</html>