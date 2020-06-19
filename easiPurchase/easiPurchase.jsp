<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="myStr" prefix="myStr" %>
        <%@ taglib uri="myHidden" prefix="myHidden" %>
            <%@ taglib uri="mySelect" prefix="mySelect" %>
                <%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
                    <%
    String baseEmPurchasePath = com.ytd.comm.util.WebPathUtil.getBasePath(request);
%>

                        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
                        <html>
                        <base href="<%=baseEmPurchasePath%>">

                        <head>
                            <!--页面说明：  购买页  -->
                            <%@ include file="/static/common/emOnline/globalSimple.jsp"%>
                                <%@ include file="/static/common/emOnline/meta.jsp"%>
                                    <title>EasiMotor Online</title>
                                    <link rel="stylesheet" type="text/css" href="static/css/common/purchase/easiPurchase200608.css?version=<%=com.ytd.comm.util.CommonConstant.SOURCE_VERSION %>" />
                        </head>

                        <body>
                            <myHidden:hidden strId="MSG_0000000522" />
                            <%@ include file="/WEB-INF/views/common/index/indexHeader191104.jsp"%>

                                <div class="easiPurchaseCon">
                                    <div class="easiPurchaseTip">
                                        <span>原购买套餐用户服务项目不受此次套餐版本调整影响！</span>
                                    </div>
                                    <div class="easiPurchaseBanner">
                                        <img src="static/images/common/index/purchaseBg.png">
                                    </div>
                                    <div class="easiPurchaseTitle">
                                        <span>EasiMotor Online仿真功能套餐</span>
                                    </div>
                                    <div class="easiPurchasePackage">
                                        <ul>
                                            <li>
                                                <div class="easiPurchasePackageName">体验版</div>
                                                <div class="easiPurchasePackageTip">适用于新注册及购买后到期用户</div>
                                                <div class="easiPurchasePackagePrice">
                                                    <div class="easiPurchasePackageArticle">
                                                        <div class="easiPurchasePackageArticleTitle">免费</div>
                                                        <div class="easiPurchasePackageArticleText"><span>（所有输入功能和结果查看功能都开放。新注册用户一个月全功能试用期。购买客户到期后自动转换为该类客户，数据除能够共享到技术支持外，不能分享到其他账号）</span></div>
                                                    </div>
                                                </div>
                                                <div class="easiPurchasePackageBtns">
                                                    <button type="button" class="easiPurchasePackageBtnBlue">购前咨询</button>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="easiPurchasePackageName">基本版</div>
                                                <div class="easiPurchasePackageTip">适用于灵活仿真计划用户</div>
                                                <div class="easiPurchasePackagePrice">
                                                    <ul class="easiPurchasePackagePriceUl">
                                                        <li>
                                                            <div class="easiPurchasePackagePriceCheck easiPurchasePackagePriceCheckOn">
                                                                <div class="easiPurchasePackagePriceCheckIn"></div>
                                                            </div>
                                                            <div class="easiPurchasePackagePriceNumber">
                                                                <span>1天</span>
                                                                <span>50元</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="easiPurchasePackagePriceCheck">
                                                                <div class="easiPurchasePackagePriceCheckIn"></div>
                                                            </div>
                                                            <div class="easiPurchasePackagePriceNumber">
                                                                <span>1月(30天)</span>
                                                                <span>300元</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="easiPurchasePackagePriceCheck">
                                                                <div class="easiPurchasePackagePriceCheckIn"></div>
                                                            </div>
                                                            <div class="easiPurchasePackagePriceNumber">
                                                                <span>1年(365天)</span>
                                                                <span>2500元</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="easiPurchasePackageBtns">
                                                    <button type="button" class="easiPurchasePackageBtnBlue">购前咨询</button>
                                                    <button type="button" class="easiPurchasePackageBtnRed">立即购买</button>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="easiPurchasePackageName">进阶版</div>
                                                <div class="easiPurchasePackageTip">适用于灵活仿真计划用户</div>
                                                <div class="easiPurchasePackagePrice">
                                                    <ul class="easiPurchasePackagePriceUl">
                                                        <li>
                                                            <div class="easiPurchasePackagePriceCheck">
                                                                <div class="easiPurchasePackagePriceCheckIn"></div>
                                                            </div>
                                                            <div class="easiPurchasePackagePriceNumber">
                                                                <span>1天</span>
                                                                <span>100元</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="easiPurchasePackagePriceCheck">
                                                                <div class="easiPurchasePackagePriceCheckIn"></div>
                                                            </div>
                                                            <div class="easiPurchasePackagePriceNumber">
                                                                <span>1月(30天)</span>
                                                                <span>500元</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="easiPurchasePackagePriceCheck">
                                                                <div class="easiPurchasePackagePriceCheckIn"></div>
                                                            </div>
                                                            <div class="easiPurchasePackagePriceNumber">
                                                                <span>1年(365天)</span>
                                                                <span>5000元</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="easiPurchasePackageBtns">
                                                    <button type="button" class="easiPurchasePackageBtnBlue">购前咨询</button>
                                                    <button type="button" class="easiPurchasePackageBtnRed">立即购买</button>
                                                </div>
                                            </li>
                                        </ul>
                                        <div class="easiPurchasePackageLine">
                                            <div class="easiPurchasePackageLineIn">
                                            </div>
                                        </div>
                                        <ul>
                                            <li>
                                                <div class="easiPurchasePackageName">专业版</div>
                                                <div class="easiPurchasePackageTip">适用于小型企业用户</div>
                                                <div class="easiPurchasePackagePrice">
                                                    <div class="easiPurchasePackagePriceIn"><span>￥25000/年</span></div>
                                                </div>
                                                <div class="easiPurchasePackageBtns">
                                                    <button type="button" class="easiPurchasePackageBtnBlue">购前咨询</button>
                                                    <button type="button" class="easiPurchasePackageBtnRed">立即购买</button>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="easiPurchasePackageName">商务版</div>
                                                <div class="easiPurchasePackageTip">适用于中小型企业用户</div>
                                                <div class="easiPurchasePackagePrice">
                                                    <div class="easiPurchasePackagePriceIn"><span>￥62500/年</span></div>
                                                </div>
                                                <div class="easiPurchasePackageBtns">
                                                    <button type="button" class="easiPurchasePackageBtnBlue">购前咨询</button>
                                                    <button type="button" class="easiPurchasePackageBtnRed">立即购买</button>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="easiPurchasePackageName">旗舰版</div>
                                                <div class="easiPurchasePackageTip">适用于大中型企业用户</div>
                                                <div class="easiPurchasePackagePrice">
                                                    <div class="easiPurchasePackagePriceIn"><span>联系销售询价</span></div>
                                                </div>
                                                <div class="easiPurchasePackageBtns">
                                                    <button type="button" class="easiPurchasePackageBtnBlue">购前咨询</button>
                                                    <button type="button" class="easiPurchasePackageBtnDisable">立即购买</button>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="easiPurchaseTitle1">
                                        <span>套餐服务明细</span>
                                    </div>
                                    <div class="easiPurchaseTableOut">
                                        <div class="easiPurchaseTable">
                                            <div class="easiPurchaseThead easiPurchaseTheadPc">
                                                <div class="easiPurchaseTableLeft"></div>
                                                <div class="easiPurchaseTableRight">
                                                    <div class="easiPurchaseCol1"><span>EMonline服务明细</span></div>
                                                    <div class="easiPurchaseCol2">
                                                        <div>体验版</div>
                                                        <div class="easiPurchaseColDown">（新注册用户）</div>
                                                    </div>
                                                    <div class="easiPurchaseCol3"><span>体验版</span></div>
                                                    <div class="easiPurchaseCol4"><span>基本版</span></div>
                                                    <div class="easiPurchaseCol5"><span>进阶版</span></div>
                                                    <div class="easiPurchaseCol6"><span>专业版</span></div>
                                                    <div class="easiPurchaseCol7"><span>商务版</span></div>
                                                    <div class="easiPurchaseCol8"><span>旗舰版</span></div>
                                                </div>
                                            </div>
                                            <div class="easiPurchaseThead easiPurchaseTheadMobile">
                                                <div class="easiPurchaseTableLeft"></div>
                                                <div class="easiPurchaseTableRight">
                                                    <div class="easiPurchaseCol1"><span>磁路法</span></div>
                                                    <div class="easiPurchaseCol2">
                                                        <div>体验版</div>
                                                        <div class="easiPurchaseColDown">（新注册用户）</div>
                                                    </div>
                                                    <div class="easiPurchaseCol3"><span>体验版</span></div>
                                                    <div class="easiPurchaseCol4"><span>基本版</span></div>
                                                    <div class="easiPurchaseCol5"><span>进阶版</span></div>
                                                    <div class="easiPurchaseCol6"><span>专业版</span></div>
                                                    <div class="easiPurchaseCol7"><span>商务版</span></div>
                                                    <div class="easiPurchaseCol8"><span>旗舰版</span></div>
                                                </div>
                                            </div>
                                            <div class="easiPurchaseTbody">
                                                <div class="easiPurchaseTableLeft">磁路法</div>
                                                <ul class="easiPurchaseTableRight easiPurchaseTableEven">
                                                    <li>
                                                        <div class="easiPurchaseCol1">
                                                            <div class="easiPurchaseMotorUlCon">
                                                                <div class="flexDiv easiPurchaseMotorUlCtrl">
                                                                    <span>20种电机类型</span><i class="fa fa-angle-double-down" aria-hidden="true"></i>
                                                                </div>
                                                                <ul class="easiPurchaseMotorUl">
                                                                    <!-- <li class="dropdown-header">感应电机</li> -->
                                                                    <li>鼠笼式三相感应电机</li>
                                                                    <li>变频鼠笼感应电动机</li>
                                                                    <li>单相感应电机</li>
                                                                    <li>绕线式三相感应电机</li>
                                                                    <li>绕线式变频感应电机</li>
                                                                    <li>双馈异步电动机</li>
                                                                    <li>双馈异步发电机</li>
                                                                    <!-- <li class="dropdown-header">同步电机</li> -->
                                                                    <li>交流永磁同步电动机</li>
                                                                    <li>无刷永磁直流电机</li>
                                                                    <li>交流永磁同步发电机</li>
                                                                    <li>电励磁同步发电机</li>
                                                                    <li>电励磁同步电动机</li>
                                                                    <li>隐极同步电动机</li>
                                                                    <li>隐极同步发电机</li>
                                                                    <li>自起动永磁同步电机</li>
                                                                    <!-- <li class="dropdown-header">直流电机</li> -->
                                                                    <li>电励磁直流电动机</li>
                                                                    <li>电励磁直流发电机</li>
                                                                    <li>永磁直流电动机</li>
                                                                    <!-- <li class="dropdown-header">其他类型</li> -->
                                                                    <li>开关磁阻电机</li>
                                                                    <li>串激电机</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="easiPurchaseCol2"><span>全电机类型</span></div>
                                                        <div class="easiPurchaseCol3"><span><!-- 购买 --></span></div>
                                                        <div class="easiPurchaseCol4"><span>任选1种</span></div>
                                                        <div class="easiPurchaseCol5"><span>任选1种</span></div>
                                                        <div class="easiPurchaseCol6"><span>任选1种</span></div>
                                                        <div class="easiPurchaseCol7"><span>任选1种</span></div>
                                                        <div class="easiPurchaseCol8"><span>不限</span></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>磁路法计算后自动生成报表</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol5"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>磁路法参数化优化设计</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol5"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>场路耦合计算</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol5"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>本地化材料库</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol4"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol5"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>磁路法模型自动生成有限元模型</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol4"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol5"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="easiPurchaseThead easiPurchaseTheadMobile">
                                                <div class="easiPurchaseTableLeft"></div>
                                                <div class="easiPurchaseTableRight">
                                                    <div class="easiPurchaseCol1"><span>虚拟试验</span></div>
                                                    <div class="easiPurchaseCol2">
                                                        <div>体验版</div>
                                                        <div class="easiPurchaseColDown">（新注册用户）</div>
                                                    </div>
                                                    <div class="easiPurchaseCol3"><span>体验版</span></div>
                                                    <div class="easiPurchaseCol4"><span>基本版</span></div>
                                                    <div class="easiPurchaseCol5"><span>进阶版</span></div>
                                                    <div class="easiPurchaseCol6"><span>专业版</span></div>
                                                    <div class="easiPurchaseCol7"><span>商务版</span></div>
                                                    <div class="easiPurchaseCol8"><span>旗舰版</span></div>
                                                </div>
                                            </div>
                                            <div class="easiPurchaseTbody">
                                                <div class="easiPurchaseTableLeft">虚拟试验</div>
                                                <ul class="easiPurchaseTableRight easiPurchaseTableEven">
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>静磁场计算</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol4"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol5"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1">空载虚拟试验</div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol5"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1">负载虚拟试验</div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol5"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1">堵转虚拟试验</div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol5"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>短路虚拟试验</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1">故障虚拟实验</div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>多运动体分析</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>非线性永磁体动态退磁计算</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>磁钢涡流损耗分析计算</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>齿槽力矩计算</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>空载反电势及FFT分析求解</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>静磁场有限元参数化优化设计</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>瞬磁场有限元参数化优化设计</span></div>
                                                        <div class="easiPurchaseCol2">免费2000个</div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="easiPurchaseThead easiPurchaseTheadMobile">
                                                <div class="easiPurchaseTableLeft"></div>
                                                <div class="easiPurchaseTableRight">
                                                    <div class="easiPurchaseCol1"><span>其他有限元计算</span></div>
                                                    <div class="easiPurchaseCol2">
                                                        <div>体验版</div>
                                                        <div class="easiPurchaseColDown">（新注册用户）</div>
                                                    </div>
                                                    <div class="easiPurchaseCol3"><span>体验版</span></div>
                                                    <div class="easiPurchaseCol4"><span>基本版</span></div>
                                                    <div class="easiPurchaseCol5"><span>进阶版</span></div>
                                                    <div class="easiPurchaseCol6"><span>专业版</span></div>
                                                    <div class="easiPurchaseCol7"><span>商务版</span></div>
                                                    <div class="easiPurchaseCol8"><span>旗舰版</span></div>
                                                </div>
                                            </div>
                                            <div class="easiPurchaseTbody">
                                                <div class="easiPurchaseTableLeft">其他有限元计算</div>
                                                <ul class="easiPurchaseTableRight easiPurchaseTableEven">
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>有限元手动自由建模</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>DXF导入</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>DXF导出</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>有限元功效特性计算</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>曲线后处理</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>斜槽二维计算</span></div>
                                                        <div class="easiPurchaseCol2"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol3"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- <span>购买</span> --></div>
                                                        <div class="easiPurchaseCol6"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>交直轴电感闪算</span></div>
                                                        <div class="easiPurchaseCol2">免费5次</div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>Map图闪算（只限永磁同步电机）</span></div>
                                                        <div class="easiPurchaseCol2">免费5次</div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol7">免费500次</div>
                                                        <div class="easiPurchaseCol8">免费2000次</div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>控制算法/外部控制电路</span></div>
                                                        <div class="easiPurchaseCol2">免费5次</div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol7"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>振动噪声分析试验</span></div>
                                                        <div class="easiPurchaseCol2">免费3次</div>
                                                        <div class="easiPurchaseCol3">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol4">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol5">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol6">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol7">
                                                            <!-- 购买 -->
                                                        </div>
                                                        <div class="easiPurchaseCol8"><img src="static/images/common/index/purchaseCorrect.png"></div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="easiPurchaseThead easiPurchaseTheadMobile">
                                                <div class="easiPurchaseTableLeft"></div>
                                                <div class="easiPurchaseTableRight">
                                                    <div class="easiPurchaseCol1"><span>账户</span></div>
                                                    <div class="easiPurchaseCol2">
                                                        <div>体验版</div>
                                                        <div class="easiPurchaseColDown">（新注册用户）</div>
                                                    </div>
                                                    <div class="easiPurchaseCol3"><span>体验版</span></div>
                                                    <div class="easiPurchaseCol4"><span>基本版</span></div>
                                                    <div class="easiPurchaseCol5"><span>进阶版</span></div>
                                                    <div class="easiPurchaseCol6"><span>专业版</span></div>
                                                    <div class="easiPurchaseCol7"><span>商务版</span></div>
                                                    <div class="easiPurchaseCol8"><span>旗舰版</span></div>
                                                </div>
                                            </div>
                                            <div class="easiPurchaseTbody">
                                                <div class="easiPurchaseTableLeft">账户</div>
                                                <ul class="easiPurchaseTableRight easiPurchaseTableEven">
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>账户数</span></div>
                                                        <div class="easiPurchaseCol2">1个</div>
                                                        <div class="easiPurchaseCol3">1个</div>
                                                        <div class="easiPurchaseCol4">1个</div>
                                                        <div class="easiPurchaseCol5">1个</div>
                                                        <div class="easiPurchaseCol6">1个</div>
                                                        <div class="easiPurchaseCol7">3个</div>
                                                        <div class="easiPurchaseCol8">10个</div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>存储空间</span></div>
                                                        <div class="easiPurchaseCol2">2G</div>
                                                        <div class="easiPurchaseCol3">2G</div>
                                                        <div class="easiPurchaseCol4">2G</div>
                                                        <div class="easiPurchaseCol5">10G</div>
                                                        <div class="easiPurchaseCol6">300G</div>
                                                        <div class="easiPurchaseCol7">800G</div>
                                                        <div class="easiPurchaseCol8">3T</div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>并发计算任务数</span></div>
                                                        <div class="easiPurchaseCol2">不限</div>
                                                        <div class="easiPurchaseCol3">不限</div>
                                                        <div class="easiPurchaseCol4">1个</div>
                                                        <div class="easiPurchaseCol5">1个</div>
                                                        <div class="easiPurchaseCol6">3个</div>
                                                        <div class="easiPurchaseCol7">5个</div>
                                                        <div class="easiPurchaseCol8">10个</div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>同时打开项目数</span></div>
                                                        <div class="easiPurchaseCol2">不限</div>
                                                        <div class="easiPurchaseCol3">不限</div>
                                                        <div class="easiPurchaseCol4">2个</div>
                                                        <div class="easiPurchaseCol5">3个</div>
                                                        <div class="easiPurchaseCol6">不限</div>
                                                        <div class="easiPurchaseCol7">不限</div>
                                                        <div class="easiPurchaseCol8">不限</div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>批量提交任务数</span></div>
                                                        <div class="easiPurchaseCol2">1个</div>
                                                        <div class="easiPurchaseCol3">1个</div>
                                                        <div class="easiPurchaseCol4">2个</div>
                                                        <div class="easiPurchaseCol5">3个</div>
                                                        <div class="easiPurchaseCol6">8个</div>
                                                        <div class="easiPurchaseCol7">10个</div>
                                                        <div class="easiPurchaseCol8">15个</div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="easiPurchaseThead easiPurchaseTheadMobile">
                                                <div class="easiPurchaseTableLeft"></div>
                                                <div class="easiPurchaseTableRight">
                                                    <div class="easiPurchaseCol1"><span>设计咨询服务</span></div>
                                                    <div class="easiPurchaseCol2">
                                                        <div>体验版</div>
                                                        <div class="easiPurchaseColDown">（新注册用户）</div>
                                                    </div>
                                                    <div class="easiPurchaseCol3"><span>体验版</span></div>
                                                    <div class="easiPurchaseCol4"><span>基本版</span></div>
                                                    <div class="easiPurchaseCol5"><span>进阶版</span></div>
                                                    <div class="easiPurchaseCol6"><span>专业版</span></div>
                                                    <div class="easiPurchaseCol7"><span>商务版</span></div>
                                                    <div class="easiPurchaseCol8"><span>旗舰版</span></div>
                                                </div>
                                            </div>
                                            <div class="easiPurchaseTbody">
                                                <div class="easiPurchaseTableLeft">设计咨询服务</div>
                                                <ul class="easiPurchaseTableRight easiPurchaseTableOdd">
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>电磁方案校核服务</span></div>
                                                        <div class="easiPurchaseCol2">联系销售</div>
                                                        <div class="easiPurchaseCol3">联系销售</div>
                                                        <div class="easiPurchaseCol4">联系销售</div>
                                                        <div class="easiPurchaseCol5">联系销售</div>
                                                        <div class="easiPurchaseCol6">联系销售</div>
                                                        <div class="easiPurchaseCol7">1个</div>
                                                        <div class="easiPurchaseCol8">1个</div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>热分析服务</span></div>
                                                        <div class="easiPurchaseCol2">联系销售</div>
                                                        <div class="easiPurchaseCol3">联系销售</div>
                                                        <div class="easiPurchaseCol4">联系销售</div>
                                                        <div class="easiPurchaseCol5">联系销售</div>
                                                        <div class="easiPurchaseCol6">联系销售</div>
                                                        <div class="easiPurchaseCol7">联系销售</div>
                                                        <div class="easiPurchaseCol8">联系销售</div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>振动噪声分析服务</span></div>
                                                        <div class="easiPurchaseCol2">联系销售</div>
                                                        <div class="easiPurchaseCol3">联系销售</div>
                                                        <div class="easiPurchaseCol4">联系销售</div>
                                                        <div class="easiPurchaseCol5">联系销售</div>
                                                        <div class="easiPurchaseCol6">联系销售</div>
                                                        <div class="easiPurchaseCol7">联系销售</div>
                                                        <div class="easiPurchaseCol8">联系销售</div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>其他设计咨询(改型设计，优化设计等)</span></div>
                                                        <div class="easiPurchaseCol2">联系销售</div>
                                                        <div class="easiPurchaseCol3">联系销售</div>
                                                        <div class="easiPurchaseCol4">联系销售</div>
                                                        <div class="easiPurchaseCol5">联系销售</div>
                                                        <div class="easiPurchaseCol6">联系销售</div>
                                                        <div class="easiPurchaseCol7">联系销售</div>
                                                        <div class="easiPurchaseCol8">1个改型设计</div>
                                                    </li>
                                                    <li>
                                                        <div class="easiPurchaseCol1"><span>培训服务</span></div>
                                                        <div class="easiPurchaseCol2">联系销售</div>
                                                        <div class="easiPurchaseCol3">联系销售</div>
                                                        <div class="easiPurchaseCol4">联系销售</div>
                                                        <div class="easiPurchaseCol5">联系销售</div>
                                                        <div class="easiPurchaseCol6">联系销售</div>
                                                        <div class="easiPurchaseCol7">1天在线培训</div>
                                                        <div class="easiPurchaseCol8">2天现场培训</div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="easiPurchaseContact">
                                        <div><span>若以上套餐方案，无法满足您的需求或者无法确定哪种套餐适合自己？</span></div>
                                        <div><span>致电0571-85464125，为您服务</span></div>
                                    </div>
                                </div>

                                <!-- 尾部开始 -->
                                <%@ include file="/WEB-INF/views/common/index/indexFooter200608.jsp"%>
                                    <!-- 尾部结束 -->

                                    <script>
                                        $(".easiPurchasePackagePriceCheck").click(function() {
                                            $(this).addClass("easiPurchasePackagePriceCheckOn");
                                            $(this).parent("li").siblings().find(".easiPurchasePackagePriceCheck").removeClass("easiPurchasePackagePriceCheckOn");
                                        });

                                        $(".easiPurchaseMotorUlCon").hover(
                                            function() {
                                                $(this).find(".easiPurchaseMotorUl").show();
                                                $(this).find(".easiPurchaseMotorUlCtrl").addClass("easiPurchaseMotorUlCtrlOn");
                                            },
                                            function() {
                                                $(this).find(".easiPurchaseMotorUl").hide();
                                                $(this).find(".easiPurchaseMotorUlCtrl").removeClass("easiPurchaseMotorUlCtrlOn");
                                            }
                                        );
                                    </script>
                        </body>
                        <%@ include file="/static/common/emOnline/commJsFileSimple.jsp"%>

                        </html>