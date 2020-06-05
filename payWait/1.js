// 重置页面大小定时器
var tResizeBodySize = null;
// 当前选择项
var curMenuNum = 1000;
// 订单记录列表
var tradeRecordVoList = null;
var tradeSdOrderVoList = null;
var sdOrderInterval = null;
/*-----------------------*/
// 当前使用购买项列表
var userPurchaseItemVoList = null;
// 用户资源列表
var userModuleUsageVoList = null;
/*-----------------------*/
// 用户可用存储大小
var md4EmStorageSize = null;
// 存储已用大小
var md4EmStorageUsedSize = null;
// 项目列表显示行数
var md4EmPageSize = 10;

// 初始化方法
$(function() {
    setUbmMenuSelected("ubm_menu_myDetail4EM");
    selectOptionMenu(curMenuNum);
    resizeBodySize();
    $("body").show();

    $(".invoiceCon").hover(
        function() {
            $(".invoiceJump").show();
        },
        function() {
            $(".invoiceJump").hide();
        });
    $(".invoiceCtrlSee").click(function() {
        $(".invoiceCtrlJump").show();
    });
    $(".invoiceCtrlJumpBtn").click(function() {
        $(".invoiceCtrlJump").hide();
    });
    $(".invoiceCtrlJumpClose").click(function() {
        $(".invoiceCtrlJump").hide();
    });
});

// 自适应窗口变化
window.onresize = function() {
        if (tResizeBodySize != null) {
            clearTimeout(tResizeBodySize);
        }
        tResizeBodySize = setTimeout("resizeBodySize()", 500);
    }
    //重置整个窗口的尺寸
function resizeBodySize() {
    var windowSize = calcBodyWidthHeight(725, 1440);
    // 主区域高度
    var mainBodyHeight = windowSize.windowHeight - $(".lib_head_container").height() - $(".ubm_menu_container").height() - $(".status_body").height() - 57;
    var rightBodyWidth = windowSize.windowWidth - $(".md4EM_option_left").width() - 130;
    // 消息列表高度自适应
    $(".md4EM_option_left").css("min-height", (mainBodyHeight) + "px");
    $(".md4EM_option_right").css("width", (rightBodyWidth) + "px");
    $(".md4EM_option_right").css("min-height", (mainBodyHeight) + "px");
    tResizeBodySize = null;
}

// 选择菜单选项
function selectOptionMenu(menuNum) {
    $(".md4EM_option_menu li").removeClass("selected");
    $("#md4EM_option_item_" + menuNum).addClass("selected");

    // 初始化对应选项页面内容
    initMd4EMOptionContent(menuNum);
    $(".md4EM_option_content_Item").hide();
    $("#md4EM_option_content_" + menuNum).show();
    if (curMenuNum != menuNum) {
        curMenuNum = menuNum;
    }
}

// 初始化菜单项页面内容
function initMd4EMOptionContent(menuNum) {
    switch (Number(menuNum)) {
        case 1000:
            initMyTradeRecordInfo(menuNum);
            break;
        case 2000:
            initMyUsageInfo(menuNum);
            break;
        case 3000:
            initMyStorageInfo(menuNum);
            break;
        case 4000:
            initMyTradeSdOrderInfo(menuNum);
            break;
        default:
            break;
    }
}

//获取我的订单和资源数据
//menuNum 菜单编号
//param 查询参数
function getMyAllUsageInfo(menuNum, param) {
    $.ajax({
        async: false,
        cache: false,
        type: 'POST',
        dataType: "Json",
        url: ctx + "/myInfo/initMyAllUsageInfo.html",
        data: {
            menuNum: menuNum,
            param: JSON.stringify(param)
        },
        error: function(XHR, TS) { // 请求失败处理函数
            ajaxErrorProcess();
        },
        success: function(data) { // 请求成功后处理函数。
            if (data.message == "success") {
                switch (menuNum) {
                    case 1000:
                        tradeRecordVoList = data.tradeRecordVoList;
                        break;
                    case 2000:
                        userPurchaseItemVoList = data.userPurchaseItemVoList;
                        userModuleUsageVoList = data.emUserModuleUsageVoList;
                        break;
                    case 3000:
                        md4EmStorageSize = Number(data.diskSize);
                        md4EmStorageUsedSize = Number(data.usedDiskSize);
                        break;
                    case 4000:
                        tradeSdOrderVoList = data.tradeSdRecordVoList;
                        break;
                    default:
                        break;
                }
            } else {
                showPromptMsg(data.message);
            }
        }
    });
}

/*---------------------订单（仿真）-----------------------*/

// 初始化订单页面内容
function initMyTradeRecordInfo(menuNum) {
    var param = {};
    //param.status = "1";
    //param.tradeNo = "20191223138530dsfby";
    // 调用方法获取数据
    getMyAllUsageInfo(menuNum, param);
    // 显示数据
    buildRecordTableDataContent(tradeRecordVoList);
}

