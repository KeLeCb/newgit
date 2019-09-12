Ext.Loader.setConfig({enabled:true});
Ext.application({
		name:'HT',
		appFolder:'app',

		launch:function() {    //函数的执行顺序  Ext.application中的controller中的init : function() 在执行launch
	        Ext.create('Ext.container.Viewport', {

				layout:'border',    //border布局的使用  分别调用不同的js
	            items: [{
	            			xtype:'top'
	            		},{
	                    	xtype:'accordion'
	                    },{
	                    	xtype:'center'
	                    },{
	                    	xtype:'bottom'
	                    }
	            ]
	        });
	    },
	    controllers:['Controllers']   //连接controller
	}
);