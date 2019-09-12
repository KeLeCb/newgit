<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css"
          href="extjs6/build/classic/theme-crisp/resources/theme-crisp-all.css" />
    <link rel="stylesheet" type="text/css"
          href="extjs6/build/classic/theme-crisp/resources/theme-crisp-all-debug.css" />
    <script src="extjs6/build/ext-all.js"></script>
    <script src="extjs6/build/ext-debug.js"></script>
    <script src="extjs6/build/classic/locale/locale-zh_CN.js"></script>
    <script src="extjs6/ext-bootstrap.js"></script>
    <script type="text/javascript " src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        Ext.onReady(function(){
            var northItem={
                region:'north',//如果采用border布局，这个项一定要有
                title:"标题"
            };
            //树状图
            var store=Ext.create('Ext.data.TreeStore',{
                root:{//树状图有且只有一个树根
                    expanded:true,//这树状图是可以打开叶子的
                    children:[
                        {
                            text:'大项目1',
                            expanded:true,
                            children:[
                                {
                                    id:1,//为下面的监听事件所使用，且ID为1
                                    text:'项目1',
                                    leaf:true//表明这里是叶子，不再向下延伸，同时为下面的监听器所操作
                                },
                                {
                                    id:2,
                                    text:'项目2',
                                    leaf:true
                                },
                                {
                                    id:3,
                                    text:'项目3',
                                    leaf:true
                                }
                            ]
                        },
                        {
                            text:'大项目2',
                            expanded:true,
                            children:[
                                {
                                    id:4,
                                    text:'项目4',
                                    leaf:true
                                },
                                {
                                    id:5,
                                    text:'项目5',
                                    leaf:true
                                }
                            ]
                        }
                    ]
                }
            });
            var westItem={
                region:'west',
                xtype:'treepanel',
                store:store,//添加树状图
                width:200,//这里一定要设置好宽度，否则不显示
                rootVisible:false,//不显示树根
                split:true,//可以自己调整其大小
                collapsible:true,//可以折叠
                listeners:{
                    //如果项被点击的话
                    itemclick:function(view,record,item){
                        //如果是叶子，对应上面的leaf==true
                        if(record.data.leaf){
                            //如果没有与当前点击项目i  d相同的的标签页的话  getCmp 返回一个ext组件
                            if(!Ext.getCmp(record.data.id)){
                                //则新建一个与当前点击项目id相同的的标签页
                                console.log(Ext.getCmp("centerItem")+"123")
                                Ext.getCmp("centerItem").add({

                                    title:record.data.text,
                                    html:Ext.util.Format.date(new Date(),'H时i分s秒')+"",
                                    listeners:{
                                        //为这个标签页的关闭增加监听事件
                                        removed:function(){
                                            //在状态栏中删除原有的信息，添加新的操作信息
                                            Ext.getCmp("southItem").removeAll();
                                            Ext.getCmp("southItem").add({html:'关闭了：'+record.data.text+"！"});
                                        },
                                        activate:function(){
                                            Ext.getCmp("southItem").removeAll();
                                            Ext.getCmp("southItem").add({html:'点击了：'+record.data.text+"！"});
                                        }},
                                    closable:true//允许关闭，同时新建关闭按钮
                                });
                            }
                            //有没有这个标签页都激活这个标签页
                            Ext.getCmp("centerItem").setActiveTab(record.data.id);
                            //然后在状态栏中删除原有的信息，添加新的操作信息
                            Ext.getCmp("southItem").removeAll();
                            Ext.getCmp("southItem").add({html:'点击了：'+record.data.text+"！"});
                        }
                    }
                }
            };
            var southItem={
                region:'south',
                xtype:'panel',
                id:'southItem',
                title:'操作信息',
                collapsible:true//可以折叠
            };
            var eastItem={
                region:'east',

            };
            var centerItem={
                region:'center',
                id:'centerItem',
                xtype:'tabpanel'
            };
            Ext.create('Ext.container.Viewport',{
                layout:'border',
                renderTo:Ext.getBody(),
                items:[northItem,westItem,southItem,eastItem,centerItem]
            });
        })

    </script>
</head>
<body>

</body>
</html>