// 生成页面订单信息
function buildRecordTableDataContent() {
    // 清空页面元素
    $("#md4EM_recordTableDiv").empty();
    // 定义变量
    var contentBuffer = new StringBuffer();
    var size = tradeRecordVoList.length;
    var tradeRecordVo = null;
    var tradeRecordStatus = 0;
    var emTradeRecordItemVoList = null;
    var itemSize = 0;
    var emTradeRecordItemVo = null;
    for (var i = 0; i < size; i++) {
        // 订单对象
        tradeRecordVo = tradeRecordVoList[i];
        // 订单状态
        tradeRecordStatus = tradeRecordVo.status;

        contentBuffer.append("<div class=\"md4EM_recordTableDataDiv\">");
        contentBuffer.append("<table class=\"md4EM_recordTableData\">");
        contentBuffer.append("<colgroup>");
        contentBuffer.append("<col class=\"md4EM_tradeRecordTable_col1\">");
        contentBuffer.append("<col class=\"md4EM_tradeRecordTable_col2\">");
        contentBuffer.append("<col class=\"md4EM_tradeRecordTable_col3\">");
        contentBuffer.append("<col class=\"md4EM_tradeRecordTable_col4\">");
        contentBuffer.append("<col class=\"md4EM_tradeRecordTable_col5\">");
        contentBuffer.append("<col class=\"md4EM_tradeRecordTable_col6\">");
        contentBuffer.append("<col class=\"md4EM_tradeRecordTable_col7\">");
        contentBuffer.append("<col class=\"md4EM_tradeRecordTable_col8\">");
        contentBuffer.append("</colgroup>");
        // 标题
        contentBuffer.append("<tbody>");
        contentBuffer.append("<tr>");
        contentBuffer.append("<td colspan='8' class=\"md4EM_recordInfoTd\">");
        contentBuffer.append("<span class=\"md4EM_recordDate\">");
        contentBuffer.append(tradeRecordVo.tradeTime);
        contentBuffer.append("</span>");
        contentBuffer.append("<span class=\"md4EM_recordNum\">");
        contentBuffer.append("<span>" + $("#LBL_0000001963").val() + "</span>");
        contentBuffer.append("<span>:</span>");
        contentBuffer.append("<span>");
        contentBuffer.append(tradeRecordVo.tradeNo);
        contentBuffer.append("</span>");
        contentBuffer.append("</span>");
        contentBuffer.append("</td>");
        contentBuffer.append("</tr>");
        contentBuffer.append("</tbody>");
        // 内容
        contentBuffer.append("<tbody>");

        emTradeRecordItemVoList = tradeRecordVo.emTradeRecordItemVoList;
        itemLen = emTradeRecordItemVoList.length;
        var currency = 1;
        for (var j = 0; j < itemLen; j++) {
            emTradeRecordItemVo = emTradeRecordItemVoList[j];
            // 币种
            currency = emTradeRecordItemVo.currency;
            // 内容
            contentBuffer.append("<tr class='md4EM_tradeRecordTable_tr'>");
            // 名称
            contentBuffer.append("<td class=\"firstTd\">");
            contentBuffer.append("<div>");
            contentBuffer.append("<p>");
            if (itemLen == 1) {
                // 只有一个购买项，显示订单名称
                contentBuffer.append(tradeRecordVo.tradeName);
            } else {
                // 多个购买项，显示购买项名称
                contentBuffer.append(emTradeRecordItemVo.itemName);
            }
            contentBuffer.append("</p>");
            contentBuffer.append("</div>");
            contentBuffer.append("</td>");

            // 选项
            switch (Number(emTradeRecordItemVo.itemId)) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 9:
                    addMachineTypeDetail(contentBuffer, emTradeRecordItemVo);
                    break;
                case 6:
                    addStorageDetail(contentBuffer, emTradeRecordItemVo);
                    break;
                case 7:
                    addConcurrentCalDetail(contentBuffer, emTradeRecordItemVo);
                    break;
                case 8:
                    addTraningDetail(contentBuffer, emTradeRecordItemVo);
                    break;
                default:
                    contentBuffer.append("<td>");
                    contentBuffer.append("<div>");
                    contentBuffer.append("<p class=\"md4EM_recordMotorType\">");
                    contentBuffer.append(emTradeRecordItemVo.optionContent);
                    contentBuffer.append("</p>");
                    contentBuffer.append("</div>");
                    contentBuffer.append("</td>");
                    break;
            }
            // 金额
            contentBuffer.append("<td>");
            contentBuffer.append("<div>");
            /*contentBuffer.append("<p class=\"md4EM_recordOriPrice\">");
            contentBuffer.append(emTradeRecordItemVo.price);
            contentBuffer.append("</p>");*/
            contentBuffer.append("<p class=\"md4EM_recordPrice\">");
            if (currency == 1) {
                contentBuffer.append("￥");
            } else if (currency == 2) {
                contentBuffer.append("$");
            }
            contentBuffer.append(emTradeRecordItemVo.price);
            contentBuffer.append("</p>");
            contentBuffer.append("</div>");
            contentBuffer.append("</td>");
            // 实付金额
            contentBuffer.append("<td>");
            if (j == 0) { // 只显示在第一格
                contentBuffer.append("<div>");
                contentBuffer.append("<p class=\"md4EM_recordPrice\">");
                if (currency == 1) {
                    contentBuffer.append("￥");
                } else if (currency == 2) {
                    contentBuffer.append("$");
                }
                contentBuffer.append(tradeRecordVo.totalPrice);
                contentBuffer.append("</p>");
                contentBuffer.append("</div>");
            }
            contentBuffer.append("</td>");
            // 状态
            contentBuffer.append("<td>");
            contentBuffer.append("<div>");
            contentBuffer.append("<p>");
            contentBuffer.append(getTradeItemStatusName(emTradeRecordItemVo.isOnUsed));
            contentBuffer.append("</p>");
            contentBuffer.append("</div>");
            contentBuffer.append("</td>");
            // 开始时间
            contentBuffer.append("<td>");
            contentBuffer.append("<div>");
            contentBuffer.append("<p>");
            contentBuffer.append(emTradeRecordItemVo.startTimeStr);
            contentBuffer.append("</p>");
            contentBuffer.append("</div>");
            contentBuffer.append("</td>");
            // 截止时间
            contentBuffer.append("<td>");
            contentBuffer.append("<div>");
            contentBuffer.append("<p");
            if (emTradeRecordItemVo.isOnUsed == 1) {
                contentBuffer.append(" class=\"md4EM_recordDueTime\"");
            }
            contentBuffer.append(" >");

            contentBuffer.append(emTradeRecordItemVo.dueTimeStr);
            contentBuffer.append("</p>");
            contentBuffer.append("</div>");
            contentBuffer.append("</td>");
            // 交易状态
            contentBuffer.append("<td class=\"lastTd\">");
            if (j == 0) { // 只显示在第一格
                contentBuffer.append("<div>");
                contentBuffer.append("<p>");
                contentBuffer.append(getTradeRecordStatusName(tradeRecordStatus));
                contentBuffer.append("</p>");
                contentBuffer.append("</div>");
                contentBuffer.append("</td>");
            }
            contentBuffer.append("</tr>");
        }
        contentBuffer.append("</tbody>");
        contentBuffer.append("</table>");
        contentBuffer.append("</div>");
    }
    $("#md4EM_recordTableDiv").append(contentBuffer.toString());
}

