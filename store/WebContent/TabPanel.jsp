<%--
  Created by IntelliJ IDEA.
  User: cb
  Date: 2019/9/4
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选项面板的测试</title>
    <link rel="stylesheet" type="text/css"
          href="extjs6/build/classic/theme-crisp/resources/theme-crisp-all.css" />
    <link rel="stylesheet" type="text/css"
          href="extjs6/build/classic/theme-crisp/resources/theme-crisp-all-debug.css" />
    <script src="extjs6/build/ext-all.js"></script>
    <script src="extjs6/build/ext-debug.js"></script>
    <script src="extjs6/build/classic/locale/locale-zh_CN.js"></script>
    <script src="extjs6/ext-bootstrap.js"></script>
    <script type="text/javascript " src="js/jquery-3.3.1.js"></script>
    <script>
        Ext.onReady(function () {
            Ext.QuickTips.init();
            var tabsDemo = new Ext.TabPanel({
                renderTo:Ext.getBody(),
                activeTab:0,
                height:700,
                frame:true,
                items:[{
                    title:'autoLoad为html简单页面演示',
                    html:'原来就有的标签页面',
                    autoLoad:{url:'tab1.htm',scripts:true}
                }]
            });
            var index = 0;
            Ext.get("newTab").on("click",function(){   //直接采用tab 的add方法进行调用
                tabsDemo.add({
                    title:'new tab',
                    id:'newtab'+index,
                    html:"newtab标签页面",
                    closable:true
                });
                tabsDemo.setActiveTab("newtab"+index);//设置新添加的标签为激活标签
                index++;
            });


        })

    </script>
</head>
<body>
<div>
    <a id="newTab" href="javascript:void(0)">添加新标签页</a>
</div>
</body>
</html>
