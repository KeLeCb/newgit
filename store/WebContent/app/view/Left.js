Ext.define('HT.view.Left',       //整个js 为发生作用
		{
			extend:'Ext.tree.Panel',  //如何导入6 的版本没有tree相关的方法 ， data.tree ; grid.tree

			title:'菜单',
			alias:'widget.lefttree',
			region:'west',
			width:200,
			height:300,
			rootVisible:true,
			root:{
				text:'第一章',
				expanded:true,
				children:[
					          {
					        	  text:'第一节',
					        	  leaf:false,
					        	  children:{
					        		  text:'第一个',
					        		  leaf:true
					        	  }
					          },{
					        	  text:'第二节',
					        	  leaf:false,
					        	  children:{
					        		  text:'第一个',
					        		  leaf:true
					        	  }
					          }
				          ]
			},
			initComponent:function(){
				this.callParent(arguments);
			}
		}
);