// 增加选项列的电机类型信息
function addMachineTypeDetail(contentBuffer, emTradeRecordItemVo) {
    contentBuffer.append("<td>");
    contentBuffer.append("<div>");
    contentBuffer.append("<p>" + $("#LBL_0000000411").val() + ":</p>");

    var valueMotorTypeStr = emTradeRecordItemVo.optionContent;
    var valueMtStrArr = valueMotorTypeStr.split(",");
    var mtStrArrLen = valueMtStrArr.length;
    for (var k = 0; k < mtStrArrLen; k++) {
        contentBuffer.append("<p class=\"md4EM_recordMotorType\">");
        contentBuffer.append(valueMtStrArr[k]);
        contentBuffer.append("</p>");
    }
    contentBuffer.append("</div>");
    contentBuffer.append("</td>");
}

// 增加选项列的存储空间信息
function addStorageDetail(contentBuffer, emTradeRecordItemVo) {
    contentBuffer.append("<td>");
    contentBuffer.append("<div>");
    contentBuffer.append("<p>" + $("#LBL_0000001799").val() + ":</p>");
    contentBuffer.append("<p class=\"md4EM_recordMotorType\">");
    contentBuffer.append(emTradeRecordItemVo.value + "   GB");
    contentBuffer.append("</p>");
    contentBuffer.append("</div>");
    contentBuffer.append("</td>");
}

// 增加选项列的并发任务计算数信息
function addConcurrentCalDetail(contentBuffer, emTradeRecordItemVo) {
    contentBuffer.append("<td>");
    contentBuffer.append("<div>");
    contentBuffer.append("<p>" + $("#LBL_0000001866").val() + ":</p>");
    contentBuffer.append("<p class=\"md4EM_recordMotorType\">");
    contentBuffer.append(emTradeRecordItemVo.value + "&nbsp;&nbsp;" + $("#LBL_2000000152").val());
    contentBuffer.append("</p>");
    contentBuffer.append("</div>");
    contentBuffer.append("</td>");
}

// 增加选项列的现场在线培训信息
function addTraningDetail(contentBuffer, emTradeRecordItemVo) {
    contentBuffer.append("<td>");
    contentBuffer.append("<div>");
    contentBuffer.append("<p>" + $("#LBL_0000001870").val() + ":</p>");
    contentBuffer.append("<p class=\"md4EM_recordMotorType\">");
    contentBuffer.append(emTradeRecordItemVo.value + "&nbsp;&nbsp;" + $("#LBL_0000000705").val());
    contentBuffer.append("</p>");
    contentBuffer.append("</div>");
    contentBuffer.append("</td>");
}

// 获取购买项状态名称
function getTradeItemStatusName(status) {
    var name = "";
    switch (Number(status)) {
        case 0:
            name = $("#LBL_0000001964").val();
            break;
        case 1:
            name = $("#LBL_0000001965").val();
            break;
        case 2:
            name = $("#LBL_0000001792").val();
            break;
        case 3:
            name = $("#LBL_0000001966").val();
            break;
        default:
            break;
    }
    return name;
}

// 获取订单状态名称
function getTradeRecordStatusName(status) {
    var name = "";
    switch (Number(status)) {
        case 1:
            name = $("#LBL_0000001967").val();
            break;
        case 2:
            name = $("#LBL_0000001968").val();
            break;
        case 3:
            name = $("#LBL_0000001969").val();
            break;
        case 4:
            name = $("#LBL_0000001970").val();
            break;
        case 5:
            name = $("#LBL_0000000406").val();
            break;
        default:
            break;
    }
    return name;
}

