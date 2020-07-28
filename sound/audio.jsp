<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="myStr" prefix="myStr"%>
<%@ taglib uri="myHidden" prefix="myHidden"%>
<%@ taglib uri="mySelect" prefix="mySelect"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String baseEmIndexPath = com.ytd.comm.util.WebPathUtil.getBasePath(request);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- <base href="<%=baseEmIndexPath%>"> --%>
<meta name=renderer  content=webkit>
<head>
<!--页面说明：  首页  -->
<%@ include file="/static/common/emOnline/globalSimple.jsp"%>
<%@ include file="/static/common/emOnline/meta.jsp"%>
<title>EasiMotor Online</title>
<style type="text/css">

</style>
<!-- 外链样式 -->
<link href="static/css/emOnline/audio.css" rel="stylesheet" type="text/css" />
</head>
<body>
<myHidden:hidden strId="LBL_0000002313" />
    <div class="soundCon" id="soundCon">
        <div class="soundTitleLg">声音频谱分析</div>
        <div id="main" class="soundChart">
        </div>
        <div class="soundBtns">
            <button type="button">新增</button>
            <button type="button">删除</button>
        </div>

        <div class="soundThead">
            <div class="soundLeft"><i class="fa fa-long-arrow-up" aria-hidden="true"></i><span>频率</span><i class="fa fa-long-arrow-down" aria-hidden="true"></i></div>
            <div class="soundRight"><i class="fa fa-long-arrow-up" aria-hidden="true"></i><span>声功率级(分贝)</span><i class="fa fa-long-arrow-down" aria-hidden="true"></i></div>
        </div>
        <ul class="soundTbody">
            <!-- <li>
                    <div class="soundLeft"><input type="text" value="11"></div>
                    <div class="soundRight"><input type="text" value="22"></div>
                </li>
                <li>
                    <div class="soundLeft"><input type="text" value="11"></div>
                    <div class="soundRight"><input type="text" value="22"></div>
                </li> -->
        </ul>

        <ul class="soundCtrl">
            <li>
                <div class="soundCtrlClick" onclick="javascript:readOnlineSpectrum();"><i class="fa fa-refresh" aria-hidden="true"></i></div>
                <div class="soundCtrlText"><span>重置</span></div>
            </li>
            <li>
                <div class="soundCtrlClick" style="color:#f8981d; font-size:40px;" onclick="javascript:playOnlineAudio();"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                <div class="soundCtrlText"><span>播放</span></div>
            </li>
            <li>
                <div class="soundCtrlClick" onclick="javascript:exportAudio();"><i class="fa fa-download" aria-hidden="true"></i></div>
                <div class="soundCtrlText"><span>输出</span></div>
            </li>

        </ul>
    </div>
    <div style="display: none;">
        <form action="../audio/export.html" method="post" id="exportAudioForm">
            <input type="text" name="spectrum" id="spectrumdata" value="" />
        </form>
        <audio id="MyAudio" autoplay>您的浏览器不支持 audio 标签。</audio>
    </div>
    <script type="text/javascript" src="static/js/modules/ECharts/echarts.min.js"></script>
    <script>
        document.getElementById('soundCon').style.height = window.innerHeight + 'px';

        //声音数据全局变量
        var spectrumdata = [
            [300, 7.85955],
            [400, 11.5108],
            [600, 33.2578],
            [700, 7.56395],
            [800, 16.4926],
            [900, 13.1894],
            [1000, 6.91312],
            [1100, 3.60738],
            [1200, 26.1325],
            [1250, 12.5515],
            [1400, 8.73997],
            [1500, 3.21746],
            [1550, 19.3945],
            [1700, 3.26974],
            [1800, 11.788],
            [1850, 40.4579],
            [1950, 7.16492],
            [2000, 24.6723],
            [2050, 10.6105],
            [2100, 4.4821],
            [2150, 41.5744],
            [2250, 12.2813],
            [2300, 15.3445],
            [2400, 13.9827],
            [2450, 23.0866],
            [2500, 8.14844],
            [2750, 22.2316],
            [2850, 9.23366],
            [2900, 0.640908],
            [3000, 6.11812],
            [3100, 9.36545],
            [3200, 15.6873],
            [3250, 0.462011],
            [3300, 6.69199],
            [3350, 1.18378],
            [3450, 1.5659],
            [3500, 15.6901],
            [3600, 22.1515],
            [3650, 4.90473],
            [3700, 33.2941],
            [3750, 15.5014],
            [3800, 24.1046],
            [3850, 24.7286],
            [3900, 21.4024],
            [3950, 11.4202],
            [4000, 21.4653],
            [4050, 9.61241],
            [4100, 14.6175],
            [4150, 23.09],
            [4200, 25.8788],
            [4250, 13.4573],
            [4300, 36.9417],
            [4350, 7.897],
            [4400, 23.0538],
            [4450, 19.7918],
            [4500, 12.9944],
            [4550, 10.0408],
            [4600, 23.5726],
            [4700, 10.6256],
            [4750, 15.9241],
            [4800, 15.2801],
            [4900, 8.89523],
            [5000, 6.63981],
            [5050, 7.13641],
            [5100, 17.5505],
            [5150, 7.75611],
            [5300, 6.99667],
            [5350, 12.1125],
            [5450, 19.666],
            [5500, 6.27641],
            [5550, 36.0843],
            [5600, 13.9684],
            [5650, 19.3785],
            [5700, 28.6016],
            [5750, 18.0646],
            [5800, 13.7793],
            [5850, 34.742],
            [5900, 8.51909],
            [5950, 16.2821],
            [6000, 23.1275],
            [6100, 11.0543],
            [6200, 14.0564],
            [6250, 7.76308],
            [6300, 27.9884],
            [6350, 24.3602],
            [6400, 10.6534],
            [6450, 40.0707],
            [6550, 23.4213],
            [6700, 8.88231],
            [6750, 30.2287],
            [6850, 9.39361],
            [6900, 14.5614],
            [7300, 15.5877],
            [7450, 19.5291],
            [7500, 16.6167],
            [7550, 44.1041],
            [7600, 15.9403],
            [7650, 18.2999],
            [7700, 39.2762],
            [7750, 13.3867],
            [7800, 21.3787],
            [7850, 33.4979],
            [7900, 21.1904]
        ];

        //获取x轴y轴数据
        var datax = [],
            datay = []

        for (i = 0; i < spectrumdata.length; i++) {
            datax.push(spectrumdata[i][0]);
            datay.push(spectrumdata[i][1]);

            //渲染列表 
            var list = '<li><div class="soundLeft"><input type="text" readonly value="' + spectrumdata[i][0] + '"></div><div class="soundRight"><input type="text" readonly value="' + spectrumdata[i][1] + '"></div></li>';
            $(".soundTbody").append(list);

        }

        //柱状图
        var myChart = echarts.init(document.getElementById('main'));
        window.onresize = function() {
            myChart.resize();
        }
        option = {
            grid: {
                top: '8%',
                right: '8%',
                left: '12%',
                bottom: '16%'
            },
            tooltip: {},
            xAxis: [{
                type: 'category',
                color: '#59588D',
                data: datax,
                axisLabel: {
                    margin: 15,
                    color: '#999',
                    textStyle: {
                        fontSize: 16
                    },
                },
                axisLine: {
                    lineStyle: {
                        color: '#d2d2d2',
                    }
                },
                axisTick: {
                    show: false
                },
            }],
            yAxis: [{
                min: 0,
                max: 50,
                axisLabel: {
                    formatter: '{value}',
                    color: '#999',
                    textStyle: {
                        fontSize: 16
                    },
                },
                axisLine: {
                    lineStyle: {
                        color: 'rgba(107,107,107,0.37)',
                    }
                },
                axisTick: {
                    show: false
                },
                splitLine: {
                    lineStyle: {
                        color: 'rgba(131,101,101,0.2)',
                        type: 'dashed',
                    }
                }
            }],
            series: [{
                type: 'bar',
                data: datay,
                // barWidth: '50px',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: '#FF9A22' // 0% 处的颜色
                        }, {
                            offset: 1,
                            color: '#FFD56E' // 100% 处的颜色
                        }], false),
                        barBorderRadius: [0, 0, 0, 0],
                    }
                },
                label: {
                    show: true,
                    fontSize: 18,
                    fontWeight: 'bold',
                    position: 'top',
                    color: 'rgba(0,0,0,0)',
                }
            }]
        };
        myChart.setOption(option);

        //拿到声音数据
        function readOnlineSpectrum() {
            $.ajax({
                async: false,
                cache: false,
                type: 'POST',
                dataType: "Json",
                url: "http://10.136.101.128:8080/EMOnline" + "/vibNoise/getNoiseSpectrumData.html",
                data: {
                    nodeId: "5fe5b8a88fb0_vn2single_vn2load",
                    dbProjectId: 470,
                    dsnPath: "8168417c7eb2",
                    singleLocation: "s850"
                },
                error: function(XHR, TS) { //请求失败处理函数  
                    console.log("ajax error.");
                },
                success: function(data) { //请求成功后处理函数。
                    if (data.message == "success") {
                        spectrumdata = JSON.parse(data.resultJsonStr);
                        document.getElementById("spectrumdata").value = data.resultJsonStr;
                    } else {
                        console.log("getNoiseSpectrumData error:" + data.message);
                    }
                }
            });
        }

        //播放本地音频
        function playAudio() {
            var x = document.getElementById("MyAudio");
            x.src = "javasound.wav";
        }

        //播放线上音频
        function playOnlineAudio() {
            $.ajax({
                async: false,
                cache: false,
                type: 'POST',
                dataType: "Json",
                url: "http://10.136.101.128/EMOnline" + "/audio/generate.html",
                data: {
                    spectrum: JSON.stringify(spectrumdata)
                },
                error: function(XHR, TS) { //请求失败处理函数  
                    console.log("ajax error.");
                },
                success: function(data) { //请求成功后处理函数。
                    if (data.message == "success") {
                        var x = document.getElementById("MyAudio");
                        x.src = "data:audio/wav;base64," + data.wavData;
                    } else {
                        console.log("generate audio error:" + data.message);
                    }
                }
            });

        }

        //导出音频
        function exportAudio() {
            var data = document.getElementById("spectrumdata");
            data.value = JSON.stringify(spectrumdata);
            var form = document.getElementById("exportAudioForm");
            form.submit();
        }
    </script>
</body>
<%@ include file="/static/common/emOnline/commJsFileSimple.jsp"%>
</html>