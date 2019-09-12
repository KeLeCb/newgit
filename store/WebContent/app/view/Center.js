Ext.define('HT.view.Center',{
		extend:'Ext.tab.Panel', //继承
		//layout:'fit',
		//注意 加上widget.
		alias:'widget.center',   //别名
		region:'center',        //border中的位置
		activeTab:0,
		items:[
		       {
		    	   title:'主页',
		    	   html:'欢迎使用后台管理系统 版本1.0'

		       }
		],
		initComponent:function(){
			this.callParent(arguments);   //用于调用父类或者子类中的方法
		}
		//initComponent这个方法是在Ext.Component的构造函数(constructor)中调用的，只有直接或间接继承自 Ext.Component的类才会在constructor里调用initComponent方法
	}
);