/*---------------------订单（仿真） end-----------------------*/

/*---------------------订单（供需广场）-----------------------*/

//初始化订单页面内容
function initMyTradeSdOrderInfo(menuNum) {
    var param = {};
    // 调用方法获取数据
    getMyAllUsageInfo(menuNum, param);
    // 显示数据
    buildSdOrderDataContent();
}

//生成页面订单信息
function buildSdOrderDataContent() {
    // 清空页面元素
    $("#md4EM_sdOrderUl").empty();
    // 定义变量
    var contentBuffer = new StringBuffer();
    var size = tradeSdOrderVoList.length;
    var tradeSdOrderVo = null;
    for (var i = 0; i < size; i++) {
        // 订单对象
        tradeSdOrderVo = tradeSdOrderVoList[i];
        contentBuffer.append(setSdOrderContent(tradeSdOrderVo));
    }
    $("#md4EM_sdOrderUl").append(contentBuffer.toString());
    // 订单倒计时设置
    if ($("span.orderCountDown") && $("span.orderCountDown").length > 0) {
        setOrderCountDown();
    }
    // 继续支付设置
    $("button.orderPay").click(function() {
        orderContinue2Pay(Number($(this).attr("oid")));
    });
}

// 设置供需订单内容
function setSdOrderContent(tradeSdOrderVo) {
    var contentBuffer = new StringBuffer();
    var tradeSdOrderId = tradeSdOrderVo.id;
    var orderStatus = tradeSdOrderVo.status;
    var isOverTime = tradeSdOrderVo.isOverTime;
    // 币种
    var currencyStr = "";
    if (tradeSdOrderVo.currency == 1) {
        currencyStr = "￥";
    } else {
        currencyStr = "$";
    }
    // 继续支付
    var isContinuePay = false;
    if (orderStatus == 2 && isOverTime == 0) {
        isContinuePay = true;
    }
    if (isContinuePay) {
        // 待支付未超时
        contentBuffer.append("<li id=\"waitOrder_");
        contentBuffer.append(tradeSdOrderId);
        contentBuffer.append("\" class=\"waitOrder\">");
        contentBuffer.append("<div class=\"myOrderTop\">");
        contentBuffer.append("<div>");
        contentBuffer.append("<span class=\"myOrderTopDate\">");
        contentBuffer.append(tradeSdOrderVo.dealTime);
        contentBuffer.append("</span>");
        contentBuffer.append("<span>");
        contentBuffer.append("订单编号:");
        contentBuffer.append("</span>");
        contentBuffer.append("<span class=\"myOrderTopNumber\">");
        contentBuffer.append(tradeSdOrderVo.orderNo);
        contentBuffer.append("</span>");
        contentBuffer.append("</div>");
        // 支付时间倒计时
        contentBuffer.append("<div class=\"redHeadRight\">");
        contentBuffer.append("<span>");
        contentBuffer.append("剩余:");
        contentBuffer.append("</span>");
        contentBuffer.append("<span class=\"orderCountDown\" id=\"countDown_");
        contentBuffer.append(tradeSdOrderId);
        contentBuffer.append("\">");
        contentBuffer.append("</span>");
        contentBuffer.append("</div>");
        contentBuffer.append("</div>");
    } else {
        if (orderStatus == 1) {
            // 交易成功
            contentBuffer.append("<li>");
        } else {
            // 交易取消或者超时
            contentBuffer.append("<li class=\"closeOrder\">");
        }
        contentBuffer.append("<div class=\"myOrderTop\">");
        contentBuffer.append("<div>");
        contentBuffer.append("<span class=\"myOrderTopDate\">");
        var dealMillisec = Date.parse(tradeSdOrderVo.dealTime);
        var disDate = new Date();
        disDate.setTime(dealMillisec);
        contentBuffer.append(disDate.Format("yyyy-MM-dd"));
        contentBuffer.append("</span>");
        contentBuffer.append("<span>");
        contentBuffer.append("订单编号:");
        contentBuffer.append("</span>");
        contentBuffer.append("<span class=\"myOrderTopNumber\">");
        contentBuffer.append(tradeSdOrderVo.orderNo);
        contentBuffer.append("</span>");
        contentBuffer.append("</div>");
        contentBuffer.append("</div>");
    }
    contentBuffer.append("<div class=\"myOrderCon\">");
    contentBuffer.append("<ul class=\"myOrderLeft\">");
    // 销售品
    var tradeSaleDetailVoList = tradeSdOrderVo.tradeSaleDetailVoList;
    var saleDetailSize = tradeSaleDetailVoList.length;
    var tradeSaleDetailVo = null;
    var salePropValues = null;
    for (var j = 0; j < saleDetailSize; j++) {
        tradeSaleDetailVo = tradeSaleDetailVoList[j];
        contentBuffer.append("<li>");
        // 名称
        contentBuffer.append("<div class=\"myOrderHead1\">");
        contentBuffer.append("<span>");
        contentBuffer.append(tradeSaleDetailVo.saleName);
        contentBuffer.append("</span>");
        contentBuffer.append("</div>");
        // 规格
        contentBuffer.append("<div class=\"myOrderHead2\">");
        contentBuffer.append("<div>");
        salePropValues = tradeSaleDetailVo.salePropValues;
        for (var propName in salePropValues) {
            contentBuffer.append("<p>");
            contentBuffer.append(propName);
            contentBuffer.append(":");
            contentBuffer.append("</p>");
            contentBuffer.append("<p class=\"myOrderLeftValue\">");
            contentBuffer.append(salePropValues[propName]);
            contentBuffer.append("</p>");
        }
        contentBuffer.append("</div>");
        contentBuffer.append("</div>");
        // 价格
        contentBuffer.append("<div class=\"myOrderHead3\">");
        contentBuffer.append("<span>");
        contentBuffer.append(currencyStr);
        contentBuffer.append(tradeSdOrderVo.price);
        contentBuffer.append("</span>");
        contentBuffer.append("</div>");
        // 状态
        /*<div class="myOrderLeftx">
        	<span>未支付</span>
        </div>*/
        // 服务时间
        /*<div class="myOrderLeftx">
        	<span>2019-01-10</span>
        	<span>至</span>
        	<span>2022-03-01</span>
        </div>*/
        // 订单价格
        contentBuffer.append("<div class=\"myOrderHead4\">");
        contentBuffer.append("<span>");
        contentBuffer.append(currencyStr);
        contentBuffer.append(tradeSaleDetailVo.price);
        contentBuffer.append("</span>");
        contentBuffer.append("</div>");
        // 订单状态
        contentBuffer.append("<div class=\"myOrderHead5\">");
        contentBuffer.append("<p>");
        contentBuffer.append(getTradeOrderStatusName(orderStatus));
        contentBuffer.append("</p>");
        if (isContinuePay) {
            /*
            contentBuffer.append("<p>");
            contentBuffer.append("<button type=\"button\" class=\"cancelPay\">");
            contentBuffer.append("取消订单");
            contentBuffer.append("</button>");
            contentBuffer.append("</p>");
            */
            contentBuffer.append("<p>");
            contentBuffer.append("<button type=\"button\" class=\"orderPay\" oid=\"");
            contentBuffer.append(tradeSdOrderId);
            contentBuffer.append("\">");
            contentBuffer.append("立即支付");
            contentBuffer.append("</button>");
            contentBuffer.append("</p>");
        }
        contentBuffer.append("</div>");
        // 发票服务
        /*<div class="myOrderLeftx">
        	<div class="invoiceCtrl">
        		<div>已开票</div>
        		<div class="invoiceCtrlBlue">申请换开</div>
        		<div class="invoiceCtrlSee">
        			<span>查看发票</span>
        		</div>
        	</div>
        </div>*/
        contentBuffer.append("</li>");
    }
    contentBuffer.append("</ul>");

    contentBuffer.append("</div>");
    contentBuffer.append("</li>");
    return contentBuffer.toString();
}

