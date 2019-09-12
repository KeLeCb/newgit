<%--
  Created by IntelliJ IDEA.
  User: cb
  Date: 2019/9/5
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css"
          href="extjs6/build/classic/theme-crisp/resources/theme-crisp-all.css" />
    <link rel="stylesheet" type="text/css"
          href="extjs6/build/classic/theme-crisp/resources/theme-crisp-all-debug.css" />
    <script src="extjs6/build/ext-all.js"></script>
    <script src="extjs6/build/ext-debug.js"></script>
    <script src="extjs6/build/classic/locale/locale-zh_CN.js"></script>
    <script src="extjs6/ext-bootstrap.js"></script>
    <script >
        Ext.onReady(function () {
            Ext.Viewport.add({
                xtype: 'panel',
                html: 'Hello World!',

            });

        })
    </script>
</head>
<body>
<%--<img src="images/04.png">--%>
</body>
</html>
