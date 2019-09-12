<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台登录YT-数码</title>
<link rel="stylesheet" type="text/css"
	href="extjs6/build/classic/theme-crisp/resources/theme-crisp-all.css" />
<link rel="stylesheet" type="text/css"
	href="extjs6/build/classic/theme-crisp/resources/theme-crisp-all-debug.css" />
<script src="extjs6/build/ext-all.js"></script>
<script src="extjs6/build/ext-debug.js"></script>
<script src="extjs6/build/classic/locale/locale-zh_CN.js"></script>
<script src="extjs6/ext-bootstrap.js"></script>
<script type="text/javascript" src="extjs6/TreePicker.js"></script>
<script type="text/javascript " src="js/jquery-3.3.1.js"></script>
<script>
	Ext.onReady(function() {
        Ext.QuickTips.init();
		var data;
		var page;
		    //1.定义Model
		 Ext.define("MyApp.model.User", {
		        extend: "Ext.data.Model",
		        fields: [   //定义每个字段的格式
		            { name: 'uid', type: 'string' },
		            { name: 'uname', type: 'string' },
		            { name: 'name', type: 'string' },
		            { name: 'password', type: 'string' },
		            { name: 'gender', type: 'string' },
		            { name: 'birthday', type: 'string' },
		            { name: 'email', type: 'string' },
		            { name: 'phone', type: 'string' },
		        ],
		    });


		    //2.创建store
	    var store = Ext.create("Ext.data.Store", {
		        model: "MyApp.model.User",
		        pageSize: 15,
		        proxy: new Ext.data.HttpProxy({ // 由 extjs 框架函数代替ajax 进行接收数据
                url:"${pageContext.request.contextPath}/UserServlet?method=select",
                method: 'POST',
                jsonData: {CurPageIndex: 0 },
                reader: {
                    type: "json",
                    rootProperty: 'rows',       //后台接收到的数据值
                    totalProperty: 'total',     //后台传过来的参数
                }
            }),
                autoLoad: false,
		    });


        // 定义原有的选项面板

        var index=0;
		//定义树形结构
        var treestore=Ext.create('Ext.data.TreeStore',{
            root:{//树状图有且只有一个树根
                expanded:true,//这树状图是可以打开叶子的
                children:[
                    {
                        text:'会员管理',
                        expanded:true,
                        children:[
                            {
                                id:1,//为下面的监听事件所使用，且ID为1
                                text:'会员列表',
                                leaf:true,//表明这里是叶子，不再向下延伸，同时为下面的监听器所操作

                            }
                        ]
                    },
                    {
                        text:'订单管理',
                        expanded:true,
                        children:[
                            {
                                id:2,
                                text:'订单列表',
                                leaf:true
                            }
                        ]
                    },{
                        text:'商品管理',
                        expanded:true,
                        children:[
                            {
                                id:3,
                                text:'商品操作',
                                leaf:true
                            }
                        ]
					}
                ]
            }
        });
        //创建可编辑性表格
         var girdpan= new  Ext.grid.GridPanel({
             model: "MyApp.model.User",
             store: store,
             autoScroll:true,
             tbar:[
                 {text:"商品信息展示"},
                 "->",//用于浮动
                 {
                     xtype:"button",
                     text:"添加",
                     handler:function(){
                         var win1=	new Ext.Window({
                             title:"添加商品信息",
                             width:600,
                             height:300,
                             layout:"fit",
                             layout: "column",
                             items: [{
                                 columnWidth:.5,
                                 xtype: "form",
                                 name:"f2",
                                 bodyStyle:'padding:5px 5px 5px 5px;',
                                 margin: 6,
                                 border: false,
                                 fieldDefaults: {
                                     labelAlign: 'left',
                                     labelWidth: 90
                                 },
                                 items: [
                                     { xtype: "textfield", name: "uid", fieldLabel: "用户id" },
                                     { xtype: "textfield", name: "uname", fieldLabel: "用户昵称" },
                                     { xtype: "textfield", name: "name", fieldLabel: "用户姓名" },
                                     { xtype: "textfield", name: "password", fieldLabel: "用户密码" },
                                     { xtype: "textfield", name: "gender", fieldLabel: "用户性别" },
                                     { xtype: "textfield", name: "birthday", fieldLabel: "用户生日" ,emptyText: '请采用 年-月-日 的格式',},
                                     { xtype: "textfield", name: "email", fieldLabel: "用户邮箱" },
                                 ]
                             },{
                                 columnWidth:.5,
                                 xtype: "form",
                                 name:"f1",
                                 id:"f2",
                                 bodyStyle:'padding:5px 5px 5px 5px;',
                                 margin: 6,
                                 border: false,
                                 fieldDefaults: {
                                     labelAlign: 'left',
                                     labelWidth: 90
                                 },
                                 items: [
                                     { xtype: "textfield", name: "phone", fieldLabel: "用户电话" },
                                 ],
                             }],
                             buttons:[{
                                 text:"重置",handler:function(){
                                     win1.down("form").getForm().reset();
                                     win1.down("#f2").getForm().reset();
                                 }
                             },{
                                 text: "保存", handler: function () {
                                     var uid=  win1.down("form").getForm().findField("uid").getValue();
                                     var uname=  win1.down("form").getForm().findField("uname").getValue();
                                     var name=  win1.down("form").getForm().findField("name").getValue();
                                     var password=  win1.down("form").getForm().findField("password").getValue();
                                     var gender=  win1.down("form").getForm().findField("gender").getValue();
                                     var birthday=  win1.down("form").getForm().findField("birthday").getValue();
                                     var email=  win1.down("form").getForm().findField("email").getValue();
                                     var phone=  win1.down("#f2").getForm().findField("phone").getValue();
                                     $.ajax({
                                         url:"${pageContext.request.contextPath}/UserServlet?method=insert",
                                         data:{
                                             "uid":uid,
                                             "uname":uname,
                                             "name":name,
                                             "gender":gender,
                                             "birthday":birthday,
                                             "password":password,
                                             "email":email,
                                             "phone":phone,

                                         },
                                         success:function(res){
                                             win1.close();
                                             window.location.reload();
                                             Ext.Msg.alert("添加","添加成功");
                                         }
                                     })
                                 },
                             }]
                         }).show();
                     }
                 }],
             columns: [
                 {  dataIndex: "uid", text: "用户id" },
                 {  dataIndex: "uname", text: "用户昵称" ,width:150},
                 {  dataIndex: "name", text: "用户名" },
                 {  dataIndex: "password", text: "用户密码" },
                 {  dataIndex: "gender", text: "用户性别" },
                 {  dataIndex: "birthday", text: "用户生日" ,xtype: 'datecolumn', format:'Y年m月d日',width:150},
                 {  dataIndex: "email", text: "用户邮箱" ,width:200},
                 {  dataIndex: "phone", text: "用户电话" },{
                 renderder:function (value, cellmeta, record) {
                     var image='<input type="image" src="banner2.4.jpg">'

					 return image;
                 }
				 },
                 {  renderer: function(value, cellmeta, record) {
                     var	display='<input type="button" class="remove"  value="删除" />';
                     return display;
                 }
                 }
             ],
             listeners:{  //添加单击的监听事件
                 cellClick : function(grid, td, cellIndex, record, tr, rowIndex, e, eOpts) {
                     var remove = e.getTarget('.remove');
                     if (remove) {
                         var flightdataNum = grid.getHeaderAtIndex(0).dataIndex;//当前行的第一列列名
                         var record = grid.getStore().getAt(rowIndex); //获取当前行
                         var data = record.get(flightdataNum);    //获取当前行第一列的值
                         console.log(data);
                         Ext.Msg.confirm("删除","你确认要删除这条信息吗",function(op){
                             if(op=='yes')
                                 $.ajax({
                                     url : "${pageContext.request.contextPath}/UserServlet?method=delete",
                                     data:{
                                         "id":data,
                                     },
                                     success : function(res) {
                                         window.location.reload();
                                     }
                                 });
                         })
                     }
                 }
             },
             bbar: [{
                 width:'100%',
                 pageSize: 15,
                 xtype: 'pagingtoolbar',
                 store: store,
                 displayMsg: '显示 {0} - {1} 条，共计 {2} 条',
                 emptyMsg: "没有数据",
                 beforePageText: "当前页",
                 afterPageText: "共{0}页",
                 displayInfo: true,
             }],
         });
         // 定义一个grid  来存放 图片
		function  img() {
            var grid3=Ext.grid.GridPanel({
                xtype: 'box', //或者xtype: 'component',
                width: 500, //图片宽度
                height: 400, //图片高度
                autoEl: {
                    tag: 'img',    //指定为img标签
                    src: 'banner2.4.jpg'    //指定url路径
                }
            })
			return grid3.autoEl.src;
        }

		//3.创建布局
	var viewport=new Ext.Viewport(
			{ 
				enableTabScroll : true, //允许出现滚动条
				layout : "border", //总体采用border布局
				items : [ {
					xtype : "tabpanel", //类型为选项面板
					region : "center", //居中
					items : [
						{
							title : " 商品信息",
							layout : "border", //border布局
							items : [
								{
									region : "west", // 向西
									width : 200,
									height : 200,
									layout : "fit", //card的布局
									layoutConfig : {
									animate : true
											}, //添加动画效果
									collapsible : true, //可折叠 允许伸缩
									  items:[
				                            {
                                                xtype:'treepanel',
                                                store:treestore,//添加树状图
                                                width:250,//这里一定要设置好宽度，否则不显示
                                                rootVisible:false,//不显示树根
                                                split:true,//可以自己调整其大小
                                                listeners: {
                                                    //如果项被点击的话
                                                    itemclick: function (view, record, item) {
                                                        //如果是叶子，对应上面的leaf==true
                                                        if (record.data.leaf) {
                                                            //如果没有与当前点击项目id相同的的标签页的话
                                                            if (!Ext.getCmp(record.data.id)) {
                                                                //则新建一个与当前点击项目id相同的的标签页
																if(record.data.id==1){
                                                                    Ext.getCmp("center").add({
                                                                        title: record.data.text,
																		items:girdpan,
                                                                        closable: true//允许关闭，同时新建关闭按钮
                                                                    });
                                                                    //有没有这个标签页都激活这个标签页
                                                                    Ext.getCmp("center").setActiveTab(record.data.id);
																}

                                                            }
                                                        }
                                                    }
                                                }
                                                }
										        ]
					},
											{
									region : "center",//居中
									layout : "fit", //填满布局
									items : [  
										{
										    xtype:"tabpanel",
											id:"center",
										}
								],
							}
							]
					}, {
						title : "商品操作",
						}, {
						title : "日常安排"
					} ]
							} ]
						});

        //4.添加双击编辑
        store.load({ params: { start: 0, limit: 16} })   //第一次传给后台的参数否则将会出现第一次报错的情况
			});
</script>
</head>
<body>

</body>
</html>