// 获取供需广场订单状态名称
function getTradeOrderStatusName(status) {
    var name = "";
    switch (Number(status)) {
        case 1:
            name = $("#LBL_0000001967").val();
            break;
        case 2:
            name = $("#LBL_0000001964").val();
            break;
        case 3:
            //name = $("#LBL_0000001969").val();
            break;
        case 4:
            name = $("#LBL_0000001970").val();
            break;
        case 5:
            //name = $("#LBL_0000000406").val();
            break;
        default:
            break;
    }
    return name;
}

// 获取列表订单对象
function getSdOrderListIndex(orderId) {
    var orderVoList = tradeSdOrderVoList.slice();
    var arrLen = orderVoList.length;
    var index = -1;
    for (var i = 0; i < arrLen; i++) {
        if (orderVoList[i].id == orderId) {
            index = i;
            break;
        }
    }
    return index;
}

// 订单倒计时设置
function setOrderCountDown() {
    // 设置定时器
    if (sdOrderInterval != null) {
        clearInterval(sdOrderInterval);
        sdOrderInterval == null;
    }
    orderCountDownFunc();
    sdOrderInterval = setInterval(orderCountDownFunc, 1000);
}

// 倒计时设置函数
function orderCountDownFunc() {
    if ($("span.orderCountDown") && $("span.orderCountDown").length > 0) {
        var len = $("span.orderCountDown").length;
        var countDownEle = null;
        for (var i = 0; i < len; i++) {
            countDownEle = $("span.orderCountDown").eq(i);
            var orderId = $(countDownEle).attr("id").replace("countDown_", "");
            var index = getSdOrderListIndex(orderId);
            if (index < 0) {
                continue;
            }
            var orderVo = tradeSdOrderVoList[index];
            if (!(orderVo.status == 2 && orderVo.isOverTime == 0)) {
                continue;
            }
            var dealTime = Date.parse(orderVo.dealTime);
            dealTime = Math.floor(dealTime / 1000);
            var curTime = new Date().getTime();
            curTime = Math.floor(curTime / 1000);
            // 时间差（s）
            var diffTime = Math.abs(curTime - dealTime);
            if (diffTime >= 900) {
                // 交易超时
                resetOverTimeSdOrder(index);
                continue;
            }
            diffTime = 900 - diffTime;
            var minute = Math.floor(diffTime / 60);
            var second = diffTime - minute * 60;
            $("#countDown_" + orderId).html(minute + "分" + second + "秒");
        }
    } else {
        clearInterval(sdOrderInterval);
        sdOrderInterval == null;
    }
}

// 重置超时订单信息
function resetOverTimeSdOrder(index) {
    tradeSdOrderVoList[index].isOverTime = 1;
    tradeSdOrderVoList[index].orderStatus = 4;
    var orderVo = tradeSdOrderVoList[index];
    var resetContent = setSdOrderContent(orderVo);
    $("#waitOrder_" + orderVo.id).replaceWith(resetContent);
}

// 继续支付
function orderContinue2Pay(orderId) {
    var index = getSdOrderListIndex(orderId);
    if (index < 0) {
        return;
    }
    var orderVo = tradeSdOrderVoList[index];
    if (!(orderVo.status == 2 && orderVo.isOverTime == 0)) {
        return;
    }
    var url = ctx + "/purchase/continuePayOrder.html?orderId=" + orderId;
    window.location.href = encodeURI(url);
}

/*---------------------订单（供需） end-----------------------*/

/*---------------------可以使用-----------------------*/

//初始化可以使用页面内容
function initMyUsageInfo(menuNum) {
    if (userPurchaseItemVoList == null || userModuleUsageVoList == null) {
        // 调用方法获取数据
        getMyAllUsageInfo(menuNum, "");
    }
    // 显示数据
    buildUsageDataContent();
}

// 构建可以使用页面内容
function buildUsageDataContent() {
    // 当前使用的服务
    var purItemVoList = userPurchaseItemVoList;
    if (userPkgType == -1) {
        // 观摩版显示
        emTradeRecordItemVo = new Object();
        emTradeRecordItemVo.itemId = -1;
        emTradeRecordItemVo.itemName = "EasiMotor Online " + $("#LBL_0000002074").val();
        purItemVoList.push(emTradeRecordItemVo);
    }
    setUsagePurchaseItemContent(purItemVoList);
    // 服务明细
    if (userPkgType == -1) {
        // 观摩版隐藏明细功能
        $("#md4EM_usageTable_tbody").hide();
    } else {
        var usageLen = userModuleUsageVoList.length;
        var emUserModuleUsageVo = null;
        for (var i = 0; i < usageLen; i++) {
            emUserModuleUsageVo = userModuleUsageVoList[i];
            setUsageTableModuleContent(emUserModuleUsageVo);
        }
    }
}

// 设置当前使用模块服务内容
function setUsagePurchaseItemContent(purchaseItemVoList) {
    // 清空页面数据
    $("#md4EM_purchaseItemListDiv").empty();
    var itemBuffer = new StringBuffer();

    var itemLen = purchaseItemVoList.length;
    var purchaseItemVo = null;
    var purchaseItemDate = null;
    for (var i = 0; i < itemLen; i++) {
        purchaseItemVo = purchaseItemVoList[i];

        itemBuffer.append("<div class=\"md4EM_purchaseItem\">");
        // 名称
        itemBuffer.append("<div class=\"md4EM_purchaseItemTitle\">");
        itemBuffer.append("<span>");
        itemBuffer.append(purchaseItemVo.itemName);
        itemBuffer.append("</span>");
        itemBuffer.append("</div>");
        itemBuffer.append("<div class=\"md4EM_purchaseItemDetail\">");
        // 内容
        switch (Number(purchaseItemVo.itemId)) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 9:
                addCanUseMachineTypeDetail(itemBuffer, purchaseItemVo);
                break;
            case 6:
                addCanUseStorageDetail(itemBuffer, purchaseItemVo);
                break;
            case 7:
                addCanUseConcurrentCalDetail(itemBuffer, purchaseItemVo);
                break;
            case 8:
                addCanUseTrainingDetail(itemBuffer, purchaseItemVo);
                break;
            case 10:
            case 11:
            case 12:
                addCanUseSupplyDemandDetail(itemBuffer, purchaseItemVo)
                break;
            default:
                break;
        }
        itemBuffer.append("</div>");
        // 日期
        purchaseItemDate = "";
        if (Number(purchaseItemVo.itemId) != -1) {
            purchaseItemDate = purchaseItemVo.startTimeStr.replace(/-/g, "/") + "-" + purchaseItemVo.dueTimeStr.replace(/-/g, "/");
        }
        itemBuffer.append("<div class=\"md4EM_purchaseItemDate\">");
        itemBuffer.append("<span>");
        itemBuffer.append(purchaseItemDate);
        itemBuffer.append("</span>");
        itemBuffer.append("</div>");
        itemBuffer.append("</div>");
        itemBuffer.append("</div>");
    }
    $("#md4EM_purchaseItemListDiv").append(itemBuffer.toString());
}

// 可以使用模块增加电机类型信息
function addCanUseMachineTypeDetail(itemBuffer, purchaseItemVo) {
    itemBuffer.append("<div class=\"md4EM_purchaseItemDetailTitle\">");
    // 套餐
    itemBuffer.append("<span>" + $("#LBL_0000000411").val() + "：</span>");
    itemBuffer.append("</div>");
    itemBuffer.append("<div class=\"md4EM_purchaseItemDetailList\">");
    // 套餐电机类型
    // 保存值
    var valueMotorType = purchaseItemVo.valueMotorType;
    // 显示名称
    var mTypeStr = purchaseItemVo.optionContent;
    if (Number(valueMotorType) == -1) {
        // 所有电机类型
        itemBuffer.append("<div class=\"md4EM_purchaseItemInfo\">");
        itemBuffer.append("<span>");
        itemBuffer.append(mTypeStr);
        itemBuffer.append("</span>");
        itemBuffer.append("</div>");
    } else {
        // 至多显示3行信息
        var mTypeArr = mTypeStr.split(",");
        if (mTypeArr.length > 3) {
            for (var j = 0; j < 2; j++) {
                itemBuffer.append("<div class=\"md4EM_purchaseItemInfo\">");
                itemBuffer.append("<span>");
                itemBuffer.append(mTypeArr[j]);
                itemBuffer.append("</span>");
                itemBuffer.append("</div>");
            }
            // 显示省略
            itemBuffer.append("<div class=\"md4EM_purchaseItemInfo\">");
            itemBuffer.append("<span>...</span>");
            itemBuffer.append("</div>");
        } else {
            for (var j = 0; j < mTypeArr.length; j++) {
                itemBuffer.append("<div class=\"md4EM_purchaseItemInfo\">");
                itemBuffer.append("<span>");
                itemBuffer.append(mTypeArr[j]);
                itemBuffer.append("</span>");
                itemBuffer.append("</div>");
            }
        }
    }
}

// 可以使用模块增加存储空间信息
function addCanUseStorageDetail(itemBuffer, purchaseItemVo) {
    itemBuffer.append("<div class=\"md4EM_purchaseItemDetailTitle\">");
    itemBuffer.append("<span>" + $("#LBL_0000001799").val() + "：</span>");
    itemBuffer.append("</div>");
    itemBuffer.append("<div class=\"md4EM_purchaseItemDetailList\">");
    itemBuffer.append("<div class=\"md4EM_purchaseItemInfo\">");
    itemBuffer.append("<span>");
    itemBuffer.append(purchaseItemVo.value + "   GB");
    itemBuffer.append("</span>");
    itemBuffer.append("</div>");

}

// 可以使用模块增加并发任务计算数信息
function addCanUseConcurrentCalDetail(itemBuffer, purchaseItemVo) {
    itemBuffer.append("<div class=\"md4EM_purchaseItemDetailTitle\">");
    itemBuffer.append("<span>" + $("#LBL_0000001866").val() + "：</span>");
    itemBuffer.append("</div>");
    itemBuffer.append("<div class=\"md4EM_purchaseItemDetailList\">");
    itemBuffer.append("<div class=\"md4EM_purchaseItemInfo\">");
    itemBuffer.append("<span>");
    itemBuffer.append(purchaseItemVo.value + "&nbsp;&nbsp;" + $("#LBL_2000000152").val());
    itemBuffer.append("</span>");
    itemBuffer.append("</div>");
}

// 可以使用模块增加现场培训信息
function addCanUseTrainingDetail(itemBuffer, purchaseItemVo) {
    itemBuffer.append("<div class=\"md4EM_purchaseItemDetailTitle\">");
    itemBuffer.append("<span>" + $("#LBL_0000001870").val() + "：</span>");
    itemBuffer.append("</div>");
    itemBuffer.append("<div class=\"md4EM_purchaseItemDetailList\">");
    itemBuffer.append("<div class=\"md4EM_purchaseItemInfo\">");
    itemBuffer.append("<span>");
    itemBuffer.append(purchaseItemVo.value + "&nbsp;&nbsp;" + $("#LBL_0000000705").val());
    itemBuffer.append("</span>");
    itemBuffer.append("</div>");
}

//可以使用模块供需对接套餐信息
function addCanUseSupplyDemandDetail(itemBuffer, purchaseItemVo) {
    itemBuffer.append("<div class=\"md4EM_purchaseItemDetailTitle\">");
    itemBuffer.append("<span></span>");
    itemBuffer.append("</div>");
    itemBuffer.append("<div class=\"md4EM_purchaseItemDetailList\">");
    itemBuffer.append("<div class=\"md4EM_purchaseItemInfo\">");
    itemBuffer.append("<span>");
    itemBuffer.append(purchaseItemVo.optionContent);
    itemBuffer.append("</span>");
    itemBuffer.append("</div>");
}


// 设置不同模块服务明显显示内容
function setUsageTableModuleContent(emUserModuleUsageVo) {
    var moduleId = Number(emUserModuleUsageVo.moduleId);
    switch (moduleId) {
        case 1:
            $("#md4EM_usageTable_item1").html(emUserModuleUsageVo.valueDisplay);
            break;
        case 2:
        case 3:
        case 4:
            $("#md4EM_usageTable_item" + moduleId).html(emUserModuleUsageVo.valueDisplay + $("#LBL_2000000152").val());
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            var valueDisplay = emUserModuleUsageVo.valueDisplay;
            if (Number(emUserModuleUsageVo.value) != -1) {
                valueDisplay += $("#LBL_2000000152").val();
            }
            $("#md4EM_usageTable_item7").html(valueDisplay);
            break;
        case 8:
            $("#md4EM_usageTable_item8").html(emUserModuleUsageVo.valueDisplay + "G");
            break;
        case 9:
            break;
        case 10:
            break;
        case 12:
            if (Number(emUserModuleUsageVo.value) == 1) {
                $(".md4EM_usageTable_img12").show();
            } else {
                $(".md4EM_usageTable_img12").hide();
            }
            break;
        case 13:
            if (Number(emUserModuleUsageVo.value) == 1) {
                $(".md4EM_usageTable_img13").show();
            } else {
                $(".md4EM_usageTable_img13").hide();
            }
            break;
        case 15:
        case 16:
            var valueDisplay = emUserModuleUsageVo.valueDisplay;
            $("#md4EM_usageTable_item" + moduleId).html(valueDisplay);
            break;
        default:
            break;
    }
}

/*---------------------可以使用 end-----------------------*/

/*---------------------存储空间-----------------------*/

// 初始化存储页面内容
function initMyStorageInfo(menuNum) {
    if (md4EmStorageSize == null && md4EmStorageUsedSize == null) {
        getMyAllUsageInfo(menuNum, "");
    }
    var totalSize = md4EmStorageSize;
    var leftSize = Number(totalSize - md4EmStorageUsedSize);
    leftSize = leftSize < 0 ? 0 : leftSize;
    // 设置小数位数
    leftSize = leftSize.toFixed(2);
    totalSize = md4EmStorageSize.toFixed(2);
    // 使用情况
    $("#md4EM_storage_leftSize").html(leftSize + "GB");
    $("#md4EM_storage_totalSize").html(totalSize + "GB");

    var sizeRadio = 0;
    if (totalSize != 0) {
        sizeRadio = leftSize / totalSize * 100;
    }
    $(".md4EM_storage_bar").width(sizeRadio + "%");

    // 项目列表
    showMyProjectList(1);
}

// 显示我的项目列表分页数据
function showMyProjectList(curPageNo) {
    $("#md4EM_projectTableBody").empty();
    $.ajax({
        async: false,
        cache: false,
        type: 'POST',
        dataType: "Json",
        data: {
            projectName: "",
            sidx: "lastModifiedTime",
            sord: "desc",
            curPageNo: curPageNo,
            pageSize: md4EmPageSize,
            isGetSize: 1
        },
        url: ctx + "/projectTree/searchProject.html",
        error: function(XHR, TS) { //请求失败处理函数  
            ajaxErrorProcess();
        },
        success: function(data) {
            if (data != null) {
                if (data.message == 'success') {
                    setUserProjectPageContent(data, curPageNo);
                } else {
                    showPromptMsg(data.message);
                }
            }
        }
    });
}

// 设置项目列表分页数据
function setUserProjectPageContent(data, curPageNo) {
    var strBuffer = new StringBuffer();
    var projectSize = null;
    $.each(data.projectList, function(i, project) {
        strBuffer.append("<tr class=\"md4EM_projectTable_tr\">");
        // 名称
        strBuffer.append("<td class=\"md4EM_projectTable_td firstTd\">");
        strBuffer.append(project.projectName);
        strBuffer.append("</td>");
        // 电机类型
        strBuffer.append("<td class=\"md4EM_projectTable_td\">");
        strBuffer.append(project.machineTypeStr);
        strBuffer.append("</td>");
        // 最后编辑时间
        strBuffer.append("<td class=\"md4EM_projectTable_td\">");
        strBuffer.append(project.lastModifiedTime);
        strBuffer.append("</td>");
        // 大小
        strBuffer.append("<td class=\"md4EM_projectTable_td lastTd\">");
        projectSize = Number(project.diskSize).toFixed(2);
        strBuffer.append(projectSize <= 0 ? "<0.01" : projectSize);
        strBuffer.append("MB");
        strBuffer.append("</td>");
        // 选项
        /*
        strBuffer.append("<td class=\"md4EM_projectTable_td lastTd\">");
        strBuffer.append("<a class=\"md4EM_projectTable_link\" href=\"javascript:void(0);\" onclick=\"javascript:md4EMDelProject(");
        strBuffer.append(project.id);
        strBuffer.append(");\">");
        strBuffer.append($("#LBL_9000000018").val());
        strBuffer.append("</a>");
        strBuffer.append("</td>");
        */
        strBuffer.append("</tr>");
    });
    $("#md4EM_projectTableBody").append(strBuffer.toString());
    initProjectSearchPagination(data.totalPage, curPageNo);
}

// 设置翻页
function initProjectSearchPagination(totalPage, curPageNo) {
    $('#md4EM_projectPagination').empty();
    if (totalPage > 0) {
        var searchPagination = new pagination();
        searchPagination.initPagination(curPageNo, totalPage, "showMyProjectList", md4EmPageSize, globalLang);
        // 添加翻页栏
        $("#md4EM_projectPagination").append(searchPagination.implementPagination().toString());
    }
}

// 删除项目
function md4EMDelProject(projectId) {
    // TODO /projectTree/delProject.html
    // 不能清除sessionServer中已打开的项目

    // 重新刷新列表数据
    //showMyProjectList(1);
}

/*---------------------存储空间 end-----------